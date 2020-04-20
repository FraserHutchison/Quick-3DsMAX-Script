(
	undo "Reset XForm" on
	if selection.count > 0 then --if the selection is greater than 0
	(
		resetxform $ --reset the XForm of current selection $
		collapsestack $ --collapse modifier stack
		ConvertTo $ Editable_Poly --convert to editable poly 
	)
	else
		messageBox "Error: Selection Required." title:"Reset XForm"
)
print "Reset XForm True!"

--Both resets and converts to editable poly