#NoEnv
#SingleInstance, Force
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; ==============================================================================
; CONFIGURATION & GLOBAL VARIABLES
; ==============================================================================
Global SettingsMap := {}

; --- Common Options ---
SettingsMap["Token"] := ["CommonOptions", 0]
SettingsMap["SellEx"] := ["CommonOptions", 1]
SettingsMap["SellScrolls"] := ["CommonOptions", 0]
SettingsMap["SellNoGold"] := ["CommonOptions", 0]
SettingsMap["SellAll"] := ["CommonOptions", 1]
SettingsMap["SellNone"] := ["CommonOptions", 0]
SettingsMap["ExoticUpgrades"] := ["CommonOptions", 1]
SettingsMap["BuyEx"] := ["CommonOptions", 1]
SettingsMap["Chests"] := ["CommonOptions", 0]
SettingsMap["GearChestExclude"] := ["CommonOptions", "Mythic"]
SettingsMap["JewelChestExclude"] := ["CommonOptions", "Emerald"]
SettingsMap["Bless"] := ["CommonOptions", 1]
SettingsMap["Delay"] := ["CommonOptions", 0]
SettingsMap["Quests"] := ["CommonOptions", 0]
SettingsMap["Events"] := ["CommonOptions", 0]
SettingsMap["Mail"] := ["CommonOptions", 1]
SettingsMap["Awaken"] := ["CommonOptions", 0]
SettingsMap["Crystal"] := ["CommonOptions", 1]
SettingsMap["Chaos"] := ["CommonOptions", 1]
SettingsMap["PTree"] := ["CommonOptions", 0]
SettingsMap["GuardianTrain"] := ["CommonOptions", "Vermilion"]
SettingsMap["UpgradeSpecial"] := ["HeroOptions", 1]
SettingsMap["UpgradeGuardian"] := ["HeroOptions", 1]
SettingsMap["UpgradeH1"] := ["HeroOptions", 1]
SettingsMap["UpgradeH2"] := ["HeroOptions", 1]
SettingsMap["UpgradeH3"] := ["HeroOptions", 1]
SettingsMap["UpgradeH4"] := ["HeroOptions", 1]
SettingsMap["UpgradeH5"] := ["HeroOptions", 1]
; --- Mission Priority ---
SettingsMap["Priority1"] := ["MissionPriority", "2 Squad"]
SettingsMap["Priority2"] := ["MissionPriority", "War"]
SettingsMap["Priority3"] := ["MissionPriority", "Medium"]
SettingsMap["Priority4"] := ["MissionPriority", "Short"]
SettingsMap["Priority5"] := ["MissionPriority", "Leftover"]
SettingsMap["MapReset"] := ["MissionPriority", 0]
; --- QoL/Rare Options ---
SettingsMap["Beer"] := ["QoL/RareOptions", 0]
SettingsMap["Scarab"] := ["QoL/RareOptions", 0]
SettingsMap["NoGuild"] := ["QoL/RareOptions", 0]
SettingsMap["NoEng"] := ["QoL/RareOptions", 0]
SettingsMap["Pickaxes"] := ["QoL/RareOptions", 0]
SettingsMap["GNotif"] := ["QoL/RareOptions", 0]
SettingsMap["Alch"] := ["QoL/RareOptions", 0]
SettingsMap["Research"] := ["QoL/RareOptions", 0]
SettingsMap["SkipOracle"] := ["QoL/RareOptions", 0]
SettingsMap["NoHero"] := ["QoL/RareOptions", 1]
SettingsMap["NextMilestone"] := ["QoL/RareOptions", 0]
SettingsMap["DisableWarning"] := ["QoL/RareOptions", 1]

; --- Other Options ---
SettingsMap["Shop"] := ["OtherOptions", 0]
SettingsMap["DailyOracle"] := ["OtherOptions", 1]
SettingsMap["PVP"] := ["OtherOptions", 1]
SettingsMap["Liberation"] := ["OtherOptions", 1]
SettingsMap["UpgradeWM"] := ["OtherOptions", "Don't Upgrade WM's"]
SettingsMap["WMOptions"] := ["OtherOptions", "Level and Blueprints"]
SettingsMap["Blueprints"] := ["OtherOptions", "Damage and Health"]
SettingsMap["Talents450"] := ["OtherOptions", "Don't Upgrade Talents (0-450 Talent Points)"]
SettingsMap["Talents800"] := ["OtherOptions", "Don't Upgrade Talents (500+ Talent Points)"]

; --- SettingsNoGui (Maintained for code compatibility) ---
SettingsMap["DungeonQuest"] := ["SettingsNoGui", 0]

; --- Настройки разрешения ---
global ResXnew
global ResYnew
global BorTop
global BorBot
global VarX
global SearchMissoin
; := ResXnew/1920
;	SetFormat, float, 0.2
global VarY
; := ( ResYnew - BorTop - BorBot ) / 1010
;	SetFormat, float, 0.2
SettingsMap["ResXnew"] := ["resolution"]
SettingsMap["ResYnew"] := ["resolution"]
SettingsMap["BorTop"] := ["resolution"]
SettingsMap["BorBot"] := ["resolution"]
SettingsMap["VarX"] := ["variable",0]
SettingsMap["VarY"] := ["variable",0]
RusVer := "0.3.0"
SettingsMap["SearchMissoin"] := ["UNSTABLE", 0]
Ratio := ResXnew / (ResYnew - BorBot - BorTop)
RatioStand := 1980/(1080 - 23 - 48)
SettingsMap["Ratio"] := ["UNSTABLE"]

; --- Personal Tree ---
SettingsMap["AttDmg"] := ["PersonalTree", 0]
SettingsMap["AttHp"] := ["PersonalTree", 0]
SettingsMap["AttArm"] := ["PersonalTree", 0]
SettingsMap["Energy"] := ["PersonalTree", 0]
SettingsMap["Mana"] := ["PersonalTree", 0]
SettingsMap["Rage"] := ["PersonalTree", 0]
SettingsMap["Miner"] := ["PersonalTree", 0]
SettingsMap["Battle"] := ["PersonalTree", 0]
SettingsMap["MainAtt"] := ["PersonalTree", 0]
SettingsMap["Prest"] := ["PersonalTree", 0]
SettingsMap["Fire"] := ["PersonalTree", 0]
SettingsMap["Gold"] := ["PersonalTree", 0]
SettingsMap["Level"] := ["PersonalTree", 0]
SettingsMap["Guard"] := ["PersonalTree", 0]
SettingsMap["Fist"] := ["PersonalTree", 0]
SettingsMap["Prec"] := ["PersonalTree", 0]
SettingsMap["Magic"] := ["PersonalTree", 0]
SettingsMap["Tank"] := ["PersonalTree", 0]
SettingsMap["Damage"] := ["PersonalTree", 0]
SettingsMap["Heal"] := ["PersonalTree", 0]

; Load settings immediately
LoadSettings()

; ==============================================================================
; GUI CONSTRUCTION
; ==============================================================================
Gui, +OwnDialogs
Gui, Font, s9, Segoe UI
Gui, Color, White

; Tabs Structure
Gui, Add, Tab3, x0 y0 w960 h620, Home|General Options|Guild && Personal Tree|War Machines|Настрой здесь|Версия
; ------------------------------------------------------------------------------
; TAB 1: HOME (INSTRUCTIONS & START)
; ------------------------------------------------------------------------------
Gui, Tab, 1
    Gui, Font, s14 Bold
    Gui, Add, Text, x20 y30 w920 Center, Я твой BOT version %RusVer%
    Gui, Font, s9 Norm
;    Gui, Add, Text, x20 yp+25 w920 Center, бот в разработке
	
    ; --- Instructions Group ---
    Gui, Add, GroupBox, x40 y60 w880 h450, Important Requirements & Instructions

    Gui, Font, Bold
    Gui, Add, Text, xp+20 yp+20 w840, SYSTEM & GAME SETTINGS:
    Gui, Font, Norm
    Gui, Add, Text, y+5 w840, - Важно: язык игры поставить на "English".
    Gui, Add, Text, y+5 w840, - Настройка интерфейса: Мобильная или ПК версия (новый стиль не работает).
    Gui, Add, Text, y+5 w840, - Важно: раскладка клавиатуры должна стоять на английском.
    Gui, Add, Text, y+5 w840, - Важно: во вклалке "НАСТРОЙ ЗДЕСЬ" указать параметры экрана и высоту рамок сверху и панели ПУСК.
    Gui, Add, Text, y+5 w840, - Важно: параметры экрана -> масштаб выставить 100`% (по умолчанию так и стоит).
	Gui, Add, Text, y+5 w840, - Желательно играть в оконном режиме (а панель ПУСК не должна быть скрыта).
	Gui, Add, Text, y+5 w840, - Работает нестабильно: полноэкранный режим.
    Gui, Add, Text, y+5 w840, - включите "подтверждение для использования самоцветов" (на всякий случай).

    Gui, Font, Bold
    Gui, Add, Text, y+10 w840, Настройка и использование бота:
    Gui, Font, Norm
	Gui, Add, Text, y+5 w840, - Клавиша ESC останавливает бота
	Gui, Add, Text, y+5 w840, - Подсказка: если это переведено, то это работает. Если нет, то лучше отключить
    Gui, Add, Text, y+5 w840, - ВАЖНО: не перемещайте карту миссий и не используйте зум. Если передвинули - перезайдите в игру.
	
    Gui, Font, Bold
    Gui, Add, Text, y+10 w840, Известные ОШИБКИ:
    Gui, Font, Norm
	Gui, Add, Text, y+5 w840, - Если соотношние сторон в игре отличается от идеала на 0.05 и выше, возможны проблемы с попаданием по кнопкам и нестабильная работа бота`n*Идеал ~= 1.96. Ваше соотношние сторон можно увидеть после сохранения параметров и перезахода, внизу на вкладке "Настрой здесь".
	Gui, Add, Text, y+5 w840, - При поиске заданий на х2 отряда может задевать клавишы покупки славы\отряда. `nрекомендуется поставить приоритет на эти задания (стоит по умолчанию) и проследить не кликнет ли их во время перебора миссий
	Gui, Add, Text, y+5 w840, - Алхимия неверно определяет клавишу "завершить бесплатно", потому функция бесплатного завершения отключена. `nможет не видеть кнопку Free `n"Улучшать до макс уровня" работает не стабильно

    ; --- Action Buttons ---
    Gui, Add, Button, x240 y520 w200 h60 gSaveSettings, СОХРАНИТЬ
    Gui, Add, Button, x520 y520 w200 h60 gButtonStart, запустить бота
	
; ------------------------------------------------------------------------------
; TAB 2: GENERAL OPTIONS
; ------------------------------------------------------------------------------
Gui, Tab, 2
    Gui, Font, Bold
    Gui, Add, Text, x20 y40 w900 h30 Center, ОБЩИЕ НАСТРОЙКИ
    Gui, Font, Norm

    ; === COLUMN 1 ===
    ; --- Selling & Exotic ---
    Gui, Add, GroupBox, x20 y70 w300 h200, Selling & Exotic Merchant
    Gui, Add, Checkbox, xp+15 yp+20 vSellEx Checked%SellEx%, Open Exotic Merchant (Master)
    Gui, Add, Checkbox, y+5 vExoticUpgrades Checked%ExoticUpgrades%, Buy Exotic Upgrades
    Gui, Add, Checkbox, y+5 vBuyEx Checked%BuyEx%, Buy Exotic Chests

    Gui, Add, Text, y+10, Selling Strategy:
    Gui, Add, Radio, y+5 vSellScrolls Checked%SellScrolls%, 1. Sell ONLY Exotic Scrolls
    Gui, Add, Radio, y+5 vSellNoGold Checked%SellNoGold%, 2. Sell All But Gold Items
    Gui, Add, Radio, y+5 vSellAll Checked%SellAll%, 3. Sell All Exotic Items
    Gui, Add, Radio, y+5 vSellNone Checked%SellNone%, 4. Sell Nothing

    ; --- Other Automation ---
    Gui, Add, GroupBox, x20 yp+40 w300 h150, Other Automation
    Gui, Add, Checkbox, xp+15 yp+20 vNoEng Checked%NoEng%, Пропустить инженера
    Gui, Add, Checkbox, y+8 vResearch Checked%Research%, Пропустить исследования
    Gui, Add, Checkbox, y+8 vDisableWarning Checked%DisableWarning%, Disable Steam Warning

    Gui, Add, Text, y+15, Тренировать стража:
    Gui, Add, DropDownList, w260 vGuardianTrain, Vermilion||Grace|Ankaa|Azhar
    if (GuardianTrain != "")
        GuiControl, ChooseString, GuardianTrain, %GuardianTrain%
		
    ; --- Oracle ---
    Gui, Add, GroupBox, x20 yp+35 w300 h95, Oracle
    Gui, Add, Checkbox, xp+15 yp+20 vBless Checked%Bless%, Upgrade Blessings
    Gui, Add, Checkbox, y+10 vDailyOracle Checked%DailyOracle%, забирать ежедневные награды оракула
    Gui, Add, Checkbox, y+10 vSkipOracle Checked%SkipOracle%, (общий) пропустить оракула
	
    ; --- Запуск миссий ---
    Gui, Add, GroupBox, x20 yp+35 w300 h50, Запуск миссий
    Gui, Add, Checkbox, xp+15 yp+20 vSearchMissoin Checked%SearchMissoin%, (НЕ СТАБИЛЬНО) искать и запускать миссии на карте


    ; === COLUMN 2 ===
    ; --- Chests & Rewards ---
    Gui, Add, GroupBox, x335 y70 w300 h150, Chests & Rewards
    Gui, Add, Checkbox, xp+15 yp+20 vChests Checked%Chests%, Open Chests (General)
    Gui, Add, Text, y+7, Exclude Gear Chests:
    Gui, Add, DropDownList, w260 vGearChestExclude, Exclude All|Don't Exclude Any|Epic and Higher|Legendary and Higher|Mythic||
    if (GearChestExclude != "")
        GuiControl, ChooseString, GearChestExclude, %GearChestExclude%

    Gui, Add, Text, y+7, Exclude Jewel Chests:
    Gui, Add, DropDownList, w260 vJewelChestExclude, Exclude All|Don't Exclude Any|Diamond and Higher||Opal and Higher|Emerald
    if (JewelChestExclude != "")
        GuiControl, ChooseString, JewelChestExclude, %JewelChestExclude%

    ; --- Alchemy ---
    Gui, Add, GroupBox, x335 yp+35 w300 h80, Алхимия
    Gui, Add, Checkbox, xp+15 yp+30 vAlch Checked%Alch%, пропустить алхимию
    Gui, Font, Italic
	Gui, Add, Text, y+5, запускает алхимих только за кровь дракона
    Gui, Font, Norm


; --- Hero Upgrades ---
    Gui, Add, GroupBox, x335 yp+30 w300 h240, Улучшение героев на этапах
    Gui, Add, Checkbox, xp+15 yp+20 vNoHero Checked%NoHero%, (общее) не улучшать героев 
    Gui, Add, Checkbox, y+10 vNextMilestone Checked%NextMilestone%, Улучшать до макс уровня (работает неправильно)
	Gui, Font, Italic
	Gui, Add, Text, y+5, если выключено, нажмает "улучишть" по разу `nза круг потому желательно выставить в игре:`n улучать до макс уровня
    Gui, Font, Norm
    Gui, Add, Text, y+15, Выберите героев, которых улучшать:
    Gui, Add, Checkbox, y+5 vUpgradeSpecial Checked%UpgradeSpecial%, Общие улучшения
    Gui, Add, Checkbox, x+10 vUpgradeGuardian Checked%UpgradeGuardian%, Стражи

    ;Heroes list
    Gui, Add, Checkbox, x350 y+10 vUpgradeH1 Checked%UpgradeH1%, Герой на позиции 1
    Gui, Add, Checkbox, x+10 vUpgradeH2 Checked%UpgradeH2%, Герой на позиции 2
    Gui, Add, Checkbox, x350 y+5 vUpgradeH3 Checked%UpgradeH3%, Герой на позиции 3
    Gui, Add, Checkbox, x+10 vUpgradeH4 Checked%UpgradeH4%, Герой на позиции 4
    Gui, Add, Checkbox, x350 y+5 vUpgradeH5 Checked%UpgradeH5%, Герой на позиции 5

    ; === COLUMN 3 ===
    ; --- Daily Routine ---
    Gui, Add, GroupBox, x650 y70 w290 h180, Ежедневные награды
    Gui, Add, Checkbox, xp+15 yp+20 vMail Checked%Mail%, Check Mail
    Gui, Add, Checkbox, y+7 vQuests Checked%Quests%, Claim Quests
    Gui, Add, Checkbox, y+7 vEvents Checked%Events%, Claim Basic Events
    Gui, Add, Checkbox, y+7 vChaos Checked%Chaos%, Participate in Chaos Rift
    Gui, Add, Checkbox, y+7 vShop Checked%Shop%, Подарки (магазин) и награды за вход

    Gui, Add, Text, y+5, Задержка перед новым циклом (секунд):
    Gui, Add, DropDownList, w150 vDelay, 0|30|60||90|120
    if (Delay != "")
        GuiControl, ChooseString, Delay, %Delay%

    ; --- Tavern / Scarab ---
    Gui, Add, GroupBox, x650 yp+35 w290 h110, Tavern / Scarab
    Gui, Add, Checkbox, xp+15 yp+30 vToken Checked%Token%, Use Tavern Tokens / Artifacts
    Gui, Add, Checkbox, y+10 vBeer Checked%Beer%, Skip Claiming Beer
    Gui, Add, Checkbox, y+10 vScarab Checked%Scarab%, Skip Using Scarab Token

; --- Mission Priority ---
    ; Augmentation de la hauteur (h) de 210 Г  240 pour inclure la checkbox
    Gui, Add, GroupBox, x650 yp+40 w290 h220, Mission Priority Order
    PriorityList := "2 Squad|War|Medium|Short|Leftover"

    Gui, Add, Text, xp+10 yp+25, 1st:
    Gui, Add, DropDownList, x+10 w200 vPriority1, %PriorityList%
    if (Priority1 != "")
        GuiControl, ChooseString, Priority1, %Priority1%

    Gui, Add, Text, x660 y+10, 2nd:
    Gui, Add, DropDownList, x+10 w200 vPriority2, %PriorityList%
    if (Priority2 != "")
        GuiControl, ChooseString, Priority2, %Priority2%

    Gui, Add, Text, x660 y+10, 3rd:
    Gui, Add, DropDownList, x+10 w200 vPriority3, %PriorityList%
    if (Priority3 != "")
        GuiControl, ChooseString, Priority3, %Priority3%

    Gui, Add, Text, x660 y+10, 4th:
    Gui, Add, DropDownList, x+10 w200 vPriority4, %PriorityList%
    if (Priority4 != "")
        GuiControl, ChooseString, Priority4, %Priority4%

    Gui, Add, Text, x660 y+10, 5th:
    Gui, Add, DropDownList, x+10 w200 vPriority5, %PriorityList%
    if (Priority5 != "")
        GuiControl, ChooseString, Priority5, %Priority5%

    Gui, Add, Checkbox, x660 y+10 vMapReset Checked%MapReset%, Reset map cooldown with gems

; ------------------------------------------------------------------------------
; TAB 3: GUILD & PERSONAL TREE
; ------------------------------------------------------------------------------
Gui, Tab, 3
    ; --- TOP SECTION: GUILD ---
    Gui, Font, Bold
    Gui, Add, Text, x20 y40 w900 h20 Center, GUILD & HERO MANAGEMENT
    Gui, Font, Norm

    Gui, Add, GroupBox, x20 y60 w920 h100, Guild Options
    Gui, Add, Checkbox, xp+20 yp+30 vNoGuild Checked%NoGuild%, (общее) пропустить активность в гильдии
    Gui, Add, Checkbox, y+15 vGNotif Checked%GNotif%, очистить оповещения гильдии

    Gui, Add, Checkbox, x350 y90 vPickaxes Checked%Pickaxes%, пропустить забор бесплатных кирок
    Gui, Add, Checkbox, y+15 vCrystal Checked%Crystal%, тратить кирки автоматически (долбить кристалл)

    Gui, Add, Checkbox, x650 y90 vAwaken Checked%Awaken%, Awaken Heroes

    ; --- BOTTOM SECTION: PERSONAL TREE ---
    Gui, Font, Bold
    Gui, Add, Text, x20 y180 w900 h20 Center, PERSONAL TREE UPGRADES (Priority: Top to Bottom)
    Gui, Add, Checkbox, x40 y200 vPTree Checked%PTree%, > ENABLE PERSONAL TREE UPGRADES <
    Gui, Font, Norm

    ; --- Col 1: Attributes ---
    Gui, Add, GroupBox, x40 y230 w280 h300, Attributes & Heroes
    Gui, Add, Checkbox, xp+15 yp+30 vAttDmg Checked%AttDmg%, Attribute Damage
    Gui, Add, Checkbox, y+10 vAttHp Checked%AttHp%, Attribute Health
    Gui, Add, Checkbox, y+10 vAttArm Checked%AttArm%, Attribute Armor
    Gui, Add, Checkbox, y+10 vEnergy Checked%Energy%, Energy Heroes
    Gui, Add, Checkbox, y+10 vMana Checked%Mana%, Mana Heroes
    Gui, Add, Checkbox, y+10 vRage Checked%Rage%, Rage Heroes
    Gui, Add, Checkbox, y+10 vMiner Checked%Miner%, Miner
    Gui, Add, Checkbox, y+10 vMainAtt Checked%MainAtt%, All Main Attributes

    ; --- Col 2: Specializations ---
    Gui, Add, GroupBox, x340 y230 w280 h300, Specializations
    Gui, Add, Checkbox, xp+15 yp+30 vBattle Checked%Battle%, Battle Cry
    Gui, Add, Checkbox, y+10 vPrest Checked%Prest%, Prestigious
    Gui, Add, Checkbox, y+10 vFire Checked%Fire%, Firestone Effect
    Gui, Add, Checkbox, y+10 vGold Checked%Gold%, Raining Gold
    Gui, Add, Checkbox, y+10 vLevel Checked%Level%, Hero Level Up Cost
    Gui, Add, Checkbox, y+10 vGuard Checked%Guard%, Guardian
    Gui, Add, Checkbox, y+10 vFist Checked%Fist%, Fist Fight
    Gui, Add, Checkbox, y+10 vPrec Checked%Prec%, Precision

    ; --- Col 3: Classes ---
    Gui, Add, GroupBox, x640 y230 w280 h300, Classes
    Gui, Add, Checkbox, xp+15 yp+30 vMagic Checked%Magic%, Magic Spells
    Gui, Add, Checkbox, y+10 vTank Checked%Tank%, Tank Specialization
    Gui, Add, Checkbox, y+10 vDamage Checked%Damage%, Damage Specialization
    Gui, Add, Checkbox, y+10 vHeal Checked%Heal%, Healer Specialization

; ------------------------------------------------------------------------------
; TAB 4: WAR MACHINES
; ------------------------------------------------------------------------------
Gui, Tab, 4
    ; --- Misc ---
    Gui, Add, GroupBox, x40 y50 w880 h100, Battle & Miscellaneous
    Gui, Add, Checkbox, xp+15 yp+30 vPVP Checked%PVP%, Complete Arena Battles
    Gui, Add, Checkbox, x+20 vLiberation Checked%Liberation%, Complete Liberation Missions
    ; NEW CHECKBOX
    Gui, Add, Checkbox, x+20 vDungeonQuest Checked%DungeonQuest%, Complete Dungeon Missions

    ; --- War Machines ---
    Gui, Add, GroupBox, x40 y170 w880 h350, War Machines & Talents
    Gui, Add, Text, xp+15 yp+30, War Machine to Upgrade:
    Gui, Add, DropDownList, w350 vUpgradeWM, Don't Upgrade WM's||Upgrade Aegis|Upgrade Cloudfist|Upgrade Curator|Upgrade Earthshatterer|Upgrade FireCracker|Upgrade Fortress|Upgrade Goliath|Upgrade Harvester|Upgrade Hunter|Upgrade Judgement|Upgrade Sentinel|Upgrade Talos|Upgrade Thunderclap
    if (UpgradeWM != "")
        GuiControl, ChooseString, UpgradeWM, %UpgradeWM%

    Gui, Add, Text, y+20, Upgrade Mode:
    Gui, Add, DropDownList, w350 vWMOptions, Blueprints Only||Level Only|Level and Blueprints|
    if (WMOptions != "")
        GuiControl, ChooseString, WMOptions, %WMOptions%

    Gui, Add, Text, y+20, Blueprint Priority:
    Gui, Add, DropDownList, w350 vBlueprints, Upgrade All||Damage Only|Health Only|Armor Only|Damage and Health|Damage and Armor|Health and Armor
    if (Blueprints != "")
        GuiControl, ChooseString, Blueprints, %Blueprints%

    ; --- Talents ---
    Gui, Add, Text, x500 y200, Talent Options (Legacy/Specific):
    Gui, Add, DropDownList, x500 y225 w350 vTalents450, Don't Upgrade Talents (0-450 Talent Points)||
    if (Talents450 != "")
        GuiControl, ChooseString, Talents450, %Talents450%

    Gui, Add, DropDownList, x500 y280 w350 vTalents800, Don't Upgrade Talents (500+ Talent Points)||
    if (Talents800 != "")
        GuiControl, ChooseString, Talents800, %Talents800%


; ------------------------------------------------------------------------------
; TAB 5: SETTINGS
; ------------------------------------------------------------------------------
Gui, Tab, 5
    Gui, Font, Bold
    Gui, Add, Text, x20 y40 w900 h30 Center, Разрешение экрана и границы
    Gui, Font, Norm

    Gui, Add, GroupBox, x40 y80 w450 h410, Настройки границ окон
	
    Gui, Add, Text, xp+20 yp+40, разрешение экрана по X (1920\1360):
    Gui, Add, Edit, y+10 w250 vResXnew, %ResXnew%
    Gui, Add, Text, x60 y+10 w400,
	
    Gui, Add, Text, yp+10, разрешение экрана по Y (1080\768):
    Gui, Add, Edit, y+10 w250 vResYnew, %ResYnew%
    Gui, Add, Text, x60 y+10 w400,

    Gui, Add, Text, yp+10, расстояние до верхней границы экрана (112 \135):
    Gui, Add, Edit, y+10 w250 vBorTop, %BorTop%
    Gui, Font, Italic
	Gui, Add, Text, y+5, 	steam = 23, браузер яндекс игры = 135\112 с панелью закладок и без ;, 68 - приложение (не работает). 
    Gui, Font, Norm
	
    Gui, Add, Text, yp+40, высота панели ПУСК (48 - по умолчанию):
    Gui, Add, Edit, y+10 w250 vBorBot, %BorBot%
    Gui, Add, Text, x60 y+10 w400,
	
    Gui, Font, Italic
	Gui, Add, Text, yp+10, Проверка для отладки: VarX = %VarX%, VarY = %VarY%`n(переменные не должны быть равны 0)`nсоотношение сторон в игре = %Ratio% (Идеал = %RatioStand%)`n(данные обновляются после перезапуска программы
    Gui, Font, Norm
	
    ; --- Action Buttons ---
    Gui, Add, Button, x100 y520 w180 h60 gSaveSettings, СОХРАНИТЬ`n
    Gui, Add, Button, x400 y520 w180 h60 gButtonStart, запустить бота

; ------------------------------------------------------------------------------
; TAB 6: VERSION
; ------------------------------------------------------------------------------
Gui, Tab, 6
	
    Gui, Font, Bold
    Gui, Add, Text, x20 y40 Center, Версия %RusVer%:
    Gui, Font, Norm
	
    Gui, Add, Text, y+15,	Бот умеет:
    Gui, Add, Text, y+5, -забирать ежедневные подарки оракула
    Gui, Add, Text, y+5, -забирать ежедневные подарки магазина и награду за вход
    Gui, Add, Text, y+5, -тренировать выбранного стража
    Gui, Add, Text, y+5, -собирать запчасти у механика
    Gui, Add, Text, y+5, -запускать алхимика (использует только кровь дракона)
    Gui, Add, Text, y+5, -запускать ритуалы оракула 
    Gui, Add, Text, y+5, -начинать\завершать экспедиции гильдии
    Gui, Add, Text, y+5, -собирать кирки
    Gui, Add, Text, y+5, -собирать чертежи с карты
	Gui, Add, Text, y+5, -исследовать в библиотке
    Gui, Add, Text, y+5, -завершать миссии на карте
    Gui, Add, Text, y+5, -искать и запускать новые миссии на карте (РАБОТАЕТ НЕСТАБИЛЬНО)
    Gui, Add, Text, y+5, -повышать уровень героев\стражей\спец улучшений на этапах (нужно доделать)

;    Gui, Add, Text, y+15,	по идее работает, но не тестировал:
	
;    Gui, Add, Text, y+15,	не умеет:
	
	Gui, Show, w960 h620, Бот от Стаса на основе бота от Deaeth85 V6.1.0
Return

; ==============================================================================
; FUNCTIONS & LABELS
; ==============================================================================

SaveSettings:
    Gui, Submit, NoHide
	VarX := (ResXnew/1920)
	VarY := (ResYnew-BorTop-BorBot)/(1080-23-48)
	Ratio := ResXnew / (ResYnew - BorBot - BorTop)
    SaveSettings()
    MsgBox, 64, Saved, Settings have been saved successfully!
Return

ButtonStart:
    Gui, Submit, NoHide
    If IsFunc("MainScript") {
        SetTimer, MainScript, -100
    } Else {
        MsgBox, 16, Error, The function 'MainScript' was not found.`nPlease ensure you are running 'firestone-bot.ahk' and NOT 'Gui.ahk'.
    }
Return


; --- INI Helper Functions ---
LoadSettings() {
    global
    For VarName, Info in SettingsMap {
        Section := Info[1]
        Default := Info[2]
        IniRead, Val, settings.ini, %Section%, %VarName%, %Default%
        If (Val = "ERROR")
            Val := Default
        %VarName% := Val
    }
}

SaveSettings() {
    global
    For VarName, Info in SettingsMap {
        Section := Info[1]
        ; Get value from GUI variable
        CurrentVal := %VarName%
        IniWrite, %CurrentVal%, settings.ini, %Section%, %VarName%
    }
}