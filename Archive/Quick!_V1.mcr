macroScript QuickTools category:"Quick!"
(
--This Scrip Contains all rollouts and *include* constructs to run all other files
(	
	rollout Quick "Quick!" width:120 height:94
	(
		button 'MakeItGrey_Button' "Make It Grey!" pos:[8,8] width:104 height:37 align:#left
		button 'EP_Button' "Editable Poly!" pos:[8,48] width:104 height:37 align:#left
		on MakeItGrey_Button pressed do
		(
			(
	undo "Make It Grey!" on
		if selection.count > 0 then --if selection is greater than 0
( 
	a=getCurrentSelection() --a = the current selection array ( the array is defined by the brackets)
	a.material = standardMaterial diffusecolor:gray --sets arrays material to be a standard grey (this matrial will not be found in the material slate)
	a.wirecolor = black --sets arrays wirefraem to be black 
)
	else
		messageBox "Error: Selection required." title:"Make It Grey!"
)
print "Make It Grey True!"			
			
--Sets selected objects to grey with black wireframe
			)
			
		on EP_Button pressed do
		(
			(
	undo on --script can be undone
		if selection.count > 0 then --if selection is greater than 0
	(
		s=selection --sets s to be a variable with the value of selection
		ConvertTo s Editable_Poly --convert s (selection) to editable poly
	)
	else
		messageBox "Error: Selection required." title:"Editable Poly"
)
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
			(
	undo on
		if selection.count > 0 then--if selectin is greater than 0
			for i in selection do (i.pivot = i.center) --for objects in selection centre pivots
	else
		messageBox "Error: Selection required." title:"Centre Pivot"
	)
print "Centre Pivot True!"
			)
		on APO_ckb changed state do
		(
			undo on
			(
			if selection.count > 0 then--if selection is greater than 0
				(
						case maxops.pivotmode of 
						(
							#none: maxops.pivotmode = #pivotonly--affect pivot only
								#pivotonly: maxops.pivotmode = #none
		)
				redrawViews() --set to be in viewport
		)
				else
 			messageBox "Error: Selection required." title:"Adjust Pivot Only"
)
print "Affect Pivot Only True!"
			)
		on PBase_Button pressed do
		(
			(
	undo on
	if selection.count > 0 then--if selection is greater than 0
	(
		for i in selection do (i.pivot = i.center)
		for j in selection do (j.pivot.z = j.min.z)
	)
		else
			messageBox "Error: Selection required." title:"Pivot To Base"
)
print "Pivot To Base True!"
			)
		on MCentre_Button pressed do
		(
			(
	undo on
		if selection.count > 0 then--if selection is greater than 0
		$.pos = [0,0,0]--$ = selection .pos is posistion and anything in the [ ] is the vector
	else
		messageBox "Error: Selection required." title:"Move To Centre"
)
print "Move To Centre True!"
			)
	)

	rollout Checks "Checks" width:120 height:96
	(
		button 'XForm_Button' "Reset XForm" pos:[7,7] width:104 height:37 align:#left
		button 'STL_Button' "STL Check" pos:[7,48] width:104 height:37 align:#left
	
		on XForm_Button pressed do
		(
		(
	undo "Reset XForm" on
	if selection.count > 0 then --if the selection is greater than 0
	(
		resetxform $ --reset the XForm of current selection $
		collapsestack $ --collapse modifier stack
		ConvertTo $ Editable_Poly --convert to editable poly 
	)
	else
		messageBox "Error: Selection Required." title:"Reset XForm"
)
print "Reset XForm True!"

--Both resets and converts to editable poly
		
			)
		on STL_Button pressed do
		(
		(
	undo on
		if selection.count > 0 then--if selection is greater than 0 
		(
			modPanel.addModToSelection (STL_Check ()) ui:on --add STL check modifer
			$.modifiers[#STL_Check].Change_MatID = 0 ---set the MatID property to 0 meaning dont change
			$.modifiers[#STL_Check].Selection_Type = 4--set the selection type property to faces 4
			$.modifiers[#STL_Check].Check_Now = 1 --Sets check property to 1 meaning on (0 is off)
			collapsestack $
			ConvertTo $ Editable_Poly
		)
	else
		messageBox "Error: Selection required." title:"STL Check"
)

--Currently can only do one at a time (Dont knwo why yet 19/04/2020)
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
		(
	units.Systemtype = #centimeters--sets the file units to meters
	units.Displaytype = #Metric
	units.MetricType = #centimeters
	setgridspacing 1--sets viewport grid spacing to 1
	gridPrefs.perspViewGridExtents = 1000 --sets the grid extent to 1000 which is the max value
	
	actionMan.executeAction 0 "374"  -- Tools: Viewport Clipping turn on
	
	print "Unreal Units True!"
	print "All Centimeters"
	print "View Grid Extent = 1000"
)
--Units setup for Unreal
			)
		on Unity_Button pressed do
		(
		(
		units.Systemtype = #meters --sets the file units to meters
		units.Displaytype = #Metric
		units.MetricType = #meters
		setgridspacing 1 --sets viewport grid spacing to 1
		gridPrefs.perspViewGridExtents = 1000 --sets the grid extent to 1000 which is the max value
	
	actionMan.executeAction 0 "374"  -- Tools: Viewport Clipping turn on
	
	print "Unity Units True!"
	print "All Meters"
	print "View Grid Extent = 1000"
)
--Units setup for Unity
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
			)
			
		on Align_Button pressed do
		(
		--ALIGN UV SCRIPT CREATED BY: TEX TOOlS
--http://www.scriptspot.com/3ds-max/scripts/textools-toolbox-for-the-texture-artist
--http://renderhjs.net/textools/3dsMax.html

--fn align_uv_edge_to_axis =(
print("align uv shell to axis");
undo on
(
local uv = modPanel.getCurrentObject();
--local objs = modPanel.getCurrentObject();
if classof (uv) == Unwrap_UVW then(
	local _mode = uv.unwrap2.getTVSubObjectMode();
	if (_mode == 2)then(

		local _array = uv.unwrap2.getSelectedEdges();
		
		if (_array.numberSet == 1)then(--only 1 edge selected!!!
			
			
			--calculate the angle difference between 2 deltas
			function get2VertsAngleDiff dx dy= (
				local _a_abs = mod ((atan2 dy dx)+4*360) 360;--the angle in closed 360 degrees
				local _a_off = (mod _a_abs 90);--angle offset
				if (_a_off > 45)then(
					_a_off = -(90 - _a_off);
				)
				return _a_off;
			)
			
			local _edge = (_array as array)[1] as integer;

			--get the transformation info
			uv.unwrap2.edgeToVertSelect();
			_points = uv.unwrap.getSelectedVertices() as array;
			local ptA = uv.getVertexPosition 1 _points[1];
			local ptB = uv.getVertexPosition 1 _points[2];
			local dx = ptB.x - ptA.x;
			local dy = ptB.y - ptA.y;
			
			local a_off = get2VertsAngleDiff dx dy;

			uv.unwrap2.selectElement();
			uv.unwrap2.RotateSelected (-a_off  * PI/180) [(ptA.x + dx/2),(ptA.y + dy/2),0]
			uv.unwrap2.selectEdges #{_edge};

			local ptA = uv.getVertexPosition 1 _points[1];
			local ptB = uv.getVertexPosition 1 _points[2];
			local dx = ptB.x - ptA.x;
			local dy = ptB.y - ptA.y;
			local a_off = get2VertsAngleDiff dx dy;
			
			if (a_off != 0)then(--stupid angle snap is on
				print("shut off the angle snap..");
				max angle snap toggle ;--shut it up
				uv.unwrap2.selectElement();
				uv.unwrap2.RotateSelected (-a_off  * PI/180) [(ptA.x + dx/2),(ptA.y + dy/2),0]
				uv.unwrap2.selectEdges #{_edge};
			)
		)else
			messagebox "select just 1 edge!"
		)
	)
)
			)
			
		on NormUV_Button pressed do
		(
			--original script PAUL GREVESON
	--http://www.greveson.co.uk/scripts/normalizeUvScale.ms
	--THEN
	--TEX TOOLS 
	--http://www.scriptspot.com/3ds-max/scripts/textools-toolbox-for-the-texture-artist
	--http://renderhjs.net/textools/3dsMax.html
	
undo on
(
	(
		if selection.count == 1 then (
			local obj = selection[ 1 ];
			local hadUnwrap = true
			local success = true
			local normalizeAll = true
			if classOf obj.baseObject == Editable_Poly then (
				max modify mode
				if obj.modifiers[ #unwrap_uvw ] == undefined then (
					hadUnwrap = false
					addModifier obj ( unwrap_uvw() )
				)
				
				local uv = obj.modifiers[ #unwrap_uvw ]
				-- Store current selection, and check if the edit window is open or not.
				local origLevel = 0
				for i = 0 to 3 do (
					if subObjectLevel == i then origLevel = i
				)
				local windowOpen = false
				local uvWndH = uv.getWindowH()
				if uvWndH > 0 and uvWndH < 5000 then windowOpen = true
				local origVerts = uv.getSelectedVertices()
				local origEdges = uv.getSelectedEdges()
				local origFaces = uv.getSelectedFaces()
				local alwaysEdit = uv.getAlwaysEdit()
				
				uv.setAlwaysEdit false
				
				-- Check what the original selection was for each mode.
				subObjectLevel = 1
				local sel = #{}
				if origLevel == 0 then (
					max select all
					sel = uv.getSelectedVertices()
				)
				else if origLevel == 1 then (
					if ( origVerts as array ).count == 0 then (
						max select all
						sel = uv.getSelectedVertices()
					)
					else (
						sel = origVerts
						normalizeAll = false
					)
				)
				else if origLevel == 2 then (
					if ( origEdges as array ).count == 0 then (
						max select all
						sel = uv.getSelectedVertices()
					)
					else (
						uv.edgeToVertSelect()
						sel = uv.getSelectedVertices()
						normalizeAll = false
					)
				)
				else (
					if ( origFaces as array ).count == 0 then (
						max select all
						sel = uv.getSelectedVertices()
					)
					else (
						uv.faceToVertSelect()
						sel = uv.getSelectedVertices()
						normalizeAll = false
					)
				)
				
				-- Determine the amount of elements and store the vertex index of all vertices in each element.
				local numVerts = uv.numberVertices()
				local vertElemArray = #()
				for i = 1 to numVerts do ( vertElemArray[ i ] = 0 )
				local elements = 0
				local elemVerts = #{}
				
				with redraw off
				for v = 1 to numVerts do (
					-- If vertex has no element assigned yet, create a new element.
					if vertElemArray[ v ] == 0 then (
						uv.selectVertices #{ v }
						uv.selectElement()
						elemVerts = uv.getSelectedVertices()
						-- Ignore elements with less than 3 UV vertices.
						if ( elemVerts as array ).count > 2 then (
							elements += 1
							for i in elemVerts do (
								vertElemArray[ i ] = elements -- Mark these vertices with their element number in vertElemArray.
							)
						)
					)
				)
			
				local elementArray = #()
				-- Get the first vertex index for each element.
				for e = 1 to elements do (
					for v = 1 to vertElemArray.count do (
						if vertElemArray[ v ] == e then (
							elementArray[ e ] = v
							exit
						)
					)
					e += 1
				)
				
				local workObj = obj
				-- Check if we need to snapshot or not.
				if obj.modifiers.count > 1 then ( 	
					-- Snapshot to work with.
					objSnap = copy obj
					collapseStack objSnap

					workObj = objSnap
				)
				
				if success and elements > 0 then (
					-- Check how many polys in the object, only show progress bar for dense meshes.
					local showProgress = false
					if polyop.getNumFaces workObj > 2000 then showProgress = true
					
					local uvAreas = #()
					local geoAreas = #()
					local uvRatios = #()
					uvRatios[ elements ] = 0;
					
					with redraw off
					for i = 1 to elements do (
						
						local uvArea = 0.0
						local geoArea = 0.0
						
						subObjectLevel = 1
						uv.selectVertices #{ elementArray[ i ] }
						uv.selectElement()
						uv.vertToFaceSelect()
						subObjectLevel = 3
						local polySel = uv.getSelectedPolygons() as array
						
						-- Start a progress bar.
						local progString = "" as stringStream
						format "Normalizing element %/%..." i elements to:progString
						if showProgress then progressStart ( progString as string )
						
						-- Work through all the faces in the element to get its UV verts and face area.
						for p = 1 to polySel.count do (
							local vCount = ( uv.numberPointsInFace polySel[ p ] )
							local faceVerts = #()
							local uvPos = #()
							local thisUvArea = 0.0
							faceVerts[ vCount ] = 0
							uvPos[ vCount ] = 0
							
							for v = 1 to vCount do (
								faceVerts[ v ] = ( uv.getVertexIndexFromFace polySel[ p ] v )
							)
							
							local temp = 1
							for f in faceVerts do (
								uvPos[ temp ] = ( uv.getVertexPosition 0 f )
								temp += 1
							)
							
							-- Cheap hack to avoid more complicated maths later! :)
							append uvPos uvPos[ 1 ]
							
							-- Add up each UV face area for this element.
							for u = 1 to vCount do (
								local self = uvPos[ u ]
								local next = uvPos[ u+1 ]
								thisUvArea += ( ( self.x * next.y ) - ( next.x * self.y ) )
							)
							-- Make sure our UV area amount is +ive and do the final calculation.
							thisUvArea = abs thisUvArea
							thisUvArea *= 0.5
							
							-- Add up all the UV and geometric face areas of this element.
							geoArea += ( polyOp.getFaceArea workObj polySel[ p ] )
							uvArea += thisUvArea
		
							-- Update the progress bar for this element.
							if showProgress then progressUpdate ( 100.0 * p / polySel.count )
						)
						if showProgress then progressEnd()
		
						-- Find the surface ratio for this element.
						uvRatios[ i ] = ( sqrt ( uvArea / geoArea ) )
					)
					
					-- Find which elements correspond to original selections.
					local selElements = #()
					selElements[ elements ] = 2
					if normalizeAll then (
						for i = 1 to elements do (
							selElements[ i ] = 1
						)
					)
					else (
						for i = 1 to elements do (
							subObjectLevel = 1
							uv.selectVertices #{ elementArray[ i ] }
							uv.selectElement()
							local tempSel = uv.getSelectedVertices()
							for e in sel do (
								for t in tempSel do (
									if e == t then (
										selElements[ i ] = 1
										exit
									)
								)
							)
							if selElements[ i ] != 1 then (
								selElements[ i ] = 0
							)
						)
					)
				
					-- Scale each element relative to the first.
					local scaleFactor = 1.0
					local avgFactor = 0.0
					with redraw off
					for i = 1 to elements do (
						if selElements[ i ] == 1 then (
							scaleFactor = ( uvRatios[ 1 ] / uvRatios[ i ] )
							subObjectLevel = 1
							uv.selectVertices #{ elementArray[ i ] }
							uv.selectElement()
							uv.scaleSelectedVerticesCenter scaleFactor 0
						)
						avgFactor += ( 1 / scaleFactor )
					)
					
					avgFactor = avgFactor / elements
					
					-- Average 'em all.
					with redraw off
					for i = 1 to elements do (
						if selElements[ i ] == 1 then (
							subObjectLevel = 1
							uv.selectVertices #{ elementArray[ i ] }
							uv.selectElement()
							uv.scaleSelectedVerticesCenter avgFactor 0
						)
					)
				)
								
				-- Delete the temporary object if necessary.
				if obj.modifiers.count > 1 then (
					delete objSnap
				)
				
				-- Reset the selections to the originals.
				uv.selectVertices origVerts
				uv.selectEdges origEdges
				uv.selectFaces origFaces
				uv.setAlwaysEdit alwaysEdit
				-- Also open the Edit UVWs window if it was already open.
				if windowOpen then uv.edit()
				-- Go back to original subObjectLevel.
				subObjectLevel = origLevel
				-- Remove the Unwrap UVW modifier if necessary after the script failed.
				if not hadUnwrap and not success then deleteModifier obj uv
			)
		)
	)
)
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
			)
		on ExpSel_Button pressed do
		(
			if selection.count > 0 then--if selection is greater than 0
	(
		actionMan.executeAction 0 "40373"  -- File: Export Selected
		print "File Exported!"
	)
else
	messagebox "Error:NOTHING SELECTED!" title:"Deafult FBX Export Selected"
			)
		on BImp_Button pressed do
		(
			
--Undo cant be done so save first
--get the folder for file imports
importdir = getSavePath import files
--specify import file type
files = getFiles (importdir+("\*.fbx"))
for i in files do
(
 --for each file in the folder do the following
 --import
 importFile i --#noPrompt <activates no prompt 
 --NB. check the dialogue values first esp. weld threshold
 --uses the defaults from the import dialogue ie. the last values set
 --
 --select all the objects inc those already frozen in the scene
 max select all
 --get rid of those already frozen from the selection
 --ie.previously imported and grouped objects
 --since max selects objects regardless of their frozen state
 --in maxscript
 for s in selection do
  (
   if s.isFrozen == true do
   deselect s
  )
 --group these objects under the dwg name
 group selection name:(filenameFromPath i)
 --freeze them so that the next imported set can be isolated
 max freeze selection
 --deselect everything to clear selected frozen objects from the set.
 max select none
 --and repeat until all the files are done
)
max unfreeze all

actionMan.executeAction 0 "40021"  -- Selection: Select All	
actionMan.executeAction 0 "40141"  -- Groups: Ungroup --first ungroup

actionMan.executeAction 0 "40021"  -- Selection: Select All 
actionMan.executeAction 0 "40141"  -- Groups: Ungroup --second ungroup 

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
rdFloater = newrolloutfloater "Quick!" 140 500
addrollout Quick rdFloater rolledup: true 
addrollout Pivots rdFloater rolledup: true 
addrollout Checks rdFloater rolledup: true 
addrollout UnitsSetupRollout rdFloater rolledup: true  
addrollout Unwrapping rdFloater rolledup: true 
addrollout ExportImport rdFloater rolledup: true 
addrollout Credits rdFloater rolledup: true 

print "Quick! Now Open!"
)