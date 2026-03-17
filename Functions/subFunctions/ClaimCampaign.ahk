; ClaimCampaign.ahk

#Include Functions\subFunctions\LiberationMissions.ahk
#Include Functions\subFunctions\GoMap.ahk
#Include Functions\subFunctions\BigClose.ahk

;function to get the campaign coins and tokens
ClaimCampaign(){
    ControlFocus,, Firestone
	MsgBox, ,ClaimCampaign.ahk, собираем монеты кампании и чертежи, 1
    MouseMove, 1857*VarX, (606-22)*VarY + BorTop
    Sleep, 1000
    Click
    Sleep, 1000
    ; failsafe in case player doesn't have engineer unlocked
    PixelSearch, X, Y, 997*VarX, (310-22)*VarY + BorTop, 1305*VarX, (461-22)*VarY + BorTop, 0xF4E0C6, 2, Fast RGB
    If (ErrorLevel = 0){
        BigClose()
        BigClose()
        Return
    }
    PixelSearch, X, Y, 187*VarX, (926-22)*VarY + BorTop, 246*VarX, (990-22)*VarY + BorTop, 0x0AA008, 3, Fast RGB
    If (ErrorLevel = 0){
        MouseMove, 165*VarX, (977-22)*VarY + BorTop
        Sleep, 1000
        Click
        Sleep, 1000
    }
	    GuiControlGet, Checked, , Liberation,
    If (Checked=1){
	MsgBox, ,LiberationMissions, Переходим к миссиям освобождения, 1
        LiberationMissions()
    } 
    BigClose()
}