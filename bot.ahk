; Deaeth85 Firestone Bot.ahk edited by "Я твой друг"
#SingleInstance Force
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")   ; ⚡ КРИТИЧЕСКИ ВАЖНО

#Include Gui.ahk
#Include Functions\Alchemist.ahk
#Include Functions\Arena.ahk
#Include Functions\CheckMail.ahk
#Include Functions\ClaimBeer.ahk
#include Functions\Scarab.ahk
#Include Functions\ClaimEngineer.ahk
#Include Functions\ClaimEvents.ahk
#Include Functions\ClaimRituals.ahk
#Include Functions\ExoticMerchant.ahk
#Include Functions\Guardian.ahk
#Include Functions\Guild.ahk
#Include Functions\HeroUpgrade.ahk
#Include Functions\MapRedeem.ahk
#Include Functions\OpenChests.ahk
#Include Functions\Quests.ahk
#Include Functions\Research.ahk
#Include Functions\Shop.ahk
#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\GetColor.ahk
#Include Functions\subFunctions\GoMap.ahk
#Include Functions\subFunctions\MainMenu.ahk
#Include Functions\subFunctions\MapClose.ahk
#Include Functions\subFunctions\OpenTown.ahk

SetWorkingDir %A_ScriptDir%
#NoEnv
SetBatchLines, -1

; Загрузка библиотеки ImageSearchDLL
hModule := DllCall("LoadLibrary", "str", "ImageSearchDLL.dll", "ptr")
if (!hModule) {
    MsgBox, 48, Ошибка, Не удалось загрузить ImageSearchDLL.dll!`nУбедитесь, что файл находится в папке со скриптом.
    ExitApp
}

; Объявление функций из DLL
DllCall("GetProcAddress", "ptr", hModule, "AStr", "ImageSearch", "ptr")
DllCall("GetProcAddress", "ptr", hModule, "AStr", "ImageSearchWindow", "ptr")

; Функция поиска изображения с поддержкой масштабирования
ImageSearchDLL(ByRef outX, ByRef outY, x1, y1, x2, y2, imageFile, minScale := 0.5, maxScale := 2, scaleStep := 0.1) {
    ; Подготовка параметров
    scaleStep := Abs(scaleStep)
    
    ; Перебор масштабов от минимального к максимальному
    scale := minScale
    while (scale <= maxScale + 0.001) {
        ; Формируем команду с параметрами масштаба
        cmd := "ImageSearch(""" imageFile """, " x1 ", " y1 ", " x2 ", " y2 ", " scale ", " scale ")"
        
        ; Вызов функции из DLL
        result := DllCall("ImageSearchDLL\ImageSearch", "AStr", cmd, "AStr")
        
        if (result != "0") {
            ; Парсим результат: "X|Y" или "X|Y|scale"
            StringSplit, coords, result, |
            outX := coords1
            outY := coords2
            return true
        }
        
        scale += scaleStep
    }
    
    return false
}


global lastExecutionTimeArena := 0
global MapPoints :=

; start of main script
MainScript(){
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen 

; ====== АКТИВАЦИЯ И ФОКУС ======
ControlFocus,, Firestone        ; фокус ввода (для клавиатуры)
WinActivate, Firestone          ; активация окна (поднять наверх)
WinWaitActive, Firestone, , 1   ; ждём активации (1 сек)

if ErrorLevel {
    ; Не ругаемся, а тихо пробуем ещё раз
    WinActivate, Firestone
    Sleep, 100
    if !WinActive("Firestone") {
        MsgBox, 48, Ошибка, Не удалось активировать окно Firestone.
        ExitApp
    }
}

Sleep, 100  ; небольшая пауза для гарантии

; ====== ТЕСТОВЫЕ КЛИКИ ПО УГЛАМ ======
MsgBox, 64, Проверка настроек, Если рамки указаны верно - бот прокликает по углам игры и откроет-закроет меню.`nНажми ESC чтобы остановить бота., 1

; Левый верхний угол
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen 
MouseMove, 5*VarX, 5*VarY + BorTop
Click
Sleep, 500
	
; Левый нижний угол
MouseMove, 5*VarX, 1005*VarY + BorTop
Click
Sleep, 500

; Правый нижний угол
MouseMove, 1910*VarX, 1005*VarY + BorTop
Click
Sleep, 500

; Правый верхний угол (двойной клик)
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen 
MouseMove, 1910*VarX, 5*VarY + BorTop
Sleep, 1000
Click
Sleep, 500
Click
Sleep, 500

loop:
;	CoordMode, Mouse, Screen
;	CoordMode, Pixel, Screen 
    ControlFocus,, Firestone
    ; do main screen sections
    MsgBox, , Проверка главного меню, Проверяем: мы находимся на главном экране в начале цикла, 2
    MainMenu()
    ControlFocus,, Firestone
    GuiControlGet, Checked, , Events,
        If (Checked = 1){
            ClaimEvents()
        }
    ; check if Claim Quests is checked
    GuiControlGet, Checked, , Quests,
    If (Checked = 1){
        ClaimQuests()
    }
    MsgBox, , Проверка главного меню, Проверяем: находимся ли мы на главном экране после получения заданий, 2
    MainMenu()
    ControlFocus,, Firestone
    ;~ ; check if Claim Free Gift and Check-in is checked
    GuiControlGet, Checked, , Shop,
    If (Checked = 1){
        Shop()
    }
    ; check if Check Mail is checked
    GuiControlGet, Checked, , Mail
        If (Checked = 1){
            CheckMail()
        }
    ; check if Open Chests is checked
    GuiControlGet, Checked, , Chests,
        If (Checked = 1){
            OpenChests()
        } Else {
        ;check if Upgrade Blessings is checked
        GuiControlGet, Checked, , Bless,
            If (Checked = 1){
                OpenBlessChests()
            }
        }
    ; start town section
    OpenTown()
    ; check for guardian upgrade
    Guardian()
    ; tavern
    ClaimBeer()
    Scarab()
    ; claim rituals
    GuiControlGet, Checked, , SkipOracle,
        If (Checked = 1){
            Goto, Engineer
        }
    ClaimRituals()
    Engineer:
    ; check if skip engineer is checked
    GuiControlGet, Checked, , NoEng,
        If (Checked = 1){
            Goto, ExoticSection
        }
    ClaimEngineer()
    ExoticSection:
    ; check if sell exotic is checked (sell all check is internal to sell exotic script)
    GuiControlGet, Checked, , SellEx,
        If (Checked = 1){
            ExoticMerchant()
    }
    ; check if do arena is checked
    GuiControlGet, Checked, , PVP,
        If (Checked = 1){
            ; get current time
            currentTimeArena := A_TickCount
            ;check if it's been 24 hours since last execution
            If (lastExecutionTimeArena <= 0 || currentTimeArena - lastExecutionTimeArena >= 6 * 60 * 60 * 1000){
                Arena()
                lastExecutionTimeArena := currentTimeArena
            }
        }
    ; check if we are skipping alchemy
    GuiControlGet, Checked, , Alch,
        If (Checked = 1){
            Goto, ResearchStart
        } Else {
            Alchemist()
        }
    ; check if we are skipping research
    ResearchStart:
    GuiControlGet, Checked, , Research,
        If (Checked = 1){
            Goto, FinishTown
        } Else {
            GoResearch()
        }
    FinishTown:
    BigClose()
    GuiControlGet, Checked, , NoGuild,
    If (Checked = 1){
        Goto, MapStartUp
    }
    Guild()
    MapStartUp:
    GoMap()
    MapRedeem()
    UpgradeHero:
    GuiControlGet, Checked, , NoHero,
    If (Checked = 1){
        Goto, EndingMouseMove
    }
    HeroUpgrade()
    EndingMouseMove:
    GuiControlGet, SelectedItem, ,Delay,
    If (SelectedItem="0"){
        Goto, Loop
    }
    GuiControlGet, SelectedItem, ,Delay,
    If (SelectedItem="30"){
        MouseMove, 947*ResXnew/1920, ((755-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 30000
        Goto, Loop
    }
    GuiControlGet, SelectedItem, ,Delay,
    If (SelectedItem="60"){
        MouseMove, 947*ResXnew/1920, ((755-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 60000
        Goto, Loop
    }
    GuiControlGet, SelectedItem, ,Delay,
    If (SelectedItem="90"){
        MouseMove, 947*ResXnew/1920, ((755-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 90000
        Goto, Loop
    }
    GuiControlGet, SelectedItem, ,Delay,
    If (SelectedItem="120"){
        MouseMove, 947*ResXnew/1920, ((755-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 120000
        Goto, Loop
}
}

GuiEscape:
GuiClose:
    $Esc::
    ExitApp