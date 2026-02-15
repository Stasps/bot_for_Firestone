; OracleDaily

#Include Functions\subFunctions\BigClose.ahk

OracleDaily(){
    ; Look for oracle gift notification
    PixelSearch, X, Y, 859*ResXnew/1920, ((684-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 901*ResXnew/1920, ((740-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 823*ResXnew/1920, ((760-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
        ; Claim Oracle's gift
        MouseMove, 619*ResXnew/1920, ((756-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1500
        BigClose()
    }
    Return
}
