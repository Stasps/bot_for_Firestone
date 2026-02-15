; ResearchAfterStartTest.ahk

#Include Functions\subFunctions\BigClose.ahk

RAST(){
    ; check for status of slot 2
    MsgBox, , Slot 2 Status ,Checking status of slot 2..., 1.5
    MouseMove, 1202*VarX, (944-22)*VarY + BorTop
    Sleep, 1000
    Click
    Sleep, 500
    PixelSearch, X, Y, 562*VarX, (245-22)*VarY + BorTop, 754*VarX, (311-22)*VarY + BorTop, 0x8C4221, 10, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Slot 2 Status, Slot 2 is in progress., 1.5
        Slot2InProcess := 1
        BigClose()
    } Else {
        MsgBox, , Slot 2 Status, Slot 2 is not in progress., 1.5
        Slot2InProcess := 0
    }

    If (Slot1InProcess = 1){
        MsgBox, , Slot 1 Status, Slot 1 is in Progress - skipping test, 1.5
        Return
    } Else {
        ; check for status of slot 1
        MsgBox, , Slot 1 Status, Checking status of slot 1... , 1.5
        MouseMove, 575*VarX, (939-22)*VarY + BorTop ; x=554 origin
        Sleep, 1000
        Click
        Sleep, 500
        PixelSearch, X, Y, 562*VarX, (245-22)*VarY + BorTop, 754*VarX, (311-22)*VarY + BorTop, 0x8C4221, 10, Fast RGB
        If (ErrorLevel = 0){
            MsgBox, , Slot 1 Status, Slot 1 is in progress., 1.5
            Slot1InProcess := 1
            BigClose()
            Return
        } Else {
            MsgBox, , Slot 1 Status, Slot 1 is not in progress., 1.5
            Slot1InProcess := 0
        }
    }
}