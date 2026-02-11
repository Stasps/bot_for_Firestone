; BigClose.ahk

;function to close menus
BigClose(){
    MouseMove, 1880*ResXnew/1920, (75*(ResYnew-BorTop-BorBot)/1010+BorTop)
	; DEFAULT y = 88
    Sleep, 1000
    Click
    Sleep, 1500
    Return
}
