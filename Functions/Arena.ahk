;Arena.ahk

#Include Functions\subFunctions\ArenaBattle.ahk
#Include Functions\subFunctions\BigClose.ahk

Arena(){
    ; Фокус на окно Firestone (работает и для приложения, и для браузера)
    ControlFocus,, Firestone
    
    ; open battles
    MouseMove, 362*VarX, (204-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1500
    
    ; choose arena of kings
    MouseMove, 1120*VarX, (507-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1500
    
    ; define Xcoords for random opponent selection
    XCoords := [700*VarX, 954*VarX, 1220*VarX]
    Random, RandomIndex, 1, 3
    RandomX := XCoords[RandomIndex]
    Sleep, 1000
    
    Loop, 5{
        ;refresh opponents
        MouseMove, 871*VarX, (195-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 3000
        
        ; choose random opponent
        MouseMove, %RandomX%, (630-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        
        ; check for buy more battles popup
		; ERROR 1243, 669, 1291, 713 - может съезжать. расширил
        PixelSearch, X, Y, 1200*VarX, (500-22)*VarY + BorTop, 1400*VarX, (713-22)*VarY + BorTop, 0x0AA008, 10, Fast RGB
        If (ErrorLevel=0){
			MsgBox, 64, Попытки кончились, Отключи настройку "сражаться на арене" до завтра, 1
            BigClose()
            BigClose()
            Return
        }
        
        MouseMove, 961*VarX, (570-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        
        While, !ArenaBattle(){
            Sleep, 5000
        }
        
        Continue
    }
    
    BigClose()
}