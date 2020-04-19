if selection.count > 0 then
(
	rollout RenameObject "RenameObject" width:240 height:98
		(
				edittext 'CustomObjectName' "ObjectName" pos:[12,13] width:216 height:48 align:#left
				button 'Rename_Button' "Rename Object!" pos:[11,66] width:219 height:25 align:#left
				
			local objName
			
				on CustomObjectName entered text do
				(
					objName = text
					)
				on Rename_Button pressed do
				(
					$.name =objName
					DestroyDialog RenameObject
					
					DialogClosed = true
					
					If DialogClosed == true do
						(
							(
								Exported = false
								
								maxOps.cloneNodes (selection as array) cloneType:#instance newNodes:&nnl #nodialog --clone selection

								Assets = #()
								for o in selection  do append Assets o
								convertToPoly(Assets[1])
								for i = 2 to Assets.count do
								(
									convertToPoly(Assets[i]) 
									polyop.attach Assets[1] Assets[i]
								) --attach to editable poly (one object)

								for i in selection do (i.pivot = i.center) --pivot to base
								for j in selection do (j.pivot.z = j.min.z)

								$.pos = [0,0,0] --move to 0,0,0
								
								$.material = Standardmaterial () --apply Standard Material 
								
								

								actionMan.executeAction 0 "40373"  -- File: Export Selected

								Exported = True

								
								
	
								delete $ --delete selection
										
								print "File Exported!"
									
								
							)
						)
					)
		)
	createdialog RenameObject
)
else
	messagebox "Error:NOTHING SELECTED!" title:"Custom FBX Export Selected"