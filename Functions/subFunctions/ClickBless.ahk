; ClickBless.ahk Ч адаптированно

; simple script to click the Bless box to save on coding
ClickBless(){
    MouseMove, 1371*VarX, (812-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
    
    MouseMove, 471*VarX, (643-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1000
}