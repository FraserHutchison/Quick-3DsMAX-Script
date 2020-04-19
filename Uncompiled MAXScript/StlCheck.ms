(
	undo on
		if selection.count > 0 then
		(
			modPanel.addModToSelection (STL_Check ()) ui:on
			$.modifiers[#STL_Check].Change_MatID = 0
			$.modifiers[#STL_Check].Selection_Type = 4
			$.modifiers[#STL_Check].Check_Now = 1
			collapsestack $
			ConvertTo $ Editable_Poly
		)
	else
		messageBox "Error: Selection required." title:"STL Check"
)

--Currently can only do one at a time (Dont knwo why yet 19/04/2020)