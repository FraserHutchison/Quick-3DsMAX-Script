(
	undo on --script can be undone
		if selection.count > 0 then --if selection is greater than 0
	(
		s=selection --sets s to be a variable with the value of selection
		ConvertTo s Editable_Poly --convert s (selection) to editable poly
	)
	else
		messageBox "Error: Selection required." title:"Editable Poly"
)