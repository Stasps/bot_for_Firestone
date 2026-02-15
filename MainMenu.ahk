; MainMenu.ahk

#include Functions\subFunctions\BigClose.ahk

;check to see if we are on the mainmenu in case script ends up badly on another menu, also skips the rate pop-up, it is done via avatar color(that is taken automatically on script start)
MainMenu(){
    ControlFocus,, Firestone
    ; get to and find settings window, one big close to ensure we're on main page
    Send, !{Tab}
    Sleep, 1000
    WinActivate, Firestone
	CoordMode, Mouse, Screen
    SettingsFinder:
        PixelSearch, X, Y, 1542*ResXnew/1920, ((655-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1654*ResXnew/1920, ((687-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x285483, 3, Fast RGB
        If (ErrorLevel = 0){
            BigClose()
            Return
        }
        PixelSearch, X, Y, 1057*ResXnew/1920, ((288-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1321*ResXnew/1920, ((335-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x8E4423, 2, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 1397*ResXnew/1920, ((307-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            Sleep, 1000
            Click
            Sleep, 1500
        }
        BigClose()
        Goto, SettingsFinder
    }