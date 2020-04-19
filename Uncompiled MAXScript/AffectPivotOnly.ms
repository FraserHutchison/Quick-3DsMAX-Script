undo on
			(
			if selection.count > 0 then
				(
						case maxops.pivotmode of
						(
							#none: maxops.pivotmode = #pivotonly
								#pivotonly: maxops.pivotmode = #none
		)
				redrawViews()
		)
				else
 			messageBox "Error: Selection required." title:"Adjust Pivot Only"
)
print "Affect Pivot Only True!"