; LiberationInProgressCheck.ahk адаптировано

LiberationInProgress(){
    Search:
    PixelSearch, X, Y, 990*VarX, (703-22)*VarY + BorTop, 1059*VarX, (737-22)*VarY + BorTop, 0x0AA008, 10, Fast RGB
    If (ErrorLevel=0){
        MouseMove, 967*VarX, (744-22)*VarY + BorTop, 0
        Sleep, 1000
        Click
        Sleep, 1000
        Return True
    }
    Sleep, 2000
    MouseMove, 1650*VarX, (500-22)*VarY + BorTop, 0
    Goto, Search
}