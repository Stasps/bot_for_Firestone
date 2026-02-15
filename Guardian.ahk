; Guardian.ahk

#Include Functions\subFunctions\BigClose.ahk

;function that does the guardian training and guardian evolving
Guardian(){
    ControlFocus,, Firestone
    ; open Magic Quarter
	MsgBox, ,, Тренируем выбранного стража, 1
    MouseMove, 658*ResXnew/1920, ((284-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    click
    Sleep, 3000
    ; check for evolve
    PixelSearch, X, Y, 1307*ResXnew/1920, ((107-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1346*ResXnew/1920, ((136-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0F40000, 3, Fast RGB
    if(ErrorLevel=0){
        MouseMove, 1275*ResXnew/1920, ((165-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1000
        MouseMove, 1117*ResXnew/1920, ((750-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Click
        Sleep, 10500
        MouseMove, 1291*ResXnew/1920, ((171-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        Click
        Sleep, 1000
    }
    ; check for training
    PixelSearch, X, Y, 1199*ResXnew/1920, ((766-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 1257*ResXnew/1920, ((810-22)*(ResYnew-BorTop-BorBot)/1010+BorTop), 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        SendInput, {Left down}
        Sleep, 2000
        SendInput, {Left up}
        Sleep, 500
        global GuardianTrain
        IniRead, GuardianTrain, settings.ini, CommonOptions, GuardianTrain, 0
        if (GuardianTrain == "Grace"){
            Loop, 1
            {
                SendEvent, {Right down}
                Sleep, 100
                SendEvent, {Right up}
                Sleep, 100
            }
        }
        if (GuardianTrain == "Ankaa"){
            Loop, 2
            {
                SendEvent, {Right down}
                Sleep, 100
                SendEvent, {Right up}
                Sleep, 100
            }
        }
        if (GuardianTrain == "Azhar"){
            Loop, 3
            {
                SendEvent, {Right down}
                Sleep, 100
                SendEvent, {Right up}
                Sleep, 100
            }
        }
        MouseMove, 1138*ResXnew/1920, ((787-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
        Sleep, 1000
        click
        Sleep, 1000
    }
    BigClose()
    Return
}