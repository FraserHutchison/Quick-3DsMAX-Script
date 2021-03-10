How to create .mzp file

    1. Right click the items wanted (NOT the overall folder) and send to .ZIP (Must be .ZIP)
   
    2. Rename .ZIP to .mzp

--------------------------------------------------------------------------------------------------------------------
[Example](Scripts/mzp.run) structure of a .run file for running the initial folder copyiny and drop script.

```
name "*insert name*"

version *insert number (can be float)*

copy "*filename*.ms" to "$userScripts\*Custom folder name*"

drop "*filename* .ms"
run "*filename* .ms"

clear temp on MAX exit
```

--------------------------------------------------------------------------------------------------------------------

Drop Scripts are also used to run files straight away. Find an example [here](Scripts/DropScript.ms)

```MAXScript
try
(
	fileIn "*File Name*"
--OR
	fileIn ((pathConfig.GetDir #userScripts)+"\\*File Name*");

		
	MessageBox("Files Installed")
)

catch
(
	MessageBox("Something went wrong...")
	print "Could not find *File Name*"
)
```
