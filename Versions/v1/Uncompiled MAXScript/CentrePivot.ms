(
	undo on
		if selection.count > 0 then--if selectin is greater than 0
			for i in selection do (i.pivot = i.center) --for objects in selection centre pivots
	else
		messageBox "Error: Selection required." title:"Centre Pivot"
	)
print "Centre Pivot True!"