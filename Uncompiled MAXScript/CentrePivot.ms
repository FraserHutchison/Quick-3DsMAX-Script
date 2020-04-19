(
	undo on
		if selection.count > 0 then
			for i in selection do (i.pivot = i.center)
	else
		messageBox "Error: Selection required." title:"Centre Pivot"
	)
print "Centre Pivot True!"