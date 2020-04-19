(
	undo on
		if selection.count > 0 then
		$.pos = [0,0,0]
	else
		messageBox "Error: Selection required." title:"Move To Centre"
)
print "Move To Centre True!"