(
	undo on
	if selection.count > 0 then--if selection is greater than 0
	(
		for i in selection do (i.pivot = i.center)
		for j in selection do (j.pivot.z = j.min.z)
	)
		else
			messageBox "Error: Selection required." title:"Pivot To Base"
)
print "Pivot To Base True!"