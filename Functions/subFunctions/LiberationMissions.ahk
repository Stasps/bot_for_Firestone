; LiberationMissions.ahk

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\LiberationInProgressCheck.ahk

LiberationMissions(){
    ControlFocus,, Firestone
    
    ; open daily missions if notification present
    PixelSearch, X, Y, 1873*VarX, (920-22)*VarY + BorTop, 1900*VarX, (954-22)*VarY + BorTop, 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1800*VarX, (982-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
    } Else {
        Return
    }
    
    ; open Liberation
    MouseMove, 697*VarX, (788-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1500
    
    Loop, 70{
        Send, {WheelDown}
        Sleep, 50
    }
    
    ; === 319 Stars ===
    319Stars:
    {
        MouseMove, 1583*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 190Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 190Stars
    }
    
    ; === 190 Stars ===
    190Stars:
    {
        MouseMove, 1191*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 155Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 155Stars
    }
    
    ; === 155 Stars ===
    155Stars:
    {
        MouseMove, 791*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 110Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 110Stars
    }
    
    ; === 110 Stars ===
    110Stars:
    {
        MouseMove, 412*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 80Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 80Stars
    }
    
    ; === 80 Stars ===
    80Stars:
    {
		; error - тут возможна ошибка. потому 133 заменил на 145
        MouseMove, 145*VarX, (748-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 60Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 60Stars
    }
    
    ; === 60 Stars ===
    60Stars:
    {
        Loop, 63{
            Send, {WheelUp}
            Sleep, 50
        }
        MouseMove, 1688*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 40Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 40Stars
    }
    
    ; === 40 Stars ===
    40Stars:
    {
        MouseMove, 1291*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 20Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 20Stars
    }
    
    ; === 20 Stars ===
    20Stars:
    {
        MouseMove, 900*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 10Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 10Stars
    }
    
    ; === 10 Stars ===
    10Stars:
    {
        MouseMove, 517*VarX, (755-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            Goto, 5Stars
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        Goto, 5Stars
    }
    
    ; === 5 Stars ===
    5Stars:
    {
        MouseMove, 157*VarX, (758-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
        If (ErrorLevel=0){
            BigClose()
            Goto, CheckDungeon
        }
        While !LiberationInProgress(){
            Sleep, 5000
        }
        BigClose()
        Goto, CheckDungeon
    }

    ; === Dungeon Missions ===
    CheckDungeon:
    {
        GuiControlGet, Checked, , DungeonQuest,
        If (Checked = 1){
            ; open dungeon
            MouseMove, 1223*VarX, (794-22)*VarY + BorTop, 0
            Sleep, 1000
            Click
            Sleep, 1500
            
            120Stars:
            {
                MouseMove, 1149*VarX, (763-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1500
                
                PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
                If (ErrorLevel=0){
                    Goto, 70Stars
                }
                While !LiberationInProgress(){
                    Sleep, 5000
                }
                Goto, 70Stars
            }
            
            70Stars:
            {
                MouseMove, 768*VarX, (762-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1500
                
                PixelSearch, X, Y, 1723*VarX, (51-22)*VarY + BorTop, 1797*VarX, (123-22)*VarY + BorTop, 0xFF4805, 10, Fast RGB
                If (ErrorLevel=0){
                    Return
                }
                While !LiberationInProgress(){
                    Sleep, 5000
                }
            }
        }
    }
    
    BigClose()
    BigClose()
}