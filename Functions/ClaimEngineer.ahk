;ClaimEngineer.ahk

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\WMUpgrade.ahk

ClaimEngineer(){
    ControlFocus,, Firestone
    ;	open engineer
	MsgBox, ,Инженер, открывам механика, 1
    MouseMove, 1230*VarX, (820-22)*VarY + BorTop
    Sleep, 1000
    Click
    Sleep, 1500
    ; check if option to level WM's is chosen
    GuiControlGet, SelectedItem, ,UpgradeWM,
        If (SelectedItem != "Don't Upgrade WM's"){                
            MouseMove, 964*VarX, (507-22)*VarY + BorTop
            Sleep, 1000
            Click
            Sleep, 1500
            WMUpgrade()
            ; open engineer 
            MouseMove, 131*VarX, (435-22)*VarY + BorTop
            Sleep, 1000
            Click
            Sleep, 1500
            Goto, ClaimTools
        } 
    ; select engineer
    MouseMove, 610*VarX, (540-22)*VarY + BorTop
    Sleep, 1000
    Click
    Sleep, 1500
    ClaimTools:
    ; claim tools
    PixelSearch, X, Y, 1709*VarX, (686-22)*VarY + BorTop, 1747*VarX, (733-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0 ){
        MouseMove, 1642*VarX, (704-22)*VarY + BorTop
        Sleep, 1000
        Click
        Sleep, 1000
    }
    BigClose()
    return
}
