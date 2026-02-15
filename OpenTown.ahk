; OpenTown.ahk

; simple script to save on coding
OpenTown(){
    WinActivate, ahk_exe Firestone
    MsgBox, , Город, Открываем окно города - проверься АНГЛИЙСКУЮ раскладку, 1.5
    Send, T
    Sleep, 1500
}