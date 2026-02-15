; Alchemist.ahk

#Include Functions\subFunctions\BigClose.ahk

;alchemist start
Alchemist(){
    ControlFocus,, Firestone
    ; open Alchemist
    MouseMove, 511*ResXnew/1920, ((837-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1500
    ; check if blood alchemy isn't running
    PixelSearch, X, Y, 928*ResXnew/1920, ((519-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 948*ResXnew/1920, ((535-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xFFC700, 3, Fast RGB
        If (ErrorLevel = 0){
            MsgBox, , Статус Алхимии, алхмия за КРОВЬ ДРАКОНА не запущена, 1.5
        } Else {
        ; check for completed alchemy with blood
        PixelSearch, X, Y, 985*ResXnew/1920, ((746-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1037*ResXnew/1920, ((792-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
            If (ErrorLevel = 0){
                MouseMove, 949*ResXnew/1920, ((777-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
                MsgBox, , Статус Алхимии, алхмия за КРОВЬ ДРАКОНА завершена, 1.5
                Click
                Sleep, 1000
            }
        }

;    ; check if dust alchemy isn't running
;    PixelSearch, X, Y, 1274*ResXnew/1920, ((515-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1298*ResXnew/1920, ((537-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xFFC700, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MsgBox, , Статус Алхимии, алхмия за ПЫЛЬ не запущена, 1.5
;        } Else {
;            ; check for completed alchemy with dust
;            PixelSearch, x, y, 1336*ResXnew/1920, ((748-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1386*ResXnew/1920, ((789-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
;                If (ErrorLevel = 0){
;                    MouseMove, 1286*ResXnew/1920, ((786-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;                    MsgBox, , Статус Алхимии, алхмия за ПЫЛЬ завершена, 1.5
;                    Click
;                    Sleep, 1000
;                }
;            }
;    ; check if exotic coin alchemy isn't running
;   PixelSearch, X, Y, 1622*ResXnew/1920, ((518-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1645*ResXnew/1920, ((538-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xFFC700, 3, Fast RGB
;    If (ErrorLevel = 0){
;        MsgBox, , Статус Алхимии, алхмия за МОНЕТЫ не запущена, 1.5
;    } Else {
;        ; check for completed alchemy with алхмия за МОНЕТЫ
;        PixelSearch, X, Y, 1679*ResXnew/1920, ((748-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1735*ResXnew/1920, ((796-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
;            If (ErrorLevel = 0){
;                MouseMove, 1632*ResXnew/1920, ((772-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;                MsgBox, , Статус Алхимии, алхмия за МОНЕТЫ завершена, 1.5
;                Click
;                Sleep, 1000
;            }
;        }
; ============== доработать ===========
    ; check for free to complete alchemy with blood
;    PixelSearch, X, Y, 969*ResXnew/1920, ((742-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1026*ResXnew/1920, ((756-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF9AA47, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MouseMove, 949*ResXnew/1920, ((777-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;            MsgBox, , Статус Алхимии, алхмия за КРОВЬ ДРАКОНА может быть БЕСПЛАТНО завершена, 1.5
;            Click
;            Sleep, 1000
;        }
; ============== дальше мусор =====
;   ; check for free to complete alchemy with dust
;    PixelSearch, x, y, 1336*ResXnew/1920, ((748-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1386*ResXnew/1920, ((789-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF9AA47, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MouseMove, 1286*ResXnew/1920, ((786-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;            MsgBox, , Статус Алхимии, алхмия за ПЫЛЬ может быть БЕСПЛАТНО завершена, 1.5
;            Click
;            Sleep, 1000
;        }
;   ; check for free to complete alchemy with алхмия за МОНЕТЫ
;    PixelSearch, X, Y, 1679*ResXnew/1920, ((748-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1735*ResXnew/1920, ((796-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0xF9AA47, 3, Fast RGB
;        If (ErrorLevel = 0){
;            MouseMove, 1632*ResXnew/1920, ((772-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;            MsgBox, , Статус Алхимии, алхмия за МОНЕТЫ может быть БЕСПЛАТНО завершена, 1.5
;            Click
;           Sleep, 1000
;        }
    ; check for in-process alchemy with blood
    PixelSearch, X, Y, 1007*ResXnew/1920, ((735-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1030*ResXnew/1920, ((766-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x916A38, 3, Fast RGB
        If (ErrorLevel = 0){
            MsgBox, , Статус Алхимии, алхмия за КРОВЬ ДРАКОНА бесплатно завершить нельзя `n (осталось больше 3х минут), 1.5
;            Goto, DustSearch
        } Else {
            MouseMove, 951*ResXnew/1920, ((771-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
            MsgBox, , Статус Алхимии, Запускаем алхмия за КРОВЬ ДРАКОНА, 1.5
            Click
            Sleep, 1000
;            Goto, DustSearch
        }

;    DustSearch:
;    ; check if don't use dust is checked
;    GuiControlGet, Checked, , Dust
;        If (Checked = 1){
;            Goto, ExoticCheck
;        } Else {
;            ; check for in-process alchemy with dust
;            PixelSearch, X, Y, 1346*ResXnew/1920, ((734-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1373*ResXnew/1920, ((766-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x916A38, 3, Fast RGB
;                If (ErrorLevel = 0){
;                    MsgBox, , Статус Алхимии, алхмия за ПЫЛЬ бесплатно завершить нельзя (больше 3х минут), 1.5
;                    Goto, ExoticCheck
;                } Else {
;                    MouseMove, 1286*ResXnew/1920, ((786-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;                    MsgBox, , Статус Алхимии, Запускаем алхмия за ПЫЛЬ, 1.5
;                    Click
;                    Sleep, 1000
;                    Goto, ExoticCheck
;                }
;        }
;    ; check If using алхмия за МОНЕТЫ, go through same steps as above If so
;    ExoticCheck:
;    GuiControlGet, Checked, , Coin,
;        If (Checked = 1){
;            ; check for in-process alchemy with алхмия за МОНЕТЫ
;            PixelSearch, X, Y, 1699*ResXnew/1920, ((737-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1723*ResXnew/1920, ((767-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x916A38, 3, Fast RGB
;                If (ErrorLevel = 0){
;                    MsgBox, , Статус Алхимии, алхмия за МОНЕТЫ бесплатно завершить нельзя (больше 3х минут), 1.5
;                    Goto, FinishAlch
;                } Else {
;                    ; start exotic coin alchemy
;                    MouseMove, 1641*ResXnew/1920, ((767-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
;                    MsgBox, , Статус Алхимии, Запускаем алхмия за МОНЕТЫ, 1.5
;                    Click
;                    Sleep, 1000
;                    Goto, FinishAlch
;                }
;            }
    FinishAlch:
    BigClose()
    Return
}