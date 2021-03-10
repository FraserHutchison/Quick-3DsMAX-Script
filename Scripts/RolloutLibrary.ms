rollout QuickV2Rollout "Quick! v.2" width:112 height:312
(
	
	button 'grey_btn' "Grey" pos:[8,8] width:48 height:40 align:#left
	button 'dgrey_btn' "DGrey" pos:[56,8] width:48 height:40 align:#left
	button 'editablepoly_btn' "EditablePoly" pos:[8,48] width:96 height:40 align:#left
	button 'pivot_btn' "Pivot" pos:[8,88] width:48 height:40 align:#left
	button 'pivotbase_btn' "PBase" pos:[56,88] width:48 height:40 align:#left
	button 'pivotcentre_btn' "PCentre" pos:[8,128] width:48 height:40 align:#left
	button 'objectcentre_btn' "OCentre" pos:[56,128] width:48 height:40 align:#left
	button 'resetxform_btn' "Reset XForm" pos:[8,168] width:96 height:40 align:#left
	button 'uvalign_btn' "UV Align" pos:[8,208] width:96 height:40 align:#left
	button 'smoothuv_btn' "Smooth By UV Islands" pos:[8,248] width:96 height:40 align:#left
	button 'help_btn' "Help" pos:[8,288] width:96 height:16 align:#left

	on grey_btn pressed do
	(
		FileIn "MakeItGrey.ms"
	)
	
	on dgrey_btn pressed do
	(
		FileIn "MakeItDarkGrey.ms"
	)
	
	on editablepoly_btn pressed do
	(
		FileIn "EditablePoly.ms"
	)
	
	on pivot_btn pressed do
	(
		FileIn "AffectPivotOnly.ms"
	)
	
	on pivotbase_btn pressed do
	(
		FileIn "PivotToBase.ms"
	)
	
	on pivotcentre_btn pressed do
	(
		FileIn "CentrePivot.ms"
	)
	
	on objectcentre_btn pressed do
	(
		FileIn "MoveToCentre.ms"
	)
	
	on resetxform_btn pressed do
	(
		FileIn "ResetXForm.ms"
	)
	
	on uvalign_btn pressed do
	(
		FileIn "AlignUV.ms"
	)
	
	on smoothuv_btn pressed do
	(
		FileIn "SmoothGroupsByUvShells.ms"
	)
	
	on help_btn pressed do
	(
		messagebox "Fraser Hutchison 09/03/2021 -                                                   https://github.com/FraserHutchison/Quick-3DsMAX-Script" beep:false 
	)
	
)
createdialog QuickV2Rollout width:112 height:312 style:#(#style_titlebar, #style_sysmenu, #style_toolwindow)

print "Quick! v.2 Now Open!"

