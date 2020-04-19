(
	undo "Make It Grey!" on
		if selection.count > 0 then
( 
	a=getCurrentSelection()
	a.material = standardMaterial diffusecolor:gray
	a.wirecolor = black
)
	else
		messageBox "Error: Selection required." title:"Make It Grey!"
)
print "Make It Grey True!"			
			
--Sets selected objects to grey with black wireframe