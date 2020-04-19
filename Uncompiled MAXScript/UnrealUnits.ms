(
	units.Systemtype = #centimeters
	units.Displaytype = #Metric
	units.MetricType = #centimeters
	setgridspacing 1
	gridPrefs.perspViewGridExtents = 1000
	
	actionMan.executeAction 0 "374"  -- Tools: Viewport Clipping
	
	print "Unreal Units True!"
	print "All Centimeters"
	print "View Grid Extent = 1000"
)
--Units setup for Unreal