; GoMap.ahk

#include Functions\subFunctions\MainMenu.ahk

GoMap()
{ControlFocus,, Firestone
    MsgBox, , GoMap.ahk, открываем окно карты, 1.5
    Send, M
    Sleep, 1500
}
