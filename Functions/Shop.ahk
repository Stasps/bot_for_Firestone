; Shop.ahk

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\MainMenu.ahk

lastExecutionTimeShop := 0

Shop(){
	MsgBox, ,Shop.ahk, забираем ежедневные награды, 1
    ControlFocus,, Firestone
    PixelSearch, X, Y, 1876*VarX, (523-22)*VarY + BorTop, 1905*VarX, (564-22)*VarY + BorTop, 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1857*VarX, (583-22)*VarY + BorTop
        Sleep, 1000
        Click
        Sleep, 1500
        ; claim mystery box
        MouseMove, 591*VarX, (754-22)*VarY + BorTop
        Sleep, 1000
        Click
        Sleep, 1000
        ; open daily check-in
        MouseMove, 1383*VarX, (116-22)*VarY + BorTop
        Sleep, 1000
        Click
        Sleep, 1000
        ; check in
        MouseMove, 1346*VarX, (894-22)*VarY + BorTop
        Sleep, 3000
        Click
        Sleep, 1000
        MouseMove, 1339*VarX, (828-22)*VarY + BorTop
        Sleep, 3000
        Click
        Sleep, 1000
        BigClose()
        MsgBox, , Main Menu Check, Checking to ensure we are on main screen after redeeming shop gifts, 2
        MainMenu()
    }
}
