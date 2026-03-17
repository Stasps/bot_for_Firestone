; CheckMail.ahk Ч адаптировано

#Include Functions\subFunctions\BigClose.ahk

CheckMail(){
    ControlFocus,, Firestone
    
    ; open mail
    MouseMove, 56*VarX, (777-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
    
    ; attempt to click claim
    PixelSearch, X, Y, 1260*VarX, (780-22)*VarY + BorTop, 1334*VarX, (835-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1215*VarX, (808-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        
        ; click ok if mail had attachment, otherwise will be empty click in mail area
        MouseMove, 1172*VarX, (688-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
    }
    
    ; delete mail if any there
    PixelSearch, X, Y, 1533*VarX, (904-22)*VarY + BorTop, 1601*VarX, (969-22)*VarY + BorTop, 0xE9554E, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1569*VarX, (939-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
    }
    
    BigClose()
}