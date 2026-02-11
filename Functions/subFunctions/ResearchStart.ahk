; ResearchStart.ahk

#Include Functions\subFunctions\ResearchClicks.ahk

ResearchStart() {
    MouseMove, 1429*VarX, (944-22)*VarY + BorTop
    MsgBox, , Setup, Scrolling to ensure tree setup, 1.5
    If (Slot2InProcess = 1){
        Return
    }
    
    ; Page 2
    Loop, 35{
        Send, {WheelDown}
        Sleep, 100
    }
    Loop {
	    XCheck := 1700 - ((A_Index - 1) * 100)
        PixelSearch, X, Y, XCheck*VarX, (300-22)*VarY + BorTop, (XCheck + 100)*VarX, (750-22)*VarY + BorTop, 0x0D49DE, 0, Fast RGB   ;  Search coords X 100 - X 1700
        If (ErrorLevel = 0){
            MouseClick, Left, X, Y, 1, 0
            Sleep, 500
            ResearchClicks()
        }
        If (Slot2InProcess = 1){
            Return
        }
	    if (XCheck < 100)
            break
    }
    Loop, 35{
        Send, {WheelUp}
        Sleep, 100
    }
    ; look for available research - Page 1
    Loop {
	    XCheck := 1700 - ((A_Index - 1) * 100)
        PixelSearch, X, Y, XCheck*VarX, (300-22)*VarY + BorTop, (XCheck + 50)*VarX, (750-22)*VarY + BorTop, 0x0D49DE, 0, Fast RGB   ;  Search coords X 100 - X 1750
        If (ErrorLevel = 0){
            MouseClick, Left, X, Y, 1, 0
            Sleep, 500
            ResearchClicks()
        }
        If (Slot2InProcess = 1){
            Return
        }
	    if (XCheck < 100)
            break
    }
}
