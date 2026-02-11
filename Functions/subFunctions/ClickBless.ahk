; ClickBless.ahk

; simple script to click the Bless box to save on coding
ClickBless(){
    MouseMove, 1371*ResXnew/1920, ((812-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1000
    MouseMove, 471*ResXnew/1920, ((643-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
    Sleep, 1000
    Click
    Sleep, 1000
}