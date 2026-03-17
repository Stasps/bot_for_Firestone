; PTree.ahk — адаптировано

#Include Functions\subFunctions\BigClose.ahk
#Include Functions\subFunctions\MainMenu.ahk

; Вспомогательная функция для клика по узлу и подтверждения
ClickNode(nodeX, nodeY) {
    MouseMove, nodeX*VarX, (nodeY-22)*VarY + BorTop, 0
    Sleep, 500
    Click
    Sleep, 500
    
    ; Подтверждение (кнопка Confirm)
    MouseMove, 960*VarX, (680-22)*VarY + BorTop, 0
    Sleep, 500
    Click
    Sleep, 500
    
    ; Два клика по кнопке Upgrade
    Loop, 2 {
        MouseMove, 1760*VarX, (561-22)*VarY + BorTop, 0
        Sleep, 500
        Click
        Sleep, 500
    }
}

; optional personal tree upgrades
PersonalTree() {
    ; Открыть дерево персонажа
    MouseMove, 1823*VarX, (945-22)*VarY + BorTop, 0
    Sleep, 1000
    Click
    Sleep, 1500
    
    ; === ATTRIBUTES ===
    GuiControlGet, Checked, , AttDmg
    If (Checked = 1)
        ClickNode(365, 313)
    
    GuiControlGet, Checked, , AttHp
    If (Checked = 1)
        ClickNode(512, 276)
    
    GuiControlGet, Checked, , AttArm
    If (Checked = 1)
        ClickNode(687, 367)
    
    GuiControlGet, Checked, , Energy
    If (Checked = 1)
        ClickNode(353, 492)
    
    GuiControlGet, Checked, , Mana
    If (Checked = 1)
        ClickNode(511, 442)
    
    GuiControlGet, Checked, , Rage
    If (Checked = 1)
        ClickNode(687, 534)
    
    GuiControlGet, Checked, , Miner
    If (Checked = 1)
        ClickNode(858, 199)
    
    GuiControlGet, Checked, , MainAtt
    If (Checked = 1)
        ClickNode(957, 365)
    
    ; === SPECIALIZATIONS ===
    GuiControlGet, Checked, , Battle
    If (Checked = 1)
        ClickNode(1061, 205)
    
    GuiControlGet, Checked, , Prest
    If (Checked = 1)
        ClickNode(963, 536)
    
    GuiControlGet, Checked, , Fire
    If (Checked = 1)
        ClickNode(860, 696)
    
    GuiControlGet, Checked, , Gold
    If (Checked = 1)
        ClickNode(1059, 701)
    
    GuiControlGet, Checked, , Level
    If (Checked = 1)
        ClickNode(849, 866)
    
    GuiControlGet, Checked, , Guard
    If (Checked = 1)
        ClickNode(1063, 867)
    
    GuiControlGet, Checked, , Fist
    If (Checked = 1)
        ClickNode(1235, 369)
    
    GuiControlGet, Checked, , Prec
    If (Checked = 1)
        ClickNode(1399, 276)
    
    ; === CLASSES ===
    GuiControlGet, Checked, , Magic
    If (Checked = 1)
        ClickNode(1567, 320)
    
    GuiControlGet, Checked, , Tank
    If (Checked = 1)
        ClickNode(1233, 535)
    
    GuiControlGet, Checked, , Damage
    If (Checked = 1)
        ClickNode(1404, 440)
    
    GuiControlGet, Checked, , Heal
    If (Checked = 1)
        ClickNode(1572, 492)
    
    BigClose()
}

BigClose()