; ClaimEvents.ahk Ч адаптированно

#Include Functions\subFunctions\BigClose.ahk

ClaimEvents(){
    ControlFocus,, Firestone
    
    ; check for event notification
    PixelSearch, X, Y, 1719*VarX, (170-22)*VarY + BorTop, 1741*VarX, (204-22)*VarY + BorTop, 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        ; open events
        MouseMove, 1691*VarX, (229-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        ; click top event
        MouseMove, 942*VarX, (359-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        
        ; click challenges
        MouseMove, 1125*VarX, (70-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        
        ; claim challenge 1
        PixelSearch, X, Y, 1540*VarX, (365-22)*VarY + BorTop, 1568*VarX, (405-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1483*VarX, (382-22)*VarY + BorTop, 0
            Sleep, 1000
            Click
            Sleep, 500
        }
        
        ; claim challenge 2
        PixelSearch, X, Y, 1538*VarX, (592-22)*VarY + BorTop, 1566*VarX, (633-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1496*VarX, (604-22)*VarY + BorTop, 0
            Sleep, 1000
            Click
            Sleep, 500
        }
        
        ; claim challenge 3
        PixelSearch, X, Y, 1530*VarX, (823-22)*VarY + BorTop, 1568*VarX, (870-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1500*VarX, (837-22)*VarY + BorTop, 0
            Sleep, 1000
            Click
            Sleep, 500
        }
        
        BigClose()
        BigClose()
        MsgBox, , Main Menu Check, Checking to ensure we are on main screen after claiming events, 2
        MainMenu()
    }
}