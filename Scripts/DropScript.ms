-- Delete Old Version Quick!_V1.mcr"
OldScript1 = GetDir #userScripts + "\Quick!_V1.mcr";
deletefile OldScript1
OldScript2 = GetDir #userScripts + "\Quick_-QuickTools.mcr";
deletefile OldScript2

OldMacro1 = GetDir #userMacros + "\Quick!_V1.mcr";
deletefile OldMacro1
OldMacro2 = GetDir #userMacros + "\Quick_-QuickTools.mcr";
deletefile OldMacro2

try
(
	--fileIn ((pathConfig.GetDir #userScripts)+"\\Quick!_v2\\RolloutLibrary.ms");
	--fileIn ((pathConfig.GetDir #userScripts)+"\\Quick!_v2\\MacroScript.ms");
	
	fileIn "RolloutLibrary.ms"
	fileIn "MacroScript.ms"
	fileIn ((pathConfig.GetDir #userScripts)+"\\Quick!_v2\\MacroScript.ms");
		
	MessageBox("Quick! Installed! Old Version Uninstalled.                                                                                     GO TO: Customize> Customize User Interface> Keyboard> Category> Quick! - To set a shortcut!")
)
catch
(
	MessageBox("Something went wrong...")
	print "Could not find RolloutLibrary.ms"
)