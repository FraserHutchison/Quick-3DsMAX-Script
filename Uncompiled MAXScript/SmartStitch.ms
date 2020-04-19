(
	undo on
	local dialogs = (UIAccessor.GetPopupDialogs())
		
	for i = 1 to dialogs.count do
	(
		if dialogs[i] != 0 and (matchpattern (UIAccessor.GetWindowText dialogs[i]) pattern:("*Stitch Tool*")) == true then
		(
			UIAccessor.PressButtonByName dialogs[i] "OK"
			return truee
		)
	)
	
)


DialogMonitorOPS.RegisterNotification closeStitchTool ID:#closeStitchTool_callback
DialogMonitorOPS.Enabled = true

$.modifiers["Unwrap UVW"].stitchVertsDialog()

DialogMonitorOPS.Enabled = false
DialogMonitorOPS.UnRegisterNotification ID:#closeStitchTool_callback

--SMART STITCH (Edited - Removed Functions)
--https://drive.google.com/drive/folders/0B0rKo4v9JhvgNzFGMGU3RmhBcjg
--https://www.youtube.com/watch?v=BbZ7ip-eCcI
--Chamfer Zone - Tim Bergholz