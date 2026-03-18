; MapRedeem.ahk - Адаптировано под VarX / VarY, оригинальные цвета сохранены
; Паузы оптимизированы: оставлены только там, где нужен серверный отклик (до 1 сек)

#Include Functions\subFunctions\ClaimCampaign.ahk
#Include Functions\subFunctions\MapClose.ahk
#Include Functions\subFunctions\MapStart.ahk

; Function to redeem the missions
MapRedeem(){
    CoordMode, Pixel, Screen
    ControlFocus,, Firestone

    ; check if missions can be reset for free (ЭТО ПРОВЕРИТЬ И ПЕРЕДЕЛАТЬ)
    MsgBox, , Рестарт миссий, Проверяем: можно ли бесплатно перезагрузить миссии, 1.5
    ControlFocus,, Firestone
    PixelSearch, X, Y, 221*VarX, (878-22)*VarY + BorTop, 277*VarX, (891-22)*VarY + BorTop, 0x47ACFC, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 173*VarX, (918-22)*VarY + BorTop, 0
        MsgBox, , Рестарт миссий, УРА! кнопка FREE!, 1.5
        Click
        Sleep, 1000  ; серверный отклик
    }

    Checks:
    ; check for active missions and their progress
    MsgBox, , MapRedeem.ahk, Проверяем прогресс миссий, 1.5
    ControlFocus,, Firestone

    ; look for no missions (песочный цвет)
    PixelSearch, X, Y, 117*VarX, (240-22)*VarY + BorTop, 240*VarX, (352-22)*VarY + BorTop, 0xEFDAC1, 3, Fast RGB
    If (ErrorLevel != 0){
        MsgBox, , MapRedeem.ahk, Активных миссий не найдено, 1.5
        ControlFocus,, Firestone
        Goto, Troops
    }

    ; check for already completed missions
    PixelSearch, X, Y, 207*VarX, (305-22)*VarY + BorTop, 244*VarX, (348-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 162*VarX, (334-22)*VarY + BorTop, 0
        MsgBox, , MapRedeem.ahk, Миссия уже выполнена!, 1.5
        Click
        Sleep, 1000          ; серверный отклик
        MouseMove, 971*VarX, (628-22)*VarY + BorTop, 0
        Sleep, 1000          ; пауза перед вторым кликом
        Click
        Sleep, 1000          ; серверный отклик
        Goto, Checks
    }
    
    ; === ПОИСК КНОПКИ FREE ===
    MouseMove, 162*VarX, (284-22)*VarY + BorTop, 0
    Sleep, 500               ; лёгкая пауза перед кликом
    Click
    Sleep, 1000              ; серверный отклик — ждём появления кнопок

    ; Проверяем наличие красной кнопки (миссию нельзя завершить бесплатно)
    PixelSearch, X, Y, 945*VarX, (715-22)*VarY + BorTop, 1215*VarX, (810-22)*VarY + BorTop, 0xE64A42, 5, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , MapRedeem.ahk, % "До завершения миссии БОЛЬШЕ 3х минут", 1.5
        MapClose()
        Goto, Troops
    } Else {
        MsgBox, , MapRedeem.ahk, % "Похоже, можно завершить бесплатно", 1
        PixelSearch, X, Y, 945*VarX, (715-22)*VarY + BorTop, 1215*VarX, (810-22)*VarY + BorTop, 0xAFAFAF, 3, Fast RGB
        If (ErrorLevel = 0){
            MsgBox, , MapRedeem.ahk, % "Миссию можно завершить БЕСПЛАТНО", 1.5
            MouseMove, (1230+1495)/2*VarX, ((715+810)/2-22)*VarY + BorTop, 0
            Click
            Sleep, 1000      ; серверный отклик
            MapClose()
            Goto, Checks
        } Else {
            MsgBox, , MapRedeem.ahk, % "Что-то сломалось. Не могу найти ни красную, ни серую кнопку!", 1.5
            MapClose()
            Goto, Troops
        }
    }

    Troops:
    MsgBox, , Проверка отрядов, Поиск свободных отрядов., 1.5
    ControlFocus,, Firestone

    ; Check if there are idle troops
    PixelSearch, X, Y, 1140*VarX, (996-22)*VarY + BorTop, 1187*VarX, (1012-22)*VarY + BorTop, 0x542710, 10, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Проверка отрядов, есть СВОБОДНЫЕ отряды и ДОСТУПНЫ миссии, 1
        if (SearchMissoin = 1){
            MapStart()
        } Else {
            MsgBox, , SearchMissoin = 0, поиск новых миссий ОТКЛЮЧЕН, 1
        }
    } Else {
        MsgBox, , Проверка отрядов, свободных отрядов нет - УХОДИМ, 1.5
    }

    ; Reset the memory if we found the reset map mission button
    ControlFocus,, Firestone
    Sleep, 500
    PixelSearch, X, Y, 104*VarX, (878-22)*VarY + BorTop, 300*VarX, (977-22)*VarY + BorTop, 0xEF00ED, 3, Fast RGB
    If (ErrorLevel = 0){
        stateFile := "MapStartState.ini"
        ClickedPoints := ""
        SessionStart := A_Now
        IniWrite, %SessionStart%, %stateFile%, Memory, SessionStart
        IniWrite, %ClickedPoints%, %stateFile%, Memory, ClickedPoints
        global MapReset
        IniRead, MapReset, settings.ini, MissionPriority, MapReset, 0
        if (MapReset = 1){
            MouseMove, 200*VarX, (930-22)*VarY + BorTop, 0
            MsgBox, , Перезагрузка миссий, Reset map mission - пизда твоим самоцветам, 1.5
            ControlFocus,, Firestone
            Sleep, 500
            Click
            Sleep, 1500      ; серверный отклик (тяжёлая операция)
            MouseMove, 961*VarX, (675-22)*VarY + BorTop, 0
            Click
            Sleep, 500       ; лёгкая пауза перед переходом
            Goto, Troops
        }
    }

    ClaimCampaign()
}