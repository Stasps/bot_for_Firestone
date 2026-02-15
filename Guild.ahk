; Guild.ahk

#Include Functions\subFunctions\Awaken.ahk
#Include Functions\subFunctions\Chaos.ahk
#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\PTree.ahk

; expeditions function
Guild(){
    ControlFocus,, Firestone
    ; open guild
    MsgBox, , Guild.ahk, Открываем окно гильдии, 1.5
    MouseMove, 1857*ResXnew/1920, ((481-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    ; check if expeditions are ready
    PixelSearch, X, Y, 450*ResXnew/1920, ((410-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 380*ResXnew/1920, ((490-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 308*ResXnew/1920, ((406-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
        MouseMove, 1321*ResXnew/1920, ((331-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
        Click
        Sleep, 1000
        BigClose()
    }
    ; check if awaken heroes is selected
    GuiControlGet, Checked, , Awaken,
    If (Checked = 1){
        AwakenRun()
    }
    ; check if Chaos Rift is selected
    GuiControlGet, Checked, , Chaos,
    If (Checked = 1){
        HitChaos()
    }
    ; check if skipping claiming pickaxes
    GuiControlGet, Checked, , Pickaxes,
        If (Checked = 1){
            Goto, CrystalHit
        } Else {
            ClaimAxes()
        }
    CrystalHit:
    ; check if we are doing crystal hits
    GuiControlGet, Checked, , Crystal,
        If (Checked = 1){
            HitCrystal()
        }
    ; see if we are running personal tree or not
    GuiControlGet, Checked, , PTree,
    If (Checked = 1){
        MouseMove, 1560*ResXnew/1920, ((366-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
        PersonalTree()
    }
    ; check if clearing guild notifications
    GuiControlGet, Checked, , GNotif,
    If (Checked = 1){
        ClearNotifications()
    }
    BigClose()
    Return
}
ClaimAxes(){
    MouseMove, 639*ResXnew/1920, ((263-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    MouseMove, 141*ResXnew/1920, ((740-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    PixelSearch, X, Y, 764*ResXnew/1920, ((617-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 869*ResXnew/1920, ((653-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x1EA569, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 716*ResXnew/1920, ((637-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
    }
    BigClose()
    Return
}
HitCrystal(){
    MouseMove, 1646*ResXnew/1920, ((928-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    PixelSearch, X, Y, 1101*ResXnew/1920, ((904-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1075*ResXnew/1920, ((946-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 957*ResXnew/1920, ((896-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
    }
    BigClose()
    Return
}
ClearNotifications(){
    MouseMove, 1056*ResXnew/1920, ((487-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    BigClose()
    MouseMove, 230*ResXnew/1920, ((667-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    BigClose()
    Return
}
