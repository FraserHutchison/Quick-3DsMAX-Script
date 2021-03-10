(
	undo on
		if selection.count > 0 then--if selection is greater than 0
		$.pos = [0,0,0]--$ = selection .pos is posistion and anything in the [ ] is the vector
	else
		messageBox "Error: Selection required." title:"Move To Centre"
)
print "Move To Centre True!"