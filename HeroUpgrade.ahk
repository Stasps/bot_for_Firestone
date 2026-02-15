; HeroUpgrade.ahk

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\MainMenu.ahk

; Loop for upgrade until we dont have upgrade available
ClickHeroIfPixelFound(x1, y1, x2, y2, color, clickX, clickY, clickCount := 20)
{
    MouseMove, %x1%, %y1%
    Sleep, 300
    loop
    {
        PixelSearch, X, Y, x1, y1, x2, y2, color, 3, Fast RGB
        if (ErrorLevel = 0){
            ; Pixel found -> click
            MouseClick, Left, clickX, clickY, 1, 0
            Sleep, 300  ; wait between clicks
        } else {
            break
        }
    }
}

; function that upgrades heros
HeroUpgrade(){
    ControlFocus,, Firestone

    ; Fetch GUI settings locally
    GuiControlGet, NoHeroVal, , NoHero
    if (NoHeroVal = 1)
        Return

    ; Load specific upgrade preferences
    GuiControlGet, UpgradeSpecial, , UpgradeSpecial
    GuiControlGet, UpgradeGuardian, , UpgradeGuardian
    GuiControlGet, UpgradeH1, , UpgradeH1
    GuiControlGet, UpgradeH2, , UpgradeH2
    GuiControlGet, UpgradeH3, , UpgradeH3
    GuiControlGet, UpgradeH4, , UpgradeH4
    GuiControlGet, UpgradeH5, , UpgradeH5
    GuiControlGet, NextMilestoneVal, , NextMilestone

    ; open upgrade menu
    MsgBox, , Hero Upgrades, Opening Hero Upgrade Menu, 2
    Send, U
    Sleep, 1500

    ; Check if Next Milestone Daily Quests is checked
    If (NextMilestoneVal = 1)
    {
        ; Set to Next Milestone
        MaxTries := 10
        Count := 0
        Loop
        {
;            PixelSearch, X, Y, 1500*ResXnew/1920, ((975-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1504*ResXnew/1920, ((985-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x542710, 3, Fast RGB
;            if (ErrorLevel = 0)
;            {
;                ; Found the toggle button color indicating we are NOT on max/milestone yet?
;                ; Or clicking to toggle. Based on your code, this clicks until satisfied.
;                MouseClick, Left, 1649*ResXnew/1920, ((970-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1, 0
;                Sleep, 300
;                break
;            }
;            ; Try clicking to switch mode
;            MouseClick, Left, 1649*ResXnew/1920, ((970-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1, 0
;            Sleep, 300
;            Count++
;            if (Count >= MaxTries)
;            {
;                MsgBox, , Hero Upgrades, Failed to find pixel after %Count% tries., 2
;                break
;            }

		
found := ImageSearchDLL(X, Y, 1450*ResXnew/1920, ((950-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1750*ResXnew/1920, ((1025-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), UpgradeMax.png, 0.6, 1.5, 0.02) ; диапазон масштаба и шаг

if (found)
{
    ; Картинка найдена — значит, кнопка видна (например, режим не max)
    ; Кликаем по той же точке, что и раньше
    MouseClick, Left, 1649*ResXnew/1920, ((970-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1, 0
    Sleep, 300
    break
}

; Если не нашли — пробуем кликнуть и повторить
MouseClick, Left, 1649*ResXnew/1920, ((970-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1, 0
Sleep, 300
Count++
if (Count >= MaxTries)
{
    MsgBox, , Hero Upgrades, Failed to find image after %Count% tries., 2
    break
}
}

        ; --- Special Upgrade ---
        If (UpgradeSpecial = 1)
            ClickHeroIfPixelFound(1874*ResXnew/1920, ((207-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1889*ResXnew/1920, ((249-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((205-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))

        ; --- Heroes upgrades (from 5th to 1st) ---
        If (UpgradeH5 = 1)
            ClickHeroIfPixelFound(1868*ResXnew/1920, ((880-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1885*ResXnew/1920, ((912-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((873-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))  ; 5th hero
        If (UpgradeH4 = 1)
            ClickHeroIfPixelFound(1864*ResXnew/1920, ((770-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1889*ResXnew/1920, ((802-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((772-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))  ; 4th hero
        If (UpgradeH3 = 1)
            ClickHeroIfPixelFound(1866*ResXnew/1920, ((654-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1889*ResXnew/1920, ((693-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((650-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))  ; 3rd hero
        If (UpgradeH2 = 1)
            ClickHeroIfPixelFound(1866*ResXnew/1920, ((545-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1885*ResXnew/1920, ((584-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((539-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))  ; 2nd hero
        If (UpgradeH1 = 1)
            ClickHeroIfPixelFound(1862*ResXnew/1920, ((434-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1888*ResXnew/1920, ((469-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((427-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))  ; 1st hero

        ; --- Guardian Upgrade ---
        If (UpgradeGuardian = 1)
            ClickHeroIfPixelFound(1869*ResXnew/1920, ((319-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1890*ResXnew/1920, ((352-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x16BC15, 1770*ResXnew/1920, ((317-22)*(ResYnew-BorTop-BorBot)/1010+BorTop))

    } else {
        ; --- Standard Single Check Mode ---

        ; check special upgrade
        If (UpgradeSpecial = 1) {
            PixelSearch, X, Y, 1874*ResXnew/1920, ((207-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1889*ResXnew/1920, ((249-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((205-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 5th hero
        If (UpgradeH5 = 1) {
            PixelSearch, X, Y, 1868*ResXnew/1920, ((880-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1885*ResXnew/1920, ((912-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((873-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 4th hero
        If (UpgradeH4 = 1) {
            PixelSearch, X, Y, 1864*ResXnew/1920, ((770-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1889*ResXnew/1920, ((802-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((772-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 3rd hero
        If (UpgradeH3 = 1) {
            PixelSearch, X, Y, 1866*ResXnew/1920, ((654-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1889*ResXnew/1920, ((693-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((650-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 2nd hero
        If (UpgradeH2 = 1) {
            PixelSearch, X, Y, 1866*ResXnew/1920, ((545-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1885*ResXnew/1920, ((584-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((539-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 1st hero
        If (UpgradeH1 = 1) {
            PixelSearch, X, Y, 1862*ResXnew/1920, ((434-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1888*ResXnew/1920, ((469-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((427-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check guardian
        If (UpgradeGuardian = 1) {
            PixelSearch, X, Y, 1869*ResXnew/1920, ((319-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1890*ResXnew/1920, ((352-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*ResXnew/1920, ((317-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }
    }
    BigClose()
}