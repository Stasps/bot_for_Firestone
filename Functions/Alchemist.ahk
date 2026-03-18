; Alchemist.ahk — адаптировано, переведено, поиск по картинке отсутствует

#Include Functions\subFunctions\BigClose.ahk

;alchemist start
Alchemist(){
    ControlFocus,, Firestone
    ; open Alchemist
    MouseMove, 511*VarX, (837-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1500
    
    ; check if blood alchemy isn't running (ищём тёмно синий фон. если он есть - алхимия не запущена)
    PixelSearch, X, Y, 816*VarX, (620-22)*VarY + BorTop, 1063*VarX, (651-22)*VarY + BorTop, 0x1B395B, 3, Fast RGB
    If (ErrorLevel = 0){
        MsgBox, , Алхимия, Алхимия за КРОВЬ ДРАКОНА не запущена, 1.5
    } Else {
        ; check for completed alchemy with blood (поиск чуть расширил влево)
        PixelSearch, X, Y, 960*VarX, (746-22)*VarY + BorTop, 1037*VarX, (792-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
        If (ErrorLevel = 0){
            MouseMove, 949*VarX, (777-22)*VarY + BorTop, 0
            MsgBox, , Алхимия, Алхимия за КРОВЬ ДРАКОНА завершена, 1.5
            Click
            Sleep, 1000
        }
    }

;    ; check if dust alchemy isn't running
;    PixelSearch, X, Y, 1274*VarX, (515-22)*VarY + BorTop, 1298*VarX, (537-22)*VarY + BorTop, 0xFFC700, 3, Fast RGB
;    If (ErrorLevel = 0){
;        MsgBox, , Алхимия, Алхимия за ПЫЛЬ не запущена, 1.5
;    } Else {
;        ; check for completed alchemy with dust
;        PixelSearch, x, y, 1336*VarX, (748-22)*VarY + BorTop, 1386*VarX, (789-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MouseMove, 1286*VarX, (786-22)*VarY + BorTop, 0
;            MsgBox, , Алхимия, Алхимия за ПЫЛЬ завершена, 1.5
;            Click
;            Sleep, 1000
;        }
;    }
;
;    ; check if exotic coin alchemy isn't running
;    PixelSearch, X, Y, 1622*VarX, (518-22)*VarY + BorTop, 1645*VarX, (538-22)*VarY + BorTop, 0xFFC700, 3, Fast RGB
;    If (ErrorLevel = 0){
;        MsgBox, , Алхимия, Алхимия за МОНЕТЫ не запущена, 1.5
;    } Else {
;        ; check for completed alchemy with монеты
;        PixelSearch, X, Y, 1679*VarX, (748-22)*VarY + BorTop, 1735*VarX, (796-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MouseMove, 1632*VarX, (772-22)*VarY + BorTop, 0
;            MsgBox, , Алхимия, Алхимия за МОНЕТЫ завершена, 1.5
;            Click
;            Sleep, 1000
;        }
;    }

; проверка на бесплатное завершение алхимии (кровь дракона)
PixelSearch, X, Y, 790*VarX, (705-22)*VarY + BorTop, 1080*VarX, (850-22)*VarY + BorTop, 0xA6009C, 3, Fast RGB
If (ErrorLevel = 0) {
    ; найден алмаз — значит, завершение только за алмазы
    ;MsgBox, , Алхимия, Завершить можно только за алмазы., 1
} Else {
    ; алмаза нет — ищем светлый оранжевый (кнопка FREE)
    PixelSearch, X, Y, 790*VarX, (705-22)*VarY + BorTop, 1080*VarX, (850-22)*VarY + BorTop, 0xF19C42, 5, Fast RGB
    If (ErrorLevel = 0) {
        MouseMove, 949*VarX, (777-22)*VarY + BorTop, 0
        MsgBox, , Алхимия, Алхимию за КРОВЬ ДРАКОНА можно завершить БЕСПЛАТНО, 1.5
        Click
        Sleep, 1000
    }
}

; ============== дальше мусор =====
;   ; check for free to complete alchemy with dust
;    PixelSearch, x, y, 1336*VarX, (748-22)*VarY + BorTop, 1386*VarX, (789-22)*VarY + BorTop, 0xF9AA47, 3, Fast RGB
;    If (ErrorLevel = 0){
;        MouseMove, 1286*VarX, (786-22)*VarY + BorTop, 0
;        MsgBox, , Алхимия, Алхимию за ПЫЛЬ можно завершить БЕСПЛАТНО, 1.5
;        Click
;        Sleep, 1000
;    }
;
;   ; check for free to complete alchemy with монеты
;    PixelSearch, X, Y, 1679*VarX, (748-22)*VarY + BorTop, 1735*VarX, (796-22)*VarY + BorTop, 0xF9AA47, 3, Fast RGB
;    If (ErrorLevel = 0){
;        MouseMove, 1632*VarX, (772-22)*VarY + BorTop, 0
;        MsgBox, , Алхимия, Алхимию за МОНЕТЫ можно завершить БЕСПЛАТНО, 1.5
;        Click
;        Sleep, 1000
;    }

    ; check for in-process alchemy with blood (цвет поиска изменил на поиск алмазов - иначе он всегда находит эту кнопку
	PixelSearch, X, Y, 790*VarX, (705-22)*VarY + BorTop, 1080*VarX, (850-22)*VarY + BorTop, 0xA6009C, 3, Fast RGB	
    If (ErrorLevel = 0){
        MsgBox, , Алхимия, Алхимию за КРОВЬ ДРАКОНА нельзя завершить бесплатно`n(осталось больше 3 минут), 1.5
        Goto, FinishAlch
    } Else {
        MouseMove, 951*VarX, (771-22)*VarY + BorTop, 0
        MsgBox, , Алхимия, Запускаем алхимию за КРОВЬ ДРАКОНА, 1.5
        Click
        Sleep, 1000
;        Goto, DustSearch
    }

;    DustSearch:
;    ; check if don't use dust is checked
;    GuiControlGet, Checked, , Dust
;    If (Checked = 1){
;        Goto, ExoticCheck
;    } Else {
;        ; check for in-process alchemy with dust
;        PixelSearch, X, Y, 1346*VarX, (734-22)*VarY + BorTop, 1373*VarX, (766-22)*VarY + BorTop, 0x916A38, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MsgBox, , Алхимия, Алхимию за ПЫЛЬ нельзя завершить бесплатно (больше 3 минут), 1.5
;            Goto, ExoticCheck
;        } Else {
;            MouseMove, 1286*VarX, (786-22)*VarY + BorTop, 0
;            MsgBox, , Алхимия, Запускаем алхимию за ПЫЛЬ, 1.5
;            Click
;            Sleep, 1000
;            Goto, ExoticCheck
;        }
;    }
;
;    ; check If using монеты, go through same steps as above If so
;    ExoticCheck:
;    GuiControlGet, Checked, , Coin,
;    If (Checked = 1){
;        ; check for in-process alchemy with монеты
;        PixelSearch, X, Y, 1699*VarX, (737-22)*VarY + BorTop, 1723*VarX, (767-22)*VarY + BorTop, 0x916A38, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MsgBox, , Алхимия, Алхимию за МОНЕТЫ нельзя завершить бесплатно (больше 3 минут), 1.5
;            Goto, FinishAlch
;        } Else {
;            ; start exotic coin alchemy
;            MouseMove, 1641*VarX, (767-22)*VarY + BorTop, 0
;            MsgBox, , Алхимия, Запускаем алхимию за МОНЕТЫ, 1.5
;            Click
;            Sleep, 1000
;            Goto, FinishAlch
;        }
;    }

    FinishAlch:
    BigClose()
    Return
}