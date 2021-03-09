--This script allows for attaching multiple meshes with one click.
--It makes use of the ATTACH tool in the edit poly tools meaning the mesh has to bew converted to be an editblae poly first, this is handled below so the user does not have to do this. 

if selection.count > 0 then-- if the sleection is greater than 0 then run loop

undo on--Undo is on however this can at times cause max to crash if done on lots of objects
(
	convertToPoly(selection) --convert selection to editable poly (cannot perform attach on anything other than editable poly)
			
		while selection.count > 1 do -- run the loop if there is more than 1 object selected. Otherwise skip this loop
			(
				selcount = selection.count
				for i = selcount to 2 by -2 do -- for items in the selection count do the following, 
				(
					polyop.attach selection[i] selection[i-1] --attach objects in the array
				)
			)
		update selection[1] 
)
else
	messagebox "Error: NOTHING IS SELECTED!" title:"Custom FBX Export Selected" -- if nothing is selected then show this error message box with sound