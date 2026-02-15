; MapClose.ahk

;function to close the map screens as they aren't focused and the above function does not work
MapClose()
{
    ControlFocus,, Firestone
    MouseMove, 1870*ResXnew/1920, ((706-22)*(ResYnew-BorTop-BorBot)/1010+BorTop)
	; DEFAULT y = 706
    Sleep, 1000
    click
    Sleep, 1500
    Return
}
