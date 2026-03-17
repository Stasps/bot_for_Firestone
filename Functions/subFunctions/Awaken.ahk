; Awaken.ahk — адаптированно

#Include Functions\subFunctions\BigClose.ahk

AwakenRun(){
    ControlFocus,, Firestone
    MsgBox, ,Awaken.ahk, Пробуждаем героев, 1
    
    ; Check for awaken heroes notification on crystal screen
    PixelSearch, X, Y, 1107*VarX, (745-22)*VarY + BorTop, 1367*VarX, (944-22)*VarY + BorTop, 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1192*VarX, (847-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1500
        
        ; look for and click highest x#
        ; проверяем крайний правый (5x)
        PixelSearch, X, Y, 1839*VarX, (313-22)*VarY + BorTop, 1902*VarX, (328-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1865*VarX, (338-22)*VarY + BorTop, 0
            Sleep, 1000
            Click
            Sleep, 1000
        } Else {
            ; проверяем 4x
            PixelSearch, X, Y, 1739*VarX, (316-22)*VarY + BorTop, 1802*VarX, (330-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0){
                MouseMove, 1767*VarX, (342-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            } Else {
                ; проверяем 3x
                PixelSearch, X, Y, 1639*VarX, (315-22)*VarY + BorTop, 1706*VarX, (319-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
                If (ErrorLevel = 0){
                    MouseMove, 1676*VarX, (339-22)*VarY + BorTop, 0
                    Sleep, 1000
                    Click
                    Sleep, 1000
                }
            }
        }
        
        ; Change to auto
        MouseMove, 1774*VarX, (993-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 20000
        BigClose()
    }
}