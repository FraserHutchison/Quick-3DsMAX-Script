--This Scrip Contains all rollouts and include constructs to run all other files
(	
	rollout Quick "Quick!" width:120 height:94
	(
		button 'MakeItGrey_Button' "Make It Grey!" pos:[8,8] width:104 height:37 align:#left
		button 'EP_Button' "Editable Poly!" pos:[8,48] width:104 height:37 align:#left
		on MakeItGrey_Button pressed do
		(
			include "MakeItGrey.ms"
			)
			
		on EP_Button pressed do
		(
			include "EditablePoly.ms"
			)
	)

	rollout Pivots "Pivots" width:120 height:176
	(
		button 'CentreP_Button' "Centre Pivot" pos:[8,48] width:104 height:37 align:#left
		checkbutton 'APO_ckb' "Affect Pivot Only" pos:[8,8] width:104 height:32 align:#left
		button 'PBase_Button' "Pivot To Base" pos:[8,88] width:104 height:37 align:#left
		button 'MCentre_Button' "Move To Centre" pos:[8,128] width:104 height:37 align:#left
		
		on CentreP_Button pressed do
		(
			include "CentrePivot.ms"
			)
		on APO_ckb changed state do
		(
			include "AffectPivotOnly.ms"
			)
		on PBase_Button pressed do
		(
			include "PivotToBase.ms"
			)
		on MCentre_Button pressed do
		(
			include "MoveToCentre.ms"
			)
	)

	rollout Checks "Checks" width:120 height:96
	(
		button 'XForm_Button' "Reset XForm" pos:[7,7] width:104 height:37 align:#left
		button 'STL_Button' "STL Check" pos:[7,48] width:104 height:37 align:#left
	
		on XForm_Button pressed do
		(
		include "ResetXForm.ms"
		
			)
		on STL_Button pressed do
		(
		include "StlCheck.ms"
			)
	)
	
	rollout UnitsSetupRollout "UnitsSetup" width:120 height:162
	(
		button 'Unreal_Button' "Unreal" pos:[7,8] width:107 height:37 align:#left
		button 'Unity_Button' "Unity" pos:[8,48] width:107 height:37 align:#left
		button 'About_Button' "About" pos:[69,92] width:42 height:61 align:#left
		radiobuttons 'GridUnits_rButton' "Grid Units" pos:[11,90] width:44 height:62 labels:#("0.25", "0.5", "1") align:#left

		on Unreal_Button pressed do
		(
		include "UnrealUnits.ms"
			)
		on Unity_Button pressed do
		(
		include "UnityUnits.ms"
			)
		on About_Button pressed do
		(
		messagebox "About Page - Unreal Units are all set to CENTIMETERS - Unity Units are all set to METERS - Go to Customize> Units Setup... to find out more! OR Right Click the snaps buttons for Viewport Grid Units!" beep:false 
			
			)
		on GridUnits_rButton changed stat do
		(
			getGridSpacing()
			case stat of
			(
				1:  SetGridSpacing (0.25)
				2:  setgridspacing (0.5)
				3:  setgridspacing (1)	
			)
		)
	)

	rollout Unwrapping "Unwrapping" width:120 height:160
	(
		button 'SmartStitch_Button' "Smart Stitch" pos:[8,8] width:107 height:37 align:#left
		button 'Align_Button' "Align" pos:[8,48] width:107 height:37 align:#left
		button 'NormUV_Button' "Normalize UVs" pos:[8,88] width:107 height:37 enabled:true align:#left
		button 'About_Button' "About" pos:[8,128] width:107 height:21 enabled:true align:#left
		
		on SmartStitch_Button pressed do
		(
		include "SmartStitch.ms"
			)
			
		on Align_Button pressed do
		(
		include "AlignUV.ms"
			)
			
		on NormUV_Button pressed do
		(
		include "NormalizeUV.ms"
			)
			
		on About_Button pressed do
		(
		messagebox "NOTE: NormalizeUV can be used at any time so only click it when you need to (Select all faces) - Not all these scripts are created by me, look in the credits button for more info." beep:false 
			)
	)

	rollout ExportImport "ExportImport" width:120 height:160
	(
		button 'CExpSel_Button' "Custom Export Selected" pos:[8,8] width:107 height:37 enabled:true align:#left
		button 'ExpSel_Button' "Default Export Selected" pos:[8,48] width:107 height:37 enabled:true align:#left
		button 'BImp_Button' "Batch Import" pos:[8,88] width:107 height:37 enabled:true align:#left
		button 'About_Button' "About" pos:[8,128] width:107 height:21 enabled:true align:#left
			
		on CExpSel_Button pressed do
		(
			include "CustomExportSelectedFBX.ms"
			)
		on ExpSel_Button pressed do
		(
			include "DefaultExportSelected.ms"
			)
		on BImp_Button pressed do
		(
			include "BatchImport.ms"
			)
		on About_Button pressed do
		(
			messagebox "CustomExportSelctedFBX will clone your objects, set the pivot to the centre base, move to world origin,set a default grey material then will delete itself leaving the orginal meshes. ++ BatchImport will let you set a folder directory and import all files from there.This currently only works with .fbx files. ++ THESE ACTIONS CANNOT BE UNDONE SO SAVE FIRST" beep:false 
			)
	)
	
	rollout Credits "Credits" width:120 height:208
	(
		button 'TT_Button' "Tex Tools" pos:[8,7] width:107 height:26 align:#left
		button 'CZ_Button' "Chamfer Zone" pos:[8,40] width:107 height:26 align:#left
		button 'SP_Button' "ScriptSpot" pos:[8,72] width:107 height:26 align:#left
		groupBox 'grp1' "Created By" pos:[8,104] width:105 height:96 align:#left
		label 'lbl3' "Fraser Hutchison" pos:[16,128] width:88 height:22 align:#left
		label 'lbl4' "19/04/2020" pos:[16,152] width:88 height:22 align:#left
		label 'lbl5' "Max 2020" pos:[16,176] width:88 height:22 align:#left
		
		on TT_Button pressed do
		(
			messagebox "Tex Tools = Align+Normalize - http://renderhjs.net/textools/3dsMax.html" beep:false 
			)
		on CZ_Button pressed do
		(
			messagebox "Chamfer Zone = Smart Stitch UV - https://www.youtube.com/watch?v=BbZ7ip-eCcI" beep:false 
			)
		on SP_Button pressed do
		(
			messagebox "ScriptSpot = http://www.scriptspot.com/ " beep:false 
			)
	)
	
)
rdFloater = newrolloutfloater "CustomTools" 140 500
addrollout Quick rdFloater rolledup: true 
addrollout Pivots rdFloater rolledup: true 
addrollout Checks rdFloater rolledup: true 
addrollout UnitsSetupRollout rdFloater rolledup: true  
addrollout Unwrapping rdFloater rolledup: true 
addrollout ExportImport rdFloater rolledup: true 
addrollout Credits rdFloater rolledup: true 

print "CustomToolsV2 Now Open!"