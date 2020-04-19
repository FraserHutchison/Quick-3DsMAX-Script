(
	undo "Reset XForm" on
	if selection.count > 0 then
	(
		resetxform $ 
		collapsestack $
		ConvertTo $ Editable_Poly
	)
	else
		messageBox "Error: Selection Required." title:"Reset XForm"
)
print "Reset XForm True!"

--Both resets and converts to editable poly