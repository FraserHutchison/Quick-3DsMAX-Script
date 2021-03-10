--CUSTOM EXPORT SELECTED
--This script gets the current selected objects and if there are more than 1, combines them into one mesh
--All meshes have a standard material applied and the pivot is set to the base centre of the mesh then set to 0,0,0
--The user can set the name of the newly exported mesh in the dialog
--The meshes are cloned and then combined so the original meshes are left as is.

if selection.count > 0 then --if selection is greater than 0 then run loop
(
	rollout RenameObject "RenameObject" width:240 height:100
	(
		edittext 'CustomObjectName' "ObjectName" pos:[12,13] width:216 height:48 align:#left
		button 'NameAndExport_Button' "Name and Export!" pos:[11,66] width:219 height:25 align:#left
		
			--create variables
			local objName --local variable of object name
			local DialogClosed = true --Create boolean variable (if the rename dialog is closed)
		
		on CustomObjectName entered text do --when using the text input dialog do...
		(
			objName = text --Text to be the exported combined mesh NOT the current selections name
		)
		
		on NameAndExport_Button pressed do --commits Rename and Export on click
		(
			maxOps.cloneNodes (selection as array) cloneType:#copy newNodes:&nnl #nodialog --clones selection
		
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
		
			for i in selection do (i.pivot = i.center) --pivot to centre
			for j in selection do (j.pivot.z = j.min.z) --pivot to center base
		
			$.pos = [0,0,0] --move selection to 0,0,0
				
			$.material = Standardmaterial () --apply Standard Material to selection (NOTE: Material IDs are not kept)
		
			$.name = objName --Name object to new objName to remove any suffix caused by the duplication
					
			DestroyDialog RenameObject --closes dialog
			
			DialogClosed = true --variable for if the rename dialog is closed
			
			If DialogClosed == true do --bool test is equal to true then run exporter
			(
						actionMan.executeAction 0 "40373"  -- run  File> Export Selected
		
						delete $ --delete clone selection leaving just the original left and names/positions and pivot left untouched
								
						print "File Exported!" --print Debug to listener
						print objName -- print the Name of epxorted object to listener
			)
		)
	)
createdialog RenameObject --Creates the rollout withoiut it the rollout wont open 
)
else
	messagebox "Error: NOTHING IS SELECTED!" title:"Custom FBX Export Selected" -- if nothing is selected then show this error message box with sound