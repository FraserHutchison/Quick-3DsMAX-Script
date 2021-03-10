How to create .mzp file

    1. Right click the items wanted (NOT the overall folder) and send to .ZIP (Must be .ZIP)
   
    2. Rename .ZIP to .mzp

--------------------------------------------------------------------------------------------------------------------

```MAXScript
name "*insert name*"

version *insert number (can be float)*

copy "*filename*.ms" to "$userScripts\*Custom folder name*"

drop "*filename* .ms"
run "*filename* .ms"

clear temp on MAX exit
```

--------------------------------------------------------------------------------------------------------------------

Example .Run file

    ```
    name "Quick!_v2"

    version 2.0

    copy "DropScript.ms" to "$userScripts\Quick!_v2\"
    copy "AffectPivotOnly.ms" to "$userScripts\Quick!_v2\"
    copy "AlignUV.ms" to "$userScripts\Quick!_v2\"
    copy "CentrePivot.ms" to "$userScripts\Quick!_v2\"
    copy "EditablePoly.ms" to "$userScripts\Quick!_v2\"
    copy "MakeItDarkGrey.ms" to "$userScripts\Quick!_v2\"
    copy "MakeItGrey.ms" to "$userScripts\Quick!_v2\"
    copy "MoveToCentre.ms" to "$userScripts\Quick!_v2\"
    copy "PivotToBase.ms" to "$userScripts\Quick!_v2\"
    copy "ResetXForm.ms" to "$userScripts\Quick!_v2\"
    copy "RolloutLibrary.ms" to "$userScripts\Quick!_v2\"
    copy "SmoothGroupsByUvShells.ms" to "$userScripts\Quick!_v2\"

    drop "DropScript.ms"
    run "DropScript.ms"

    clear temp on MAX exit
    ```
