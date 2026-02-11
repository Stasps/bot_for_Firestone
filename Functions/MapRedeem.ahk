; MapRedeem.ahk

#Include Functions\subFunctions\ClaimCampaign.ahk
#Include Functions\subFunctions\MapClose.ahk
#Include Functions\subFunctions\MapStart.ahk

; Function to redeem the missions
MapRedeem(){
    ControlFocus,, Firestone
    ; check if missions can be reset for free
    MsgBox, , Рестарт миссий, Проверяем: можно ли бесплатно перезагрузить миссии, 1.5
    ControlFocus,, Firestone
    PixelSearch, X, Y, 221*ResXnew/1920, ((878-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 277*ResXnew/1920, ((891-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xFCAC47, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 173*ResXnew/1920, ((918-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        MsgBox, , Рестарт миссий, УРА! кнопка FREE!, 1.5
        Click
        Sleep, 1000
    }
    Checks:
    ; check for active missions and their progress
    MsgBox, , MapRedeem.ahk, Проверяем прогресс миссий, 1.5
    ControlFocus,, Firestone
    ; look for no missions
    PixelSearch, X, Y, 117*ResXnew/1920, ((249-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 208*ResXnew/1920, ((334-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x1452B4, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , MapRedeem.ahk, Активных миссий не найдено, 1.5
        ControlFocus,,  Firestone
        Goto, Troops
    }

    ; check for already completed missions
    PixelSearch, X, Y, 207*ResXnew/1920, ((305-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 244*ResXnew/1920, ((348-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 162*ResXnew/1920, ((334-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        MsgBox, , MapRedeem.ahk, Миссия уже выполнена!, 1.5
        Click
        Sleep, 1000
        MouseMove, 971*ResXnew/1920, ((628-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1000
        Goto, Checks
    }
    ; look for greater than 3 minutes left
    MouseMove, 162*ResXnew/1920, ((334-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1000
    PixelSearch, X, Y, 1427*ResXnew/1920, ((730-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1481*ResXnew/1920, ((762-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x916A38, 0, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , MapRedeem.ahk, Mission has more than 3 minutes reamining, 1.5
        MapClose()
        Goto, Troops
    } Else {
        ; check for free to complete early missions
        PixelSearch, X, Y, 1427*ResXnew/1920, ((730-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1481*ResXnew/1920, ((762-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF9AA47, 10, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1365*ResXnew/1920, ((758-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            MsgBox, , MapRedeem.ahk, Mission can be completed early for free, 1.5
            Click
            Sleep, 1000
            MouseMove, 971*ResXnew/1920, ((628-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            Sleep, 1000
            Click
            Sleep, 1000
            Goto, Checks
        }
    }
    ; check 2nd mission in case of greyed out first mission bug
    PixelSearch, X, Y, 205*ResXnew/1920, ((443-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 242*ResXnew/1920, ((484-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , MapRedeem.ahk, Second mission is not complete, 1.5
        Goto, Troops
    }
    Troops:
    MsgBox, , Проверка отрядов, Checking for idle troops., 1.5
    ControlFocus,, Firestone
    ; Check if there are idle troops
    PixelSearch, X, Y, 1140*ResXnew/1920, ((996-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1187*ResXnew/1920, ((1012-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x542710, 10, Fast RGB
        If (ErrorLevel = 0){
            MsgBox, , Проверка отрядов, есть СВОБОДНЫЕ отряды и ДОСТУПНЫ миссии, 1
            ;MsgBox, ,err,SendHeartbeat("Map: Free troops found", false, true)
;============ переключее на поиск миссий =============
            if (SearchMissoin = 1){
				MapStart()
				} else {
					MsgBox, , SearchMissoin = 0, поиск новых миссий ОТКЛЮЧЕН, 1
					}
        } Else {
            MsgBox, , Проверка отрядов, No troops found - leaving maps, 1.5
        }
        ; Reset the memory if we found the reset map mission button
    ControlFocus,, Firestone
    Sleep, 500
    PixelSearch, X, Y, 104*ResXnew/1920, ((878-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 300*ResXnew/1920, ((977-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xED00EF, 3, Fast RGB
    If (ErrorLevel = 0){
        stateFile := "MapStartState.ini"
        ClickedPoints := ""
        SessionStart := A_Now
        IniWrite, %SessionStart%, %stateFile%, Memory, SessionStart
        IniWrite, %ClickedPoints%, %stateFile%, Memory, ClickedPoints
        global MapReset
        IniRead, MapReset, settings.ini, MissionPriority, MapReset, 0
        if (MapReset = 1){
            MouseMove, 200*ResXnew/1920, ((930-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            MsgBox, , Перезагрузка миссий, Reset map mission - пизда твоим самоцветам, 1.5
            ControlFocus,, Firestone
            Sleep, 500
            Click
            Sleep, 1500
            MouseMove, 961*ResXnew/1920, ((675-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            Click
            Sleep, 500
            Goto, Troops
        }
    }
    ClaimCampaign()
}
