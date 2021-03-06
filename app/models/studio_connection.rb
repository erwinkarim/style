require "oci8"
require "uri"

class StudioConnection < ActiveRecord::Base
  validates_presence_of :username, :password, :oracle_host, :oracle_instance
  after_initialize :default_values

  def default_values
    self.port ||= 1521
  end

  #execute a sql statement, return an array of results
  def query sql_statement, *bindvars
    oracle = OCI8.new(self.username, self.password, "//#{self.oracle_host}:#{self.port}/#{self.oracle_instance}")
    cursor = oracle.exec(sql_statement, *bindvars)
    result = Array.new

    while r = cursor.fetch
      coll_hash = Hash.new
      index = 0
      r.each do |coll|
        coll_hash = coll_hash.merge({ cursor.column_metadata[index].name.to_sym => coll })
        index += 1
      end
      result << coll_hash
    end
    cursor.close
    oracle.logoff

    return result
  end

  # returns a hash of :collection_name => {:collection_property => value} given by the path in the repo
  def browse repo_name, path_name = "/" ,parent_guid = 0
      return_items = Hash.new

      if path_name == "/" then

        results = query "select
          name, id, guid, object_update_date, object_update_user
          from #{repo_name}.dbx_object
          where parent_guid is null"
        results.each do |line|
          return_items = return_items.merge( {
            line[:GUID].to_sym => { :name => line[:NAME].nil? ? "empty" : line[:NAME], :id => line[:ID], :guid => line[:GUID],
              :object_update_date => line[:OBJECT_UPDATE_DATE], :object_update_user => line[:OBJECT_UPDATE_USER]
            }
          })
        end
      else
        #path is given, need to traverse and find it to find the guid
        if parent_guid != 0 then
          #guid is given, makes the job a lot easier
          #Rails.logger.info "get stuff for guid #{parent_guid}"
          return_items = list_obj repo_name, parent_guid
        else
          #Rails.logger.info "can't find guid, need to traverse"
          parent_guid = get_guid(repo_name, path)
        end
      end

      return return_items
  end

  # returns a hash w/ { :guid => { :property => value, ... }} showing history of the object
  def show_history repo_name, object_guid
    return_items = Hash.new

    if object_guid.empty? or object_guid.nil? then
      return return_items
    end

    results = query "select id from #{repo_name}.dbx_object where guid = '#{object_guid}'"
    object_id = results.first[:ID]
    results = query "select guid, username, id, operation, endtime, insert_user
      from #{repo_name}.dovhistoryentry
      where object_id = #{object_id}
      order by id desc
      "
    results.each do |line|
      return_items = return_items.merge( {
        line[:GUID].to_sym => { :username => line[:USERNAME], :id => line[:ID], :operation => line[:OPERATION],
          :endtime => line[:ENDTIME] }
      } )
    end

    return return_items
  end

  #given a repo name and path, gets the child object guid
  # to handle cases where things in between are the same
  def get_guid repo_name, path
      # change from "/path/to/object.html?guid=xxxx" to "/path/to/object"
      cleaned = URI.decode( path.gsub(/\.html.*/, "").gsub(/^\//, "") )

      current_layer = path.split("/")[0]

      if current_layer.nil? then
        #already top level
        return nil
      else
        #get the top level guid and traverse
        return get_guid_traverse(repo_name, cleaned, nil)
      end
  end

  #show info dump based on guid
  # returns {:entity_id, :entity_tbl , < results of select * from repo_name.entity_tbl where id = entity_id> }
  def get_object_dump repo_name, guid
    entity_result = query("select entity_id, entity_tbl from #{repo_name}.dbx_object where guid = '#{guid}'").first
    if entity_result.nil? then
      return nil
    else
      result = query "select * from #{repo_name}.#{entity_result[:ENTITY_TBL]} where id = #{entity_result[:ENTITY_ID]}"
      return entity_result.merge(result.first)
    end
  end

  #get repo stats
  # updates the stats table
  # also return an array  of {:property => value}
  def get_stats repo_name
    results = query("select entity_tbl as entity, count(*) as entity_count from #{repo_name}.dbx_object group by entity_tbl")
    new_results = results.map do |x|
      translated_entry = StatHeader.lookup x[:ENTITY]
      if translated_entry.nil? then
        x.merge( { :ENTITY_TBL => x[:ENTITY], :ENTITY_CAT => "Uncategorized" } )
      else
        { :ENTITY => translated_entry[:display_name], :ENTITY_TBL => x[:ENTITY],
          :ENTITY_COUNT => x[:ENTITY_COUNT], :ENTITY_CAT => translated_entry[:category] }
      end
    end
    return new_results.sort{|x,y| x[:ENTITY_CAT] <=> y[:ENTITY_CAT]}
  end

  # check repo object structure for conformity to company standard
  # return a hash with { :conformity_parameter_1 => [paths, ...],
  #   :conformity_parameter_2 => [paths, ..] , :not_conform => [path that dont conform to any parameters]}
  def conformity_check repo_name
    #get this straight
    project_title = "[[:alnum:]]+"
    survey_name = "[[:graph:]]+"
    username = "[[:graph]]+"



  end

  # prototype to get list of object path recurvively around 3 levels deep
  # return an array of all paths at 3 level deep
  def tree repo_name
    #let oracle do the heavy lifting
    #result = query("select name, guid, parent_guid from #{repo_name}.dbx_object")
    result = query("
      select sys_connect_by_path(name, '~') path
      from #{repo_name}.dbx_object
      where level <= 5
      and connect_by_isleaf = case
      when level != 5 then 1 else 0
      end
      connect by prior guid=parent_Guid
      start with parent_Guid is null
      order siblings by name
    ")
    return result.collect{|x| x[:PATH] }
  end

  #query the dashbaord stats, return an array of dashboard id, name and results
  def dashboard
    dash_schema = self.query(
      "select max(username) as username from dba_users where username like 'SKS_DD_%'").first[:USERNAME]

    if !dash_schema.nil? then
      dashboard = self.query(
        "select id, name, remarks, dbms_lob.substr(sql_string, 4000, 1) as sql_string from #{dash_schema}.dbx_filter"
      )
    end
  end

  def dashboard_query query_id
    dash_schema = self.query(
      "select max(username) as username from dba_users where username like 'SKS_DD_%'").first[:USERNAME]

      if !dash_schema.nil? then
        sql_string = self.query(
          "select dbms_lob.substr(sql_string, 4000, 1) as sql_string
          from #{dash_schema}.dbx_filter
          where id = #{query_id}"
        )

        if sql_string.nil? then
          return nil
        else
          self.query(sql_string.first[:SQL_STRING])
        end

      end
  end

  # returns a hash of :collection_guid => {:collection_name => name, :collection_property => value}
  # given by the parent_guid in the repo
  def list_obj repo_name, parent_guid
    return_items = Hash.new

    results = query "select
      coll.name, coll.id, guid, object_update_date, object_update_user
      from #{repo_name}.dbx_object coll where coll.parent_guid = '#{parent_guid}'"
    results.each do |line|
      return_items = return_items.merge({
        line[:GUID].to_sym => {
          :name => line[:NAME], :id => line[:ID], :guid => line[:GUID], :object_update_date => line[:OBJECT_UPDATE_DATE],
          :object_update_user => line[:OBJECT_UPDATE_USER] }
      })
    end

    return return_items
  end

  # parent_guid can be nil or Array of GUIDs
  def get_guid_traverse repo_name, current_path, parent_guid
    splitted = current_path.split("/")
    current_layer = splitted[0]

    if parent_guid == nil then
      #thinks it's top level
      test_query = "select guid from #{repo_name}.dbx_object where parent_guid is null and name = '#{current_layer}'"
      result = query(test_query).map{|x| x[:GUID]}.flatten
    else
      # thinks it's intermeditery level
      test_query ="select guid from #{repo_name}.dbx_object where parent_guid in (#{parent_guid.map{|x| "'#{x}'"}.join(",")}) and name = '#{current_layer}'"
      #Rails.logger.info "query = #{test_query}"
      result = query(test_query).map{|x| x[:GUID]}.flatten
    end

    if result.nil? then
      return nil
    end

    if splitted.length > 1 then
      #confirm it's intermeditery, keep digging
      return get_guid_traverse repo_name, splitted[1..splitted.length-1].join("/"), result
    else
      #confirm it's at leaf of tree
      return result.first
    end

  end

  def user_allowed? current_user, repo_name
    if current_user.nil? then
      return false
    else
      if self.user_is_admin?(current_user) || current_user.admin? || current_user.username == ENV['DEFAULT_ADMIN'] then
        return true
      else
        credential = current_user.user_credentials.where(:studio_connection_id => self.id).first
        permission = self.query("select *
          from sks_sys.sds_pipe
          where sds_user = '#{credential.username.upcase}' and account = '#{repo_name.upcase}'" )
        return !permission.empty?
      end
    end
  end

  # an array of {
  #  :project => project_name, :model_version => version, :owner => project_owner, :create_date => date
  #  :modify_date => date, :crs => code:name
  # }
  def list_repo user
    #check if user is valid
    if !self.login_valid?(user) then
      return []
    end

    #user is valid, start check if user is admin, or got access to certain stuff only
    #if user is admin. display everything
    dd = self.query("select max(username) as username from dba_users where username like 'SKS_DD_%'").first[:USERNAME]
    if self.user_is_admin?(user) then
      return self.query("select
        project, model_version, owner, create_date, modify_date, coordinate_system||':'||name as coordinate_system
        from
        sks_sys.sds_project,
        #{dd}.r_coordinate_ref_system
        where
         coordinate_system = code
        order by project")
    else
      #otherwise, just display what is entitled
      credential = user.user_credentials.where(:studio_connection_id => self.id).first
      if credential.nil? || credential.username.empty? || credential.username.nil? then
        return []
      else
        return self.query("select
          project.project, project.model_version, project.owner,
          project.create_date, project.modify_date,
          project.coordinate_system||':'||crs.name as coordinate_system
          from
          sks_sys.sds_project project,
          sks_sys.sds_pipe pipe,
          #{dd}.r_coordinate_ref_system crs
          where
           project.coordinate_system = crs.code
           and pipe.sds_user = '#{credential.username.upcase}'
           and project.project = pipe.account
          order by project")
      end
    end
  end

  #check if user got Admin_All privilege in studio
  def user_is_admin? user
    #check if got credentials
    if user.admin? then
      return true
    end

    #user is not style admin. check if user got all_admin privs in studio
    # check credentials
    user_cred = user.user_credentials.where(:studio_connection_id => self.id).first
    if user_cred.nil? || user_cred.username.empty? || user_cred.username.nil? then
      return false
    else
      #check the credentials privs
      if !self.login_valid?(user) then
        return false
      end

      #check if using sks_admin
      if user_cred.username.upcase == "SKS_ADMIN" then
        return true
      end

      result = self.query("select privilege from sks_sys.sds_user where privilege = 'Admin_All' and account = '#{user_cred.username.upcase}'")
      if result.empty? then
        return false
      else
        return true
      end
    end
  end

  def login_valid? user
    #admin user uses
    if user.admin? then
      return true
    end
    cred = user.user_credentials.where(:studio_connection_id => self.id).first
    begin
      oracle = OCI8.new(cred.username, cred.password,"//#{self.oracle_host}:#{self.port}/#{self.oracle_instance}")
    rescue OCIError
      return false
    end
    return true
  end

  private :list_obj, :get_guid_traverse
end
