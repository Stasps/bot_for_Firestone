; ClaimRituals.ahk

#Include Functions\UpgradeBlessings.ahk
#Include Functions\subFunctions\OpenTown.ahk
#Include Functions\subFunctions\OracleDaily.ahk

;function that checks Oracle
ClaimRituals(){
    ControlFocus,, Firestone
    ; open Oracle in town
    MouseMove, 1023*ResXnew/1920, ((994-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    sleep, 1000
    click
    sleep, 1500
    ; open Rituals tab in Oracle if ready
    PixelSearch, X, Y, 871*ResXnew/1920, ((341-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 903*ResXnew/1920, ((382-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF40000, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 830*ResXnew/1920, ((420-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        sleep, 1000
        click
        sleep, 1500
        ; cycle through rituals
        PixelSearch, X, Y, 1259*ResXnew/1920, ((463-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1331*ResXnew/1920, ((536-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1180*ResXnew/1920, ((500-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            sleep, 1000
            click
            sleep, 1000
        }
        PixelSearch, X, Y, 1609*ResXnew/1920, ((458-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1677*ResXnew/1920, ((514-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1586*ResXnew/1920, ((514-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            sleep, 1000
            click
            sleep, 1000
        }
        PixelSearch, X, Y, 1272*ResXnew/1920, ((811-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1326*ResXnew/1920, ((872-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1170*ResXnew/1920, ((837-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            sleep, 1000
            click
            sleep, 1000
        }
        PixelSearch, X, Y, 1619*ResXnew/1920, ((805-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1690*ResXnew/1920, ((870-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1579*ResXnew/1920, ((840-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            sleep, 1000
            click
            sleep, 1000
        }
    }
    ; check if upgradeBlessings box was checked
    GuiControlGet, Checked, , Bless,
        if (Checked = 1){
            UpgradeBlessings()
        }
    ; check if Claim Daily Oracle was checked on startup
    GuiControlGet, Checked, , DailyOracle,
        If (Checked = 1){
            OracleDaily()
        }  
    BigClose()
}