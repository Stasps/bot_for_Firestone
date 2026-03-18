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
SettingsMap["SellEx"] := ["CommonOptions", 0]
SettingsMap["SellScrolls"] := ["CommonOptions", 0]
SettingsMap["SellNoGold"] := ["CommonOptions", 0]
SettingsMap["SellAll"] := ["CommonOptions", 0]
SettingsMap["SellNone"] := ["CommonOptions", 1]
SettingsMap["ExoticUpgrades"] := ["CommonOptions", 0]
SettingsMap["BuyEx"] := ["CommonOptions", 0]
SettingsMap["Chests"] := ["CommonOptions", 0]
SettingsMap["GearChestExclude"] := ["CommonOptions", "Exclude All"]
SettingsMap["JewelChestExclude"] := ["CommonOptions", "Exclude All"]
SettingsMap["Bless"] := ["CommonOptions", 0]
SettingsMap["Delay"] := ["CommonOptions", 0]
SettingsMap["Quests"] := ["CommonOptions", 0]
SettingsMap["Events"] := ["CommonOptions", 0]
SettingsMap["Mail"] := ["CommonOptions", 0]
SettingsMap["Awaken"] := ["CommonOptions", 0]
SettingsMap["Crystal"] := ["CommonOptions", 0]
SettingsMap["Chaos"] := ["CommonOptions", 0]
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
SettingsMap["SearchMissoin"] := ["MissionPriority", 1]
SettingsMap["MapReset"] := ["MissionPriority", 0]

; --- QoL/Rare Options ---
SettingsMap["Beer"] := ["QoL/RareOptions", 1]
SettingsMap["Scarab"] := ["QoL/RareOptions", 1]
SettingsMap["NoGuild"] := ["QoL/RareOptions", 0]
SettingsMap["NoEng"] := ["QoL/RareOptions", 0]
SettingsMap["Pickaxes"] := ["QoL/RareOptions", 1]
SettingsMap["GNotif"] := ["QoL/RareOptions", 0]
SettingsMap["Alch"] := ["QoL/RareOptions", 0]
SettingsMap["Research"] := ["QoL/RareOptions", 0]
SettingsMap["SkipOracle"] := ["QoL/RareOptions", 0]
SettingsMap["NoHero"] := ["QoL/RareOptions", 0]
SettingsMap["NextMilestone"] := ["QoL/RareOptions", 0]
SettingsMap["DisableWarning"] := ["QoL/RareOptions", 1]

; --- Other Options ---
SettingsMap["Shop"] := ["OtherOptions", 0]
SettingsMap["DailyOracle"] := ["OtherOptions", 0]
SettingsMap["PVP"] := ["OtherOptions", 0]
SettingsMap["Liberation"] := ["OtherOptions", 0]
SettingsMap["UpgradeWM"] := ["OtherOptions", "Don't Upgrade WM's"]
SettingsMap["WMOptions"] := ["OtherOptions", "Blueprints Only"]
SettingsMap["Blueprints"] := ["OtherOptions", "Damage Only"]
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
global VarY
SettingsMap["ResXnew"] := ["Resolution"]
SettingsMap["ResYnew"] := ["Resolution"]
SettingsMap["BorTop"] := ["Resolution"]
SettingsMap["BorBot"] := ["Resolution"]
SettingsMap["VarX"] := ["Variable",0]
SettingsMap["VarY"] := ["Variable",0]
RusVer := "0.4.0"
Ratio := ResXnew / (ResYnew - BorBot - BorTop)
RatioStand := 1980/(1080 - 22 - 48)
SettingsMap["Ratio"] := ["Debug"]

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
Gui, Add, Tab3, x0 y0 w960 h620, Home|Общие настройки|Гильдия и личное древо|Боевые машины|Настройки экрана|Версия
; ------------------------------------------------------------------------------
; TAB 1: HOME (INSTRUCTIONS & START)
; ------------------------------------------------------------------------------
Gui, Tab, 1
    Gui, Font, s14 Bold
    Gui, Add, Text, x20 y25 w920 Center, % "Я твой BOT version " RusVer
    Gui, Font, s10 Norm
    ; Gui, Add, Text, x20 yp+25 w920 Center, бот в разработке (закомментировано)
    
    ; --- Instructions Group ---
    Gui, Add, GroupBox, x40 y50 w880 h470, % "Важные требования и инструкции"

    ; ----- Система и настройка игры -----
    Gui, Font, Bold
    Gui, Add, Text, xp+20 yp+25 w840, % "Система и настройка игры:"
    Gui, Font, Norm
    
    Gui, Add, Text, x60 y+2 w820, % "• Тип интерфейса: Мобильная или ПК версия (новый стиль не поддерживается)"
    Gui, Add, Text, x60 y+1 w820, % "• Язык в игре: English (русский не тестировался, но возможен)"
    Gui, Add, Text, x60 y+1 w820, % "• Раскладка клавиатуры: обязательно английская"
    Gui, Add, Text, x60 y+1 w820, % "• Масштаб экрана: 100% (в настройках системы - параметры экрана). По умолчанию так и стоит, но лучше проверить"
    Gui, Add, Text, x60 y+1 w820, % "• Режим окна: оконный, панель ПУСК не скрыта. Полноэкранный режим нестабилен"
    Gui, Add, Text, x60 y+1 w820, % "• Включи «подтверждение использования самоцветов» (на всякий случай)"

    ; ----- Настройка и использование бота -----
    Gui, Font, Bold
    Gui, Add, Text, x60 y+10 w820, % "Настройка и использование бота:"
    Gui, Font, Norm
    
    Gui, Add, Text, x60 y+2 w820, % "• На вкладке «Настройки экрана» укажи параметры экрана, отступы сверху\снизу до игрового поля"
    Gui, Add, Text, x60 y+1 w820, % "• ESC — остановка бота"
    Gui, Add, Text, x60 y+1 w820, % "• Если текст переведён — функция активна. Если нет — лучше отключить"
    Gui, Add, Text, x60 y+1 w820, % "• Не перемещай карту миссий и не используй зум. После сдвига — перезайди в игру"

    ; ----- Известные ошибки -----
    Gui, Font, Bold
    Gui, Add, Text, x60 y+10 w820, % "Известные ошибки:"
    Gui, Font, Norm
    
    Gui, Add, Text, x60 y+2 w820, % "• Если соотношение сторон игрового поля сильно отличается от идеала (~1.96), бот может промахиваться по кнопкам."
    Gui, Add, Text, x60 y+1 w820, % " Текущее соотношение можно увидеть на вкладке «Настройки экрана». Выше 2.1 могут возникнуть проблемы"
    
    Gui, Add, Text, x60 y+1 w820, % "• При поиске миссий для двух отрядов (2 Squat) может задеть кнопки покупки славы/отряда"
    Gui, Add, Text, x60 y+1 w820, % " Рекомендуется  первый запуск проследить, куда будут первые 10-15 кликов на карте"
	
	Gui, Add, Text, x60 y+2 w820, % "• Опция «Улучшать до макс уровня» работает неправильно (галочку не ставьте)"
    Gui, Add, Text, x60 y+1 w820, % " Перед запуском бота, в окне усиления героев поставить «усилить макс»"
    
    Gui, Add, Text, x60 y+1 w820, % "• Алхимия: кнопка Free определяется некорректно. Функция бесплатного завершения отключена"
    Gui, Add, Text, x60 y+1 w820, % "• При завершении миссии может случайно потратить алмазы. Проблема аналогична Алхимии"
    
    ; Жирное предупреждение
    Gui, Font, Bold
    Gui, Add, Text, x60 y+5 w820, % "  (ВАЖНО) первый запуск рекомендуется контролировать вручную (особое внимание на завершение миссий на карте)"
    Gui, Font, Norm
    


    ; --- Action Buttons ---
    Gui, Add, Button, x240 y530 w200 h45 gSaveSettings, % "СОХРАНИТЬ"
    Gui, Add, Button, x520 y530 w200 h45 gButtonStart, % "ЗАПУСТИТЬ БОТА"
	
; ------------------------------------------------------------------------------
; TAB 2: GENERAL OPTIONS
; ------------------------------------------------------------------------------
Gui, Tab, 2
    Gui, Font, Bold
    Gui, Add, Text, x20 y40 w900 h30 Center, ОБЩИЕ НАСТРОЙКИ
    Gui, Font, s9 Norm

; ========== КОЛОНКА 1 ==========
; --- Selling & Exotic ---
Gui, Add, GroupBox, x20 y70 w300 h190, Selling & Exotic Merchant
Gui, Add, Checkbox, x35 y90 w250 vSellEx Checked%SellEx%, Open Exotic Merchant (Master)
Gui, Add, Checkbox, x35 y110 w250 vExoticUpgrades Checked%ExoticUpgrades%, Buy Exotic Upgrades
Gui, Add, Checkbox, x35 y130 w250 vBuyEx Checked%BuyEx%, Buy Exotic Chests

Gui, Add, Text, x35 y155 w250, Selling Strategy:
Gui, Add, Radio, x35 y175 w250 vSellScrolls Checked%SellScrolls%, 1. Sell ONLY Exotic Scrolls
Gui, Add, Radio, x35 y195 w250 vSellNoGold Checked%SellNoGold%, 2. Sell All But Gold Items
Gui, Add, Radio, x35 y215 w250 vSellAll Checked%SellAll%, 3. Sell All Exotic Items
Gui, Add, Radio, x35 y235 w250 vSellNone Checked%SellNone%, 4. Sell Nothing

; --- Other Automation ---
Gui, Add, GroupBox, x20 y265 w300 h130, Прочие автоматизации
Gui, Add, Checkbox, x35 y285 w250 vNoEng Checked%NoEng%, Пропустить механика
Gui, Add, Checkbox, x35 y310 w250 vResearch Checked%Research%, Пропустить исследования
Gui, Add, Checkbox, x35 y335 w250 vDisableWarning Checked%DisableWarning%, Disable Steam Warning

; --- Тренировка стража ---
Gui, Add, Text, x35 y363 w150, Тренировать стража:
Gui, Add, DropDownList, x155 y360 w130 vGuardianTrain, Vermilion|Grace|Ankaa|Azhar
if (GuardianTrain != "")
    GuiControl, ChooseString, GuardianTrain, %GuardianTrain%

; --- Оракул ---
Gui, Add, GroupBox, x20 y400 w300 h100, Оракул
Gui, Add, Checkbox, x35 y425 w280 vBless Checked%Bless%, (не работает!) Улучшать благословления
Gui, Add, Checkbox, x35 y450 w280 vDailyOracle Checked%DailyOracle%, Забирать ежедневные награды оракула
Gui, Add, Checkbox, x35 y475 w280 vSkipOracle Checked%SkipOracle%, (Общий) пропустить оракула

; --- Пауза между циклами бота ---
Gui, Add, GroupBox, x20 y515 w300 h60, Пауза между циклами бота
Gui, Add, Text, x35 y540 w150, Перерыв (секунд):
Gui, Add, DropDownList, x155 y537 w130 vDelay, 0|30|60||90|120
if (Delay != "")
    GuiControl, ChooseString, Delay, %Delay%


; ========== КОЛОНКА 2 ==========
; --- Chests & Rewards ---
Gui, Add, GroupBox, x335 y70 w300 h160, Chests & Rewards
Gui, Add, Checkbox, x350 y90 w250 vChests Checked%Chests%, Open Chests (General)

Gui, Add, Text, x350 y115 w250, Exclude Gear Chests:
Gui, Add, DropDownList, x350 y135 w250 vGearChestExclude, Exclude All|Don't Exclude Any|Epic and Higher|Legendary and Higher|Mythic||
if (GearChestExclude != "")
    GuiControl, ChooseString, GearChestExclude, %GearChestExclude%

Gui, Add, Text, x350 y170 w250, Exclude Jewel Chests:
Gui, Add, DropDownList, x350 y190 w250 vJewelChestExclude, Exclude All|Don't Exclude Any|Diamond and Higher||Opal and Higher|Emerald
if (JewelChestExclude != "")
    GuiControl, ChooseString, JewelChestExclude, %JewelChestExclude%

; --- Alchemy ---
Gui, Add, GroupBox, x335 y240 w300 h80, Алхимия
Gui, Add, Checkbox, x350 y265 w250 vAlch Checked%Alch%, пропустить алхимию
Gui, Font, Italic
Gui, Add, Text, x350 y285 w280 cGray, запускает алхимию только за кровь дракона
Gui, Font, Norm

; --- Hero Upgrades ---
Gui, Add, GroupBox, x335 y330 w300 h260, Улучшение героев на этапах
Gui, Add, Checkbox, x350 y350 w270 vNoHero Checked%NoHero%, (общее) не улучшать героев
Gui, Add, Checkbox, x350 y375 w270 vNextMilestone Checked%NextMilestone%, (НЕ РАБОТАЕТ) Улучшать до макс уровня

Gui, Font, Italic
Gui, Add, Text, x350 y390 w270 cGray, Если выключено — улучшает каждого героя\стража по одному разу за круг. Потому перед стартом бота желательно выставить «усились макс.»
Gui, Font, Norm

Gui, Add, Text, x350 y460 w250, Выберите героев для улучшения:

Gui, Add, Checkbox, x350 y480 w135 vUpgradeSpecial Checked%UpgradeSpecial%, Общие
Gui, Add, Checkbox, x490 y480 w135 vUpgradeGuardian Checked%UpgradeGuardian%, Стражи
Gui, Add, Checkbox, x350 y505 w135 vUpgradeH1 Checked%UpgradeH1%, Герой на позиции 1
Gui, Add, Checkbox, x490 y505 w135 vUpgradeH2 Checked%UpgradeH2%, Герой на позиции 2
Gui, Add, Checkbox, x350 y530 w135 vUpgradeH3 Checked%UpgradeH3%, Герой на позиции 3
Gui, Add, Checkbox, x490 y530 w135 vUpgradeH4 Checked%UpgradeH4%, Герой на позиции 4
Gui, Add, Checkbox, x350 y555 w135 vUpgradeH5 Checked%UpgradeH5%, Герой на позиции 5

; ========== КОЛОНКА 3 ==========
; --- Daily Routine ---
Gui, Add, GroupBox, x650 y70 w290 h150, Ежедневные награды
Gui, Add, Checkbox, x665 y90 w250 vMail Checked%Mail%, Проверять\чистить почту
Gui, Add, Checkbox, x665 y115 w250 vQuests Checked%Quests%, Забирать награду в квестах (дня\недели)
Gui, Add, Checkbox, x665 y140 w250 vEvents Checked%Events%, Забирать награду в событиях
Gui, Add, Checkbox, x665 y165 w250 vChaos Checked%Chaos%, Участвовать в разломе хаоса
Gui, Add, Checkbox, x665 y190 w250 vShop Checked%Shop%, Подарки (магазин) и награды за вход

; --- Tavern / Scarab ---
Gui, Add, GroupBox, x650 y225 w290 h100, Таверна / Игра скарабея
Gui, Add, Checkbox, x665 y250 w250 vToken Checked%Token%, Use Tavern Tokens / Artifacts
Gui, Add, Checkbox, x665 y275 w250 vBeer Checked%Beer%, Skip Claiming Beer
Gui, Add, Checkbox, x665 y300 w250 vScarab Checked%Scarab%, Skip Using Scarab Token

; --- Mission Priority Order ---
Gui, Add, GroupBox, x650 y335 w290 h240, Приоритет поиска миссий
Gui, Add, Checkbox, x665 y360 w250 vSearchMissoin Checked%SearchMissoin%, Искать и запускать миссии на карте

PriorityList := "2 Squad|War|Medium|Short|Leftover"

Gui, Add, Text, x665 y385 w60, 1st:
Gui, Add, DropDownList, x730 y385 w180 vPriority1, %PriorityList%
if (Priority1 != "")
    GuiControl, ChooseString, Priority1, %Priority1%

Gui, Add, Text, x665 y415 w60, 2nd:
Gui, Add, DropDownList, x730 y415 w180 vPriority2, %PriorityList%
if (Priority2 != "")
    GuiControl, ChooseString, Priority2, %Priority2%

Gui, Add, Text, x665 y445 w60, 3rd:
Gui, Add, DropDownList, x730 y445 w180 vPriority3, %PriorityList%
if (Priority3 != "")
    GuiControl, ChooseString, Priority3, %Priority3%

Gui, Add, Text, x665 y475 w60, 4th:
Gui, Add, DropDownList, x730 y475 w180 vPriority4, %PriorityList%
if (Priority4 != "")
    GuiControl, ChooseString, Priority4, %Priority4%

Gui, Add, Text, x665 y505 w60, 5th:
Gui, Add, DropDownList, x730 y505 w180 vPriority5, %PriorityList%
if (Priority5 != "")
    GuiControl, ChooseString, Priority5, %Priority5%

Gui, Add, Checkbox, x665 y540 w250 vMapReset Checked%MapReset%, Reset map cooldown with gems

; ------------------------------------------------------------------------------
; TAB 3: ГИЛЬДИЯ И ПЕРСОНАЛЬНОЕ ДРЕВО
; ------------------------------------------------------------------------------
Gui, Tab, 3
    
    ; ----- ЗАГОЛОВОК РАЗДЕЛА -----
    Gui, Font, Bold
    Gui, Add, Text, x20 y40 w900 h20 Center, ГИЛЬДИЯ И УПРАВЛЕНИЕ ГЕРОЯМИ
    Gui, Font, Norm

	; ----- БЛОК ГИЛЬДИИ -----
	Gui, Add, GroupBox, x20 y60 w920 h100, Настройки гильдии

	Gui, Add, Checkbox, x40 y90 w250 vNoGuild Checked%NoGuild%, (Общее) пропустить активности гильдии
	Gui, Add, Checkbox, x370 y90 w200 vPickaxes Checked%Pickaxes%, НЕ получать бесплатные кирки
	Gui, Add, Checkbox, x670 y90 w200 vCrystal Checked%Crystal%, Разбивать кристалл
	Gui, Add, Checkbox, x370 y120 w200 vAwaken Checked%Awaken%, Пробуждать героев
	Gui, Add, Checkbox, x670 y120 w200 vGNotif Checked%GNotif%, Очистить оповещения
	
	; Подсказка под мастер-кнопкой
	Gui, Font, Italic s8, Segoe UI
	Gui, Add, Text, x60 y105 w250 cGray, % "в том числе и запуск экспедиций"
	Gui, Font, Norm s9, Segoe UI

    ; ----- ПЕРСОНАЛЬНОЕ ДРЕВО -----
    Gui, Font, Bold
    Gui, Add, Text, x20 y180 w900 h20 Center, ПЕРСОНАЛЬНОЕ ДРЕВО (приоритет: сверху вниз)
    Gui, Font, Norm
    
    Gui, Add, Checkbox, x40 y200 vPTree Checked%PTree%, % "ВКЛЮЧИТЬ УЛУЧШЕНИЕ ДРЕВА"

	; ----- КОЛОНКА 1: АТРИБУТЫ -----
	Gui, Add, GroupBox, x40 y230 w280 h270, Атрибуты героев
	Gui, Add, Checkbox, xp+15 yp+25 vAttDmg Checked%AttDmg%, Параметры урона
	Gui, Add, Checkbox, y+8 vAttHp Checked%AttHp%, Параметры здоровья
	Gui, Add, Checkbox, y+8 vAttArm Checked%AttArm%, Параметры брони
	Gui, Add, Checkbox, y+8 vEnergy Checked%Energy%, Герои с энергией
	Gui, Add, Checkbox, y+8 vMana Checked%Mana%, Герои с маной
	Gui, Add, Checkbox, y+8 vRage Checked%Rage%, Герои с яростью
	Gui, Add, Checkbox, y+8 vMainAtt Checked%MainAtt%, Все основные атрибуты

	; ----- КОЛОНКА 2: ОБЩИЕ ПАРАМЕТРЫ -----
	Gui, Add, GroupBox, x340 y230 w280 h270, Общие параметры
	Gui, Add, Checkbox, xp+15 yp+25 vMiner Checked%Miner%, Шахтёр (урон по кристаллу)
	Gui, Add, Checkbox, y+8 vBattle Checked%Battle%, Боевой клич
	Gui, Add, Checkbox, y+8 vPrest Checked%Prest%, Искатели Firestone
	Gui, Add, Checkbox, y+8 vFire Checked%Fire%, Эффект Firestone
	Gui, Add, Checkbox, y+8 vGold Checked%Gold%, Дождь из золота
	Gui, Add, Checkbox, y+8 vLevel Checked%Level%, Цена повышения уровня героя
	Gui, Add, Checkbox, y+8 vGuard Checked%Guard%, Сила стража

	; ----- КОЛОНКА 3: БОЕВОЙ СТИЛЬ И СПЕЦИАЛИЗАЦИИ -----
	Gui, Add, GroupBox, x640 y230 w280 h270, Боевой стиль / Специализации
	Gui, Add, Checkbox, xp+15 yp+25 vFist Checked%Fist%, Кулачный бой
	Gui, Add, Checkbox, y+8 vPrec Checked%Prec%, Точность
	Gui, Add, Checkbox, y+8 vMagic Checked%Magic%, Заклинания
	Gui, Add, Checkbox, y+8 vTank Checked%Tank%, Специализация Танка
	Gui, Add, Checkbox, y+8 vDamage Checked%Damage%, Специализация Бойца
	Gui, Add, Checkbox, y+8 vHeal Checked%Heal%, Специализация Целителя

; ------------------------------------------------------------------------------
; TAB 4: WAR MACHINES
; ------------------------------------------------------------------------------
Gui, Tab, 4
    ; --- Misc ---
    Gui, Add, GroupBox, x40 y50 w880 h100, Battle & Miscellaneous
    Gui, Add, Checkbox, xp+15 yp+30 vPVP Checked%PVP%, Сражаться на арене королей (PvP)
    Gui, Add, Checkbox, x+20 vLiberation Checked%Liberation%, Выполнять освободительные миссии
    Gui, Add, Checkbox, x+20 vDungeonQuest Checked%DungeonQuest%, Выполнять миссии в подземелье

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
    Gui, Font, s10 Bold
    Gui, Add, Text, x20 y40 w900 h30 Center, Разрешение экрана и границы
    Gui, Font, Norm

    ; --- Группа настроек ---
    Gui, Add, GroupBox, x40 y80 w550 h380, Настройки границ окон

    ; === Строка 1: ResXnew ===
    Gui, Add, Text, x60 yp+30 w160, Разрешение экрана по X:
    Gui, Add, Edit, x+10 w150 vResXnew, %ResXnew%
    Gui, Add, Text, x+10 w80, 1920 / 1360

    ; === Строка 2: ResYnew ===
    Gui, Add, Text, x60 y+25 w160, Разрешение экрана по Y:
    Gui, Add, Edit, x+10 w150 vResYnew, %ResYnew%
    Gui, Add, Text, x+10 w80, 1080 / 768

    ; === Строка 3: BorTop ===
    Gui, Add, Text, x60 y+25 w160, Верхняя граница:
    Gui, Add, Edit, x+10 w150 vBorTop, %BorTop%
    Gui, Add, Text, x+10 w170, Steam=22, Яндекс=111/135

    ; === Строка 4: BorBot ===
    Gui, Add, Text, x60 y+25 w160, Панель ПУСК:
    Gui, Add, Edit, x+10 w150 vBorBot, %BorBot%
    Gui, Add, Text, x+10 w170, Win11=48, Win10=40

    ; Пояснение (курсив)
    Gui, Font, Italic
    Gui, Add, Text, x60 y+25 w500, * Яндекс Браузер: 135 (с панелью закладок), 111 (без)
    Gui, Font, Norm

    ; Отладочная информация
    Gui, Font, s9 Norm
    Gui, Add, Text, x60 y+25 w500,
    (Join`s`n
	Проверка для отладки:
Изменение по Х = %VarX%, Изменение по Y = %VarY% (не должны быть 0)
Соотношение сторон (игрового поля) = %Ratio% (идеал = %RatioStand%)
Данные обновляются после перезапуска программы
    )

    ; --- Кнопки ---
    Gui, Add, Button, x150 y500 w150 h45 gSaveSettings, СОХРАНИТЬ
    Gui, Add, Button, x330 y500 w150 h45 gButtonStart, ЗАПУСТИТЬ

; ------------------------------------------------------------------------------
; TAB 6: VERSION
; ------------------------------------------------------------------------------
Gui, Tab, 6

    ; --- Заголовок ---
    Gui, Font, s10 Bold
    Gui, Add, Text, x40 y40 w880 Center, Версия %RusVer%:
    Gui, Font, Norm

    ; --- Основные возможности ---
    Gui, Add, Text, x40 y+15, Бот умеет:
    Gui, Add, Text, x40 y+5, - забирать ежедневные подарки оракула
    Gui, Add, Text, x40 y+5, - забирать ежедневные подарки магазина и награду за вход
    Gui, Add, Text, x40 y+5, - тренировать выбранного стража
    Gui, Add, Text, x40 y+5, - собирать запчасти у механика
    Gui, Add, Text, x40 y+5, - запускать алхимика (использует только кровь дракона)
    Gui, Add, Text, x40 y+5, - запускать ритуалы оракула 
    Gui, Add, Text, x40 y+5, - начинать\завершать экспедиции гильдии
    Gui, Add, Text, x40 y+5, - собирать кирки
    Gui, Add, Text, x40 y+5, - собирать чертежи с карты
    Gui, Add, Text, x40 y+5, - исследовать в библиотеке
    Gui, Add, Text, x40 y+5, - завершать миссии на карте
    Gui, Add, Text, x40 y+5, - искать и запускать новые миссии на карте
    Gui, Add, Text, x40 y+5, - повышать уровень героев\стражей\спец улучшений на этапах (нужно доделать)
    Gui, Add, Text, x40 y+5, - сражаться на арене, а так же выполнять миссии освобождения\подземелья (0.3.2)
    Gui, Add, Text, x40 y+5, - пробуждать героев, участвовать в разломе хаоса и прокачивать персональное древо (0.3.3)
    Gui, Add, Text, x40 y+5, - забирать награды за ежедневные\еженедельные задания, проверять почту, забирать награды событий (0.3.4)

    ; --- Шаблон: по идее работает, но не тестировал ---
    Gui, Font, Bold
    Gui, Add, Text, x40 y+15, по идее работает, но не тестировал (в яндекс играх):
    Gui, Font, Norm
    Gui, Add, Text, x40 y+5, - всё, что добавлено в версии 0.3.2 и выше (начиная со сражений на арене и далее по списку)
    ;Gui, Add, Text, x40 y+5, - пробуждать героев, участвовать в разломе хаоса и прокачивать персональное древо
    ;Gui, Add, Text, x40 y+5, - забирать награды за ежедневные\ежнедельные задания, проверять почту, забирать награды событий (0.3.4)

    ; --- Шаблон: не умеет ---
    Gui, Font, Bold
    Gui, Add, Text, x40 y+15, не умеет:
    Gui, Font, Norm
    Gui, Add, Text, x40 y+5, - Открывать сундуки
    Gui, Add, Text, x40 y+5, - улучшать Благословления оракула (0.3.5), так как нужно сначала научить открывать сундуки
    ; Gui, Add, Text, x40 y+5, - пункт 3 (пример)

    ; --- Отображение окна (уже есть в коде, оставляем как есть) ---
    Gui, Show, w960 h620, Бот от Стаса на основе бота от Deaeth85 V6.1.0
Return

; ==============================================================================
; FUNCTIONS & LABELS
; ==============================================================================

SaveSettings:
    Gui, Submit, NoHide
	VarX := (ResXnew/1920)
	VarY := (ResYnew-BorTop-BorBot)/(1080-22-48)
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