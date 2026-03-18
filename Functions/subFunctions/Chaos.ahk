; Chaos.ahk Ч адаптировано

#Include Functions\subFunctions\BigClose.ahk

HitChaos(){
    ControlFocus,, Firestone
    
    ; Check for Chaos notification on guild screen
    PixelSearch, X, Y, 1400*VarX, (595-22)*VarY + BorTop, 1569*VarX, (745-22)*VarY + BorTop, 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseClick, Left, 1410*VarX, (625-22)*VarY + BorTop, 1, 0
        Sleep, 1500
        
        ; Change to auto
        MouseClick, Left, 1740*VarX, (980-22)*VarY + BorTop, 1, 0
        Sleep, 10000
        BigClose()
    }
}