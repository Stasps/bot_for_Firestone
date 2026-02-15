; Research.ahk

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\ResearchStart.ahk
#Include Functions\subFunctions\ResearchSlotTest.ahk

global Slot1InProcess := 0
global Slot2InProcess := 0

GoResearch() {
    ControlFocus,, Firestone
	MsgBox, ,Research.ahk, открываем библиотеку, 1
    ; open Library
    MouseMove, 329*VarX, (657-22)*VarY + BorTop
    Sleep, 1000
    click
    sleep, 1000
    ; select Firestone tree
;    MouseMove, 1809, 975
    MouseMove, 1816*VarX, (610-22)*VarY + BorTop
    Sleep, 1000
    click
    Sleep, 1000
    ResearchSlotTest()
    If (Slot1InProcess = 0){
        ResearchStart()
    }
    If (Slot2InProcess = 0){
        ResearchStart()
    }
    BigClose()
}