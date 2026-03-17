; Quests.ahk Ч адаптированно

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\MainMenu.ahk

; claim daily quests
ClaimQuests(){
    ; open character window
    MouseMove, 90*VarX, (112-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
    
    ; open quests tab
    MouseMove, 1455*VarX, (74-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
    
    ; click daily quest tab
    MouseMove, 765*VarX, (155-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
    
    ; claim daily quest reward
    PixelSearch, X, Y, 1544*VarX, (286-22)*VarY + BorTop, 1606*VarX, (334-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1503*VarX, (309-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        
        MouseMove, 1619*VarX, (990-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
    }
    
    ; click weekly quests tab
    MouseMove, 1165*VarX, (154-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
    
    ; claim weekly quest reward
    PixelSearch, X, Y, 1544*VarX, (286-22)*VarY + BorTop, 1606*VarX, (334-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1503*VarX, (309-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        
        MouseMove, 1619*VarX, (990-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
    }
    
    BigClose()
    Return
}