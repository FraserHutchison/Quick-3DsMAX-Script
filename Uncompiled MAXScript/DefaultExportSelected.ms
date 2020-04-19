if selection.count > 0 then
	(
		actionMan.executeAction 0 "40373"  -- File: Export Selected
		print "File Exported!"
	)
else
	messagebox "Error:NOTHING SELECTED!" title:"Deafult FBX Export Selected"