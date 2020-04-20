(
	undo on
		if selection.count > 0 then--if selection is greater than 0 
		(
			modPanel.addModToSelection (STL_Check ()) ui:on --add STL check modifer
			$.modifiers[#STL_Check].Change_MatID = 0 ---set the MatID property to 0 meaning dont change
			$.modifiers[#STL_Check].Selection_Type = 4--set the selection type property to faces 4
			$.modifiers[#STL_Check].Check_Now = 1 --Sets check property to 1 meaning on (0 is off)
			collapsestack $
			ConvertTo $ Editable_Poly
		)
	else
		messageBox "Error: Selection required." title:"STL Check"
)

--Currently can only do one at a time (Dont knwo why yet 19/04/2020)