; OraclesGift.ahk

#Include Functions\subFunctions\BigClose.ahk

OraclesGift(){
    PixelSearch, FoundX, FoundY, 1543*ResXnew/1920, ((307-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1887*ResXnew/1920, ((905-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x00EAF6, 5, Fast RGB
    If (ErrorLevel=0){
        MouseMove, FoundX, FoundY
        Sleep, 1000
        Click
        Sleep, 1000
        ; click 1
        MouseMove, 904*ResXnew/1920, ((724-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 10000 ; long delay in case 10 or more chests are opened
        BigClose()
        ; failsafe in case big close opens options
        MouseMove, 59*ResXnew/1920, ((181-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1000
    }
}