(
	undo "Make It Dark Grey!" on
		if selection.count > 0 then --if selection is greater than 0
( 
	a=getCurrentSelection() --a = the current selection array ( the array is defined by the brackets)
	
	addModifier $ (Materialmodifier materialid:1)--Adds material modifer and set the ID to 1
    convertTo $ editable_Poly 
	
	a.material = standardMaterial diffusecolor:(color 35 35 35) --sets arrays material to be a standard grey (this matrial will not be found in the material slate)
	a.wirecolor = black --sets arrays wirefraem to be black 
)
	else
		messageBox "Error: Selection required." title:"Make It Dark Grey!"
)
print "Make It Dark Grey True, all ID's set to 1!"			
			
--Sets selected objects to grey with black wireframe4