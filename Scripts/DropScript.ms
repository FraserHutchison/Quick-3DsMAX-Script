-- Delete Old Version Quick!_V1.mcr"
OldScript = GetDir #userScripts + "\Quick!_V1.mcr";
deletefile OldScript
OldMacro = GetDir #userMacros + "\Quick!_V1.mcr";
deletefile OldMacro

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