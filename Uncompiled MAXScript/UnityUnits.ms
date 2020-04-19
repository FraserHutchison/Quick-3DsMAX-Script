(
		units.Systemtype = #meters
		units.Displaytype = #Metric
		units.MetricType = #meters
		setgridspacing 1
		gridPrefs.perspViewGridExtents = 1000
	
	actionMan.executeAction 0 "374"  -- Tools: Viewport Clipping
	
	print "Unity Units True!"
	print "All Meters"
	print "View Grid Extent = 1000"
)
--Units setup for Unity