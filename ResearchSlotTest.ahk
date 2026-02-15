;ResearchSlotTest.ahk

ResearchSlotTest() {
    ; make sure slot 2 is purchased
    MsgBox, , Slot 2 Status, Проверяем статус слота 2..., 1.5
    PixelSearch, X, Y, 1208*VarX, (892-22)*VarY + BorTop, 1264*VarX, (931-22)*VarY + BorTop, 0x6F6F6F, 1, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Slot 2 Status, Слот 2 не куплен - setting to in progress, 1.5
        Slot2InProcess := 1
        Goto, Slot1Check
    }
    ; check for in process research in slot 2
    PixelSearch, X, Y, 1228*VarX, (889-22)*VarY + BorTop, 1269*VarX, (929-22)*VarY + BorTop, 0x916A37, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Slot 2 Status, Слот 2 - идёт исследование, 1.5
        Slot2InProcess := 1
        Goto, Slot1Check
    }
    ; checking if slot 2 is ready for free claim
    PixelSearch, X, Y, 1234*VarX, (912-22)*VarY + BorTop, 1272*VarX, (974-22)*VarY + BorTop, 0xF9AA47, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 1204*VarX, (938-22)*VarY + BorTop
        MsgBox, , Slot 2 Status, Слот 2 доступен для БЕСПЛАТНОГО завершения., 1.5
        Click
        Sleep, 1000
        Slot2InProcess := 0
        Goto, Slot1Check
    }
    ; checking if slot 2 is completed
    PixelSearch, X, Y, 1234*VarX, (912-22)*VarY + BorTop, 1272*VarX, (974-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Slot 2 Status, Слот 2 готов к ЗАВЕРШЕНИЮ., 1.5
        MouseMove, 1204*VarX, (938-22)*VarY + BorTop
        Sleep, 1000
        Click
        Sleep, 1000
        Slot2InProcess := 0
        Goto, Slot1Check
    }
    MsgBox, , Slot 2 Status, Слот 2 не запущен..., 1.5
    Slot2InProcess := 0
    Goto, Slot1Check
    
    Slot1Check:
    ; check for in process research in slot 1
    MsgBox, , Slot 1 Status, Проверяем статус слота 1... , 1.5
    PixelSearch, X, Y, 603*VarX, (891-22)*VarY + BorTop, 624*VarX, (932-22)*VarY + BorTop, 0x916A37, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Slot 1 Status, Слот 1 - идёт исследование, 1.5
        Slot1InProcess := 1
        Return
    }
    ; checking if slot 1 is ready for free claim
    PixelSearch, X, Y, 588*VarX, (911-22)*VarY + BorTop, 620*VarX, (967-22)*VarY + BorTop, 0xF9AA47, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 575*VarX, (940-22)*VarY + BorTop ; x=545 origin
        MsgBox, , Slot 1 Status, Слот 1 доступен для БЕСПЛАТНОГО завершения., 1.5
        Click
        Sleep, 1000
        Slot1InProcess := 0
        If (Slot2InProcess = 1){
            Slot1InProcess := 1
            Slot2InProcess := 0
            MsgBox, , Changing Slot Status, Changing Slot 1 to In Process and Slot 2 to Not in Process, 2
            Return
        }
    }
    ; checking if slot 1 is complete
    PixelSearch, X, Y, 588*VarX, (911-22)*VarY + BorTop, 620*VarX, (967-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Slot 1 Status, Слот 1 готов к ЗАВЕРШЕНИЮ., 1.5
        MouseMove, 575*VarX, (940-22)*VarY + BorTop ; x=545 origin
        Sleep, 1000
        Click
        Sleep, 1000
        Slot1InProcess := 0
        If (Slot2InProcess = 1){
            Slot1InProcess := 1
            Slot2InProcess := 0
            MsgBox, , Changing Slot Status, Changing Slot 1 to In Process and Slot 2 to Not in Process, 2
        }
        Return
    }
    MsgBox, , Slot 1 Status, Slot 1 is not in progress., 1.5
    Slot1InProcess := 0
}