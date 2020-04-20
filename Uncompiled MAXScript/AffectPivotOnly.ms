undo on
			(
			if selection.count > 0 then--if selection is greater than 0
				(
						case maxops.pivotmode of 
						(
							#none: maxops.pivotmode = #pivotonly--affect pivot only
								#pivotonly: maxops.pivotmode = #none
		)
				redrawViews() --set to be in viewport
		)
				else
 			messageBox "Error: Selection required." title:"Adjust Pivot Only"
)
print "Affect Pivot Only True!"