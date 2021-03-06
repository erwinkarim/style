# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

StatCategory.create([
  { :name => "Seismics"},
  { :name => "Wells"},
  { :name => "Shapes"},
  { :name => "Interpretations"},
  { :name => "Others"}
])

StatHeader.create([
  { :name => 'DOVWELLREFERENCELEVEL', :display_name => 'Well Reference Level', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVWELLLOGVERSION', :display_name => 'Well Log Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVWELLLOGTIMESERIES', :display_name => 'Well Log Time Series', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVWELLLOGPROPERTYVALUE', :display_name => 'Well Log Property Value', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVWELLLOGPROPERTYTYPE', :display_name => 'Well Log Property Type', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVWELLLOG', :display_name => 'Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } , 
  { :name => 'DOVVALUESET', :display_name => 'Value Set', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVVALUE', :display_name => 'Value', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVTUBULARCOMPONENTIMAGE', :display_name => 'Tubular Component Image', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTUBULARCOMPONENT', :display_name => 'Tubular Component', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTUBULARASSEMBLY', :display_name => 'Tubular Assembly', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTUBINGSTRINGPART', :display_name => 'Tubing String Part', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTUBINGSTRING', :display_name => 'Tubing String', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTRAJECTORYPOINT', :display_name => 'Trajectory Point', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTRAJECTORY', :display_name => 'Trajectory', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTOMBSTONE', :display_name => 'Tomestone', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTIMESTEPWELLLOG', :display_name => 'Time Step Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTIMESTEPDICTWELLLOG', :display_name => 'Time Step Dict Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTIMESERIESLOGVERSION', :display_name => 'Time Series Log Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTIMESERIESDICTWELLLOG', :display_name => 'Time Series Dict Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTIMESERIESDICTLOGVER', :display_name => 'Time Series Dict Log Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTEMPLATECOLLECTION', :display_name => 'Template Collection', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVTEMPLATE', :display_name => 'Template', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVTARGETSECTION', :display_name => 'Target Section', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVTARGETCOLLECTION', :display_name => 'Target Collection', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVSURVEYSTATION', :display_name => 'Survey Station', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSURVEYCOLLECTION', :display_name => 'Survey Collection', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSURFACEPROPERTY', :display_name => 'Surface Property', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVSUBSURFACESAFETYVALVE', :display_name => 'Subsurface Safety Valve', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVSTRATIGRAPHY', :display_name => 'Stratigraphy', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSTIMULATION', :display_name => 'Stimulation', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVSQUEEZE', :display_name => 'Squeez', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVSPIRALICD', :display_name => 'Spiral ICD', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVSLIDINGSLEEVE', :display_name => 'Sliding Sleeve', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVSHAPEGEOMETRY', :display_name => 'Shape Geometry', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVSEISMICVINTAGE', :display_name => 'Seismics Vintage', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMICLINE2DGEOMETRY', :display_name => 'Seismics Line 2D Geometry', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMICLINE2D', :display_name => 'Seismics Line 2D', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMICFOLDER', :display_name => 'Seismics Folder', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMICCUBE_SDE', :display_name => 'Seismics Cube SDE', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMICCUBEDATAFILE', :display_name => 'Seismics Cube Datafile', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMICCUBE', :display_name => 'Seismics Cube', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMIC3DSUBFOLDER', :display_name => 'Seismics 3D Subfolder', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMIC3DCOLLECTION_SDE', :display_name => 'Seismics 3d Collection SDE', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMIC3DCOLLECTION', :display_name => 'Seismics 3D Collection', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMIC2DSUBFOLDER', :display_name => 'Seismics 2D Subfolder', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMIC2DDATAFILE', :display_name => 'Seismics 2D Datafile', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISMIC2DCOLLECTION', :display_name => 'Seismics 2D Collection', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISCUBEPROPERTYVALUE', :display_name => 'Seismics Cube Property Value', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISCUBEPROPERTYTYPE', :display_name => 'Seismics Cube Property Type', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISCUBEPROCSTEPVALUE', :display_name => 'Seismics Cube Proc Step Value', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEISCUBEPROCSTEPTYPE', :display_name => 'Seismics Cube Proc Step Type', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEIS2DPROCSTEPVALUE', :display_name => 'Seismics 2D Proc Step Value', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVSEIS2DPROCSTEPTYPE', :display_name => 'Seismics 2D Proc Step Type', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOVRISK', :display_name => 'Risk', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVREPLACEMENTVELOCITY', :display_name => 'Replacement Velocity', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVREGULARHEIGHTSURFACE_SDE', :display_name => 'Regular Height Surface SDE', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVREGULARHEIGHTSURFACE', :display_name => 'Regular Height Surface', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVPUMP', :display_name => 'Pump', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPROJECTDEFAULT', :display_name => 'Project Default', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVPRODINDEXWELLTEST', :display_name => 'Prod Index Well Test', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPRODINDEXMWELLTEST', :display_name => 'Prod Index M Well Test', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPRESSURETRANSWELLTEST', :display_name => 'Pressure Trans Well Test', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPOLYLINESET', :display_name => 'Polyline Set', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVPOLYLINEPROPERTYTYPE', :display_name => 'Polyline Property Type', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVPOLYLINE', :display_name => 'Polyline', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVPOINTWELLLOGVERSION', :display_name => 'Point Well Log Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPOINTWELLLOGPTYTYPE', :display_name => 'Point Well Log Type', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPOINTWELLLOG', :display_name => 'Point Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPOINTSET', :display_name => 'Point Set', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVPOINTPROPERTY', :display_name => 'Point Property', :stat_category_id => StatCategory.where( :name => 'Shapes').first.id } ,
  { :name => 'DOVPLUGBACK', :display_name => 'Plug Back', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPLANNEDWELLPATH', :display_name => 'Planned Well Path', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPETRELPROJECT', :display_name => 'Petrel Project', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVPETRELOBJECT', :display_name => 'Petrel Object', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVPETRELDATABLOB', :display_name => 'Petrel Data Blob', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVPERFORATION', :display_name => 'Perforation', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVPACKER', :display_name => 'Packer', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVOBSERVEDDATAVERSION', :display_name => 'Observed Data Version', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVOBSERVEDDATATIMEINDEX', :display_name => 'Observed Data Time Index', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVOBSERVEDDATASETFORWELL', :display_name => 'Observed Data Set For Well', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVOBSERVEDDATASET', :display_name => 'Observed Data Set', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVOBSERVEDDATA', :display_name => 'Observe Data', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVOBJECTUSE', :display_name => 'Object Use', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVNOZZLEICD', :display_name => 'Nozzle ICD', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMULTITRACEWELLLOG', :display_name => 'Multi Trace Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMULTITRACELOGVERSION', :display_name => 'Multi Trace Well Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMNGDTEMPLATECOL', :display_name => 'NGD Template Collection', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMNGDTEMPLATE', :display_name => 'MNGD Template', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMNGDDICTTEMPLATECOL', :display_name => 'MNGD Dictionary Template Collection', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMNGDDICTTEMPLATE', :display_name => 'Dictionary Template', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVMESSAGELOG', :display_name => 'Message Log', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVMESSAGECONTEXT', :display_name => 'Message Context', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVMESSAGEACTIVITY', :display_name => 'Message Activity', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVMARKERZONE', :display_name => 'Marker Zone', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERSURFACE', :display_name => 'Marker Surface', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERPROPERTYVALUE', :display_name => 'Marker Property Value', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERPROPERTYTYPE', :display_name => 'Marker Property Type', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERINTERFACE', :display_name => 'Marker Interface', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERHORIZON', :display_name => 'Marker Horizon', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERFAULT', :display_name => 'Marker Fault', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERCOLLECTIONFILTER', :display_name => 'Marker Collection Filter', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKERCOLLECTION', :display_name => 'Marker Collection', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMARKER', :display_name => 'Marker', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVMANAGEDPROJECT', :display_name => 'Managed Project', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVMANAGEDOBJECT', :display_name => 'Managed Object', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVLOGVERSIONCOLLECTION', :display_name => 'Log Version Collection', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVLINERSTRINGPART', :display_name => 'Liner String Part', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVLINERSTRING', :display_name => 'Liner String', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVLABYRINTHICD', :display_name => 'Labyrinth ICD', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVINTERPCOLLECTION', :display_name => 'Interp Collection', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINTERP3DSOURCE', :display_name => 'Interp 3D Source', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINTERP3DPROPERTYVALUE', :display_name => 'Interp 3D Property Value', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINTERP3DPROPERTYTYPE', :display_name => 'Interp 3d Property Type', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINTERP2DSOURCE', :display_name => 'Interp 2D Source', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINTERP2DPROPERTYVALUE', :display_name => 'Interp 2D Property Value', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINTERP2DPROPERTYTYPE', :display_name => 'Interp 2D Property Type', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVINLINEFCV', :display_name => 'Inline FCV', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVHYDRAULICFRACTURE', :display_name => 'Hydraulic Fracture', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVHORIZONPTY3D', :display_name => 'Horizon Property 3D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONPTY2DLINE', :display_name => 'Horizon Property 2D Line', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONPTY2D', :display_name => 'Horizon Property 2D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONINTERP3D_SDE', :display_name => 'Horizon Interp 3D SDE', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONINTERP3D', :display_name => 'Horizon Interp 3D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONINTERP2DLINE', :display_name => 'Horizon Interp 2D Line', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONINTERP2D', :display_name => 'Horizon Interp 2D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHORIZONINTERP', :display_name => 'Horizon Interp', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVHISTORYENTRY', :display_name => 'History Entry', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVHEATER', :display_name => 'Heater', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVGEOLOGICALTARGET', :display_name => 'Geological Target', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVGENERICWELLLOG', :display_name => 'Generic Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVGENERICTRAJECTORY', :display_name => 'Generic Trajectory', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVGENERICTARGET', :display_name => 'Generic Target', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVGENERICSURFACEPTY', :display_name => 'Generic Surface Property', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVGENERICHORIZONPTY3D', :display_name => 'Generic Horizon Property 3D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVGENERICHORIZONPTY2D', :display_name => 'Generic Horizon property 2D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVGENERICCOMPLETION', :display_name => 'Generic Completion', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVGAUGE', :display_name => 'Gauge', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVGASLIFTVALVE', :display_name => 'Gas Lift Value', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVFILTERUSERSETTINGS', :display_name => 'Filter User Settings', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVFILTER', :display_name => 'Filter', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVFAULTPTY', :display_name => 'Fault Property', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVFAULTPOLYLINE', :display_name => 'Fault Polyline', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVFAULTINTERPRETATION', :display_name => 'Fault Interpretation', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVFAULTINTERPPTYVALUE', :display_name => 'Fault Interpretation Property Value', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVFAULTINTERPPTYTYPE', :display_name => 'Fault Interpretation Property Type', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVESPPUMP', :display_name => 'ESP Pump', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVDRILLINGRISKIMAGE', :display_name => 'Drilling Risk Image', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVDRILLERSTARGET', :display_name => 'Drillers Target', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVDOWNHOLESEPARATOR', :display_name => 'Downhole Seprator', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVDICTWELLLOGVERSION', :display_name => 'Dictionary Well Log Version', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVDICTTEMPLATECOLLECTION', :display_name => 'Dictionary Template Collection', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVDICTSURFACEPTY', :display_name => 'Dictionary Surface Property', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVDICTPOINTPROPERTY', :display_name => 'Dictionary Point Property', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVDICTIONARYWELLLOG', :display_name => 'Dictionary Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVDICTHORIZONPTY3D', :display_name => 'Dictionary Horizon Property 3D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVDICTHORIZONPTY2DLINE', :display_name => 'Dictionary Horizon Property 2D Line', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVDICTHORIZONPTY2D', :display_name => 'Dictionary Horizon Property 2D', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVDICTFAULTPTY', :display_name => 'Dictionary Fault Property', :stat_category_id => StatCategory.where( :name => 'Interpretations').first.id } ,
  { :name => 'DOVDESIGNTRAJECTORYPOINT', :display_name => 'Design Trajectory Point', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVDESIGNTRAJECTORY', :display_name => 'Design Trajectory', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCUSTOMDOMAINOBJECT', :display_name => 'Custom Domain Object', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVCUSTOMATTRIBUTE', :display_name => 'Custom Attribute', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVCOORDINATESYSTEM', :display_name => 'Coordinate System', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVCOMMENTWELLLOGVERSION', :display_name => 'Comment Well Log Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCOMMENTWELLLOG', :display_name => 'Comment Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCOLLECTION', :display_name => 'Collection', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVCHECKSHOTVERSION', :display_name => 'Check Shot Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCHECKSHOTPROPERTYTYPE', :display_name => 'Check Shot Property Type', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCHECKSHOT', :display_name => 'Check Shot', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCASINGSTRINGPART', :display_name => 'Casing String Part', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVCASINGSTRING', :display_name => 'Casing String', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLETARGET', :display_name => 'Borehole Target', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLESEISVERSION', :display_name => 'Borehole Seismics Version', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLESEISMOGRAM', :display_name => 'Borehole Seismogram', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLEPROPERTYVALUE', :display_name => 'Borehole Property Value', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLEPROPERTYTYPE', :display_name => 'Borehole Property Type', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLECOLLECTION', :display_name => 'Borehole Collection', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBOREHOLE', :display_name => 'Borehole', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBITMAPWELLLOGVERSION', :display_name => 'Bitmap Well Log Verson', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBITMAPWELLLOGSAMPLE', :display_name => 'Bitmap Well Log Sample', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBITMAPWELLLOG', :display_name => 'Bitmap Well Log', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVBASETRAJECTORYPOINT', :display_name => 'BaseTrajectory Point', :stat_category_id => StatCategory.where( :name => 'Wells').first.id } ,
  { :name => 'DOVAUTONOMOUSICD', :display_name => 'Automomous ICD', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVANNULARFCV', :display_name => 'Annualar FCV', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOVAFFECTEDPERSONNEL', :display_name => 'Affected personnel', :stat_category_id => StatCategory.where( :name => 'Others').first.id } ,
  { :name => 'DOV3DCOLLPROPERTYVALUE', :display_name => '3D Collection Property Value', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOV3DCOLLPROPERTYTYPE', :display_name => '3D Collection Property Type', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOV2DLINEPROPERTYVALUE', :display_name => '2D Line Property Value', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOV2DLINEPROPERTYTYPE', :display_name => '2D Line Property Type', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOV2DCOLLPROPERTYVALUE', :display_name => '2D Collection Property Value', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id } ,
  { :name => 'DOV2DCOLLPROPERTYTYPE', :display_name => '2D Collection Property Type', :stat_category_id => StatCategory.where( :name => 'Seismics').first.id }
])
