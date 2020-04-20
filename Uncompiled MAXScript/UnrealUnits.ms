(
	units.Systemtype = #centimeters--sets the file units to meters
	units.Displaytype = #Metric
	units.MetricType = #centimeters
	setgridspacing 1--sets viewport grid spacing to 1
	gridPrefs.perspViewGridExtents = 1000 --sets the grid extent to 1000 which is the max value
	
	actionMan.executeAction 0 "374"  -- Tools: Viewport Clipping turn on
	
	print "Unreal Units True!"
	print "All Centimeters"
	print "View Grid Extent = 1000"
)
--Units setup for Unreal