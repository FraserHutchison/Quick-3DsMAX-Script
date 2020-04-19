(
	undo on
		if selection.count > 0 then
	(
		s=selection
		ConvertTo s Editable_Poly
	)
	else
		messageBox "Error: Selection required." title:"Editable Poly"
)