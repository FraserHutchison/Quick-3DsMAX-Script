---------------------------------------------------------------------------------------------------------------------
--ALWAYS make sure there is no other Quick!(QuickTools) macro under \Users\(your user name)\AppData\Local\Autodesk\3dsMax\2020 - 64bit\ENU\usermacros
---------------------------------------------------------------------------------------------------------------------
--Quick! (QuickTools) 
--Version Number: 1.0
--Name: Fraser Hutchison
--Feel free to contact me about any issues, however I may not always be able to fix them.

---------------------------------------------------------------------------------------------------------------------
--If you want to try and fix any issues feel free.
--NOTE: This is a compiled version, the original version is split into many seperate scripts to make it easier for development
			--and makes use of teh *include* contruct. I tried to make a .mzp version however it has proven to be a real pain and for
			--now I have not bothered as teh compiled one works just fine.
---------------------------------------------------------------------------------------------------------------------
--This Tool was compiled by Fraser Hutchison
--It contains scripts made by me and also other people, to find out more go to the credits menu
---------------------------------------------------------------------------------------------------------------------
--Tested on Max 2020
--Creation date: 19/04/2020
---------------------------------------------------------------------------------------------------------------------

--this tool is called first and holds the macro script then is compiles the rollout library where all the rollouts are held.
macroScript QuickTools category:"Quick!"
(
include "RolloutLibrary.ms"
)