
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
