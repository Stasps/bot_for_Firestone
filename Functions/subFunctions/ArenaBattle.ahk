; ArenaBattle.ahk

ArenaBattle(){
    Wait:
    PixelSearch, X, Y, 979*VarX, (753-22)*VarY + BorTop, 1056*VarX, (798-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel=0){
        MouseMove, 959*VarX, (775-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        Return True
    }
    Sleep, 2000
    Goto, Wait
}