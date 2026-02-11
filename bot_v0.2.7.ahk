; Deaeth85 Firestone Bot.ahk edited by "Я твой друг"

#SingleInstance Force
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
;#Include Functions\SendHeartbeat.ahk
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

global lastExecutionTimeArena := 0
global MapPoints :=

; start of main script
MainScript(){

; ====== MAINTANCE ======
;MsgBox, ,check error, ResXnew = %ResXnew% `n ResYnew = %ResYnew% `n BorTop = %BorTop% `n BorBot = %BorBot% `n VarX = %VarX% `n VarY = %VarY%
; ============= TEST here
	
	ControlFocus,, Firestone

	MsgBox, ,Проверка кастроек, если рамки указаны верно - то бот прокликает по углам игры и откроет-закроет меню. нажми ESC чтобы остановить бота, 1.5

	MouseMove, 5*VarX, 15*VarY + BorTop, 5
        Click
        Sleep, 500
	
	MouseMove, 5*VarX, 1005*VarY + BorTop, 5
        Click
        Sleep, 500

	MouseMove, 1910*VarX, 1005*VarY + BorTop, 5
        Click
        Sleep, 500

	MouseMove, 1910*VarX, 15*VarY + BorTop, 5
		Sleep, 1000
        Click
        Sleep, 500
        Click
        Sleep, 500

; =============== TEST end

loop:
    ControlFocus,, Firestone
    ; do main screen sections
    ;MsgBox, ,err,SendHeartbeat("Starting Bot", false, true)
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
        ;MsgBox, ,err,SendHeartbeat("ClaimQuests", false)
        ClaimQuests()
    }
    MsgBox, , Проверка главного меню, Проверяем: находимся ли мы на главном экране после получения заданий, 2
    MainMenu()
    ControlFocus,, Firestone
    ;~ ; check if Claim Free Gift and Check-in is checked
    GuiControlGet, Checked, , Shop,
    If (Checked = 1){
        ;MsgBox, ,err,SendHeartbeat("Shop", false)
        Shop()
    }
    ; check if Check Mail is checked
    GuiControlGet, Checked, , Mail
        If (Checked = 1){
            ;MsgBox, ,err,SendHeartbeat("CheckMail", false)
            CheckMail()
        }
    ; check if Open Chests is checked
    GuiControlGet, Checked, , Chests,
        If (Checked = 1){
            ;MsgBox, ,err,SendHeartbeat("OpenChests", false)
            OpenChests()
        } Else {
        ;check if Upgrade Blessings is checked
        GuiControlGet, Checked, , Bless,
            If (Checked = 1){
                ;MsgBox, ,err,SendHeartbeat("OpenBlessChests", false)
                OpenBlessChests()
            }
        }
    ; start town section
    OpenTown()
    ; check for guardian upgrade
    ;MsgBox, ,err,SendHeartbeat("Guardian", false)
    Guardian()
    ; tavern
    ;MsgBox, ,err,SendHeartbeat("ClaimBeer", false)
    ClaimBeer()
    ;MsgBox, ,err,SendHeartbeat("Scarab", false)
    Scarab()
    ; claim rituals
    GuiControlGet, Checked, , SkipOracle,
        If (Checked = 1){
            Goto, Engineer
        }
    ;MsgBox, ,err,SendHeartbeat("ClaimRituals", false)
    ClaimRituals()
    Engineer:
    ; check if skip engineer is checked
    GuiControlGet, Checked, , NoEng,
        If (Checked = 1){
            Goto, ExoticSection
        }
    ;MsgBox, ,err,SendHeartbeat("ClaimEngineer", false)
    ClaimEngineer()
    ExoticSection:
    ; check if sell exotic is checked (sell all check is internal to sell exotic script)
    GuiControlGet, Checked, , SellEx,
        If (Checked = 1){
            ;MsgBox, ,err,SendHeartbeat("ExoticMerchant", false)
            ExoticMerchant()
    }
    ; check if do arena is checked
    GuiControlGet, Checked, , PVP,
        If (Checked = 1){
            ; get current time
            currentTimeArena := A_TickCount
            ;check if it's been 24 hours since last execution
            If (lastExecutionTimeArena <= 0 || currentTimeArena - lastExecutionTimeArena >= 6 * 60 * 60 * 1000){
                ;MsgBox, ,err,SendHeartbeat("Arena", false)
                Arena()
                lastExecutionTimeArena := currentTimeArena
            }
        }
    ; check if we are skipping alchemy
    GuiControlGet, Checked, , Alch,
        If (Checked = 1){
            Goto, ResearchStart
        } Else {
            ;MsgBox, ,err,SendHeartbeat("Alchemist", false)
            Alchemist()
        }
    ; check if we are skipping research
    ResearchStart:
    GuiControlGet, Checked, , Research,
        If (Checked = 1){
            Goto, FinishTown
        } Else {
            ;MsgBox, ,err,SendHeartbeat("GoResearch", false)
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
    ;MsgBox, ,err,SendHeartbeat("MapRedeem", false)
    MapRedeem()
    UpgradeHero:
    GuiControlGet, Checked, , NoHero,
    If (Checked = 1){
        Goto, EndingMouseMove
    }
    ;MsgBox, ,err,SendHeartbeat("HeroUpgrade", false)
    HeroUpgrade()
    EndingMouseMove:
    ;MsgBox, ,err,SendHeartbeat("Delay ending bot", false)
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