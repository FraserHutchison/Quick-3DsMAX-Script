---------------------------------------------------------------------------------------------------------------------
--ALWAYS make sure there is no other CustomTools macro under \Users\(your user name)\AppData\Local\Autodesk\3dsMax\2020 - 64bit\ENU\usermacros
---------------------------------------------------------------------------------------------------------------------
--CustomTools_V2 
--Version Number: 2.0
--Name: Fraser Hutchison
-- Twitter: @HutchisonFraser 
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
--BUGS
--1. BatchImport = If you opne BatchImport then close it, you will get an error and the MaxScript Editor will appear
--Solution for now: close the MaxScript Editor and also CustomTools, then you are free to open it again using your cutsom shortcut.

--2.Smart Stitch = Sometimes the smart sticth doesnt work the best, I am unsure why. For the most part is works fine.
--Solution: N/A for now
---------------------------------------------------------------------------------------------------------------------
macroScript CustomTools_V2 category:"CustomScripts"
(
include "RolloutLibrary.ms"
)