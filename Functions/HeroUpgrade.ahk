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
            ; временно: ищем любой пиксель (заглушка)
            PixelSearch, X, Y, 1450*VarX, (950-22)*VarY + BorTop, 1750*VarX, (1025-22)*VarY + BorTop, 0x000000, 3, Fast RGB
            if (ErrorLevel = 0)
            {
                MouseClick, Left, 1649*VarX, (970-22)*VarY + BorTop, 1, 0
                Sleep, 300
                break
            }
            MouseClick, Left, 1649*VarX, (970-22)*VarY + BorTop, 1, 0
            Sleep, 300
            Count++
            if (Count >= MaxTries)
            {
                MsgBox, , Hero Upgrades, Failed after %Count% tries., 2
                break
            }
        }

        ; --- Special Upgrade ---
        If (UpgradeSpecial = 1)
            ClickHeroIfPixelFound(1874*VarX, (207-22)*VarY + BorTop, 1889*VarX, (249-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (205-22)*VarY + BorTop)

        ; --- Heroes upgrades (from 5th to 1st) ---
        If (UpgradeH5 = 1)
            ClickHeroIfPixelFound(1868*VarX, (880-22)*VarY + BorTop, 1885*VarX, (912-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (873-22)*VarY + BorTop)  ; 5th hero
        If (UpgradeH4 = 1)
            ClickHeroIfPixelFound(1864*VarX, (770-22)*VarY + BorTop, 1889*VarX, (802-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (772-22)*VarY + BorTop)  ; 4th hero
        If (UpgradeH3 = 1)
            ClickHeroIfPixelFound(1866*VarX, (654-22)*VarY + BorTop, 1889*VarX, (693-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (650-22)*VarY + BorTop)  ; 3rd hero
        If (UpgradeH2 = 1)
            ClickHeroIfPixelFound(1866*VarX, (545-22)*VarY + BorTop, 1885*VarX, (584-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (539-22)*VarY + BorTop)  ; 2nd hero
        If (UpgradeH1 = 1)
            ClickHeroIfPixelFound(1862*VarX, (434-22)*VarY + BorTop, 1888*VarX, (469-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (427-22)*VarY + BorTop)  ; 1st hero

        ; --- Guardian Upgrade ---
        If (UpgradeGuardian = 1)
            ClickHeroIfPixelFound(1869*VarX, (319-22)*VarY + BorTop, 1890*VarX, (352-22)*VarY + BorTop, 0x15BC16, 1770*VarX, (317-22)*VarY + BorTop)

    } else {
        ; --- Standard Single Check Mode ---

        ; check special upgrade
        If (UpgradeSpecial = 1) {
            PixelSearch, X, Y, 1874*VarX, (207-22)*VarY + BorTop, 1889*VarX, (249-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (205-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 5th hero
        If (UpgradeH5 = 1) {
            PixelSearch, X, Y, 1868*VarX, (880-22)*VarY + BorTop, 1885*VarX, (912-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (873-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 4th hero
        If (UpgradeH4 = 1) {
            PixelSearch, X, Y, 1864*VarX, (770-22)*VarY + BorTop, 1889*VarX, (802-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (772-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 3rd hero
        If (UpgradeH3 = 1) {
            PixelSearch, X, Y, 1866*VarX, (654-22)*VarY + BorTop, 1889*VarX, (693-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (650-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 2nd hero
        If (UpgradeH2 = 1) {
            PixelSearch, X, Y, 1866*VarX, (545-22)*VarY + BorTop, 1885*VarX, (584-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (539-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check 1st hero
        If (UpgradeH1 = 1) {
            PixelSearch, X, Y, 1862*VarX, (434-22)*VarY + BorTop, 1888*VarX, (469-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (427-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }

        ; check guardian
        If (UpgradeGuardian = 1) {
            PixelSearch, X, Y, 1869*VarX, (319-22)*VarY + BorTop, 1890*VarX, (352-22)*VarY + BorTop, 0x08A00A, 3, Fast RGB
            If (ErrorLevel = 0 ){
                MouseMove, 1770*VarX, (317-22)*VarY + BorTop, 0
                Sleep, 1000
                Click
                Sleep, 1000
            }
        }
    }
    BigClose()
}