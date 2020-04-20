--Current bug: leaves the original objects with a 001 suffix, I'm unsure on how to fix this

if selection.count > 0 then --if selection is greater than 0 then
(
	rollout RenameObject "RenameObject" width:240 height:98--Rename object dialog before export dialog
		(
				edittext 'CustomObjectName' "ObjectName" pos:[12,13] width:216 height:48 align:#left
				button 'Rename_Button' "Rename Object!" pos:[11,66] width:219 height:25 align:#left
				
			local objName --local variable of object name
			
				on CustomObjectName entered text do
				(
					objName = text --sets to be teh text used in the edit text box in rollout
					)
				on Rename_Button pressed do --commits rename on click
				(
					$.name =objName --sets object $ to local variable objName
					DestroyDialog RenameObject --closes dialog
					
					DialogClosed = true variable --variable for if the rename dialog is closed
					
					If DialogClosed == true do --bool test is equal to true 
						(
							(
								Exported = false --creates variable
								
								maxOps.cloneNodes (selection as array) cloneType:#instance newNodes:&nnl #nodialog --clones selection

								Assets = #()
								for o in selection  do append Assets o
								convertToPoly(Assets[1])
								for i = 2 to Assets.count do
								(
									convertToPoly(Assets[i]) 
									polyop.attach Assets[1] Assets[i]  --attaches cloned objects and converts to editable poly
								) 

								for i in selection do (i.pivot = i.center) --pivot to centre
								for j in selection do (j.pivot.z = j.min.z) --pivot to base

								$.pos = [0,0,0] --move to 0,0,0
								
								$.material = Standardmaterial () --apply Standard Material 
								
								

								actionMan.executeAction 0 "40373"  -- File: Export Selected

								Exported = True

								
								
	
								delete $ --delete clone selection leaving just the origian left
										
								print "File Exported!"
									
								
							)
						)
					)
		)
	createdialog RenameObject
)
else
	messagebox "Error:NOTHING SELECTED!" title:"Custom FBX Export Selected"