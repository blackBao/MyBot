; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GkevinOD (2014)
; Modified ......: Hervidero (2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func cmbTroopComp()
	If _GUICtrlComboBox_GetCurSel($cmbTroopComp) <> $icmbTroopComp Then
		$icmbTroopComp = _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		For $i = 0 To UBound($TroopName) - 1
			Assign("Cur" & $TroopName[$i], 1)
		Next
		For $i = 0 To UBound($TroopDarkName) - 1
			Assign("Cur" & $TroopDarkName[$i], 1)
		Next
		SetComboTroopComp()
	EndIf
EndFunc   ;==>cmbTroopComp

Func SetComboTroopComp()
	Switch _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		Case 0
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next
			GUICtrlSetData($txtNumArch, "100")
		Case 1
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next
			GUICtrlSetData($txtNumBarb, "100")
		Case 2
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next
			GUICtrlSetData($txtNumGobl, "100")
		Case 3
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next

			GUICtrlSetData($txtNumBarb, "50")
			GUICtrlSetData($txtNumArch, "50")
		Case 4
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next

			_GUICtrlEdit_SetReadOnly($txtNumGiant, False)

			GUICtrlSetData($txtNumBarb, "60")
			GUICtrlSetData($txtNumArch, "30")
			GUICtrlSetData($txtNumGobl, "10")

			GUICtrlSetData($txtNumGiant, $GiantComp)
		Case 5
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next
			_GUICtrlEdit_SetReadOnly($txtNumGiant, False)

			GUICtrlSetData($txtNumBarb, "50")
			GUICtrlSetData($txtNumArch, "50")

			GUICtrlSetData($txtNumGiant, $GiantComp)
		Case 6
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next
			GUICtrlSetData($txtNumBarb, "60")
			GUICtrlSetData($txtNumArch, "30")
			GUICtrlSetData($txtNumGobl, "10")
		Case 7
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), "0")
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), "0")
			Next

			_GUICtrlEdit_SetReadOnly($txtNumGiant, False)
			_GUICtrlEdit_SetReadOnly($txtNumWall, False)

			GUICtrlSetData($txtNumBarb, "60")
			GUICtrlSetData($txtNumArch, "30")
			GUICtrlSetData($txtNumGobl, "10")

			GUICtrlSetData($txtNumGiant, $GiantComp)
			GUICtrlSetData($txtNumWall, $WallComp)
			GUICtrlSetData($txtNumWiza, $WizaComp)
			GUICtrlSetData($txtNumMini, $MiniComp)
			GUICtrlSetData($txtNumHogs, $HogsComp)
		Case 8
			GUICtrlSetState($cmbBarrack1, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_ENABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_ENABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_ENABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_DISABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_DISABLE)
			Next
			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), True)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), True)
			Next
		Case 9
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			
			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopName[$i]), $GUI_ENABLE)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetState(Eval("txtNum" & $TroopDarkName[$i]), $GUI_ENABLE)
			Next

			For $i = 0 To UBound($TroopName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopName[$i]), False)
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				_GUICtrlEdit_SetReadOnly(Eval("txtNum" & $TroopDarkName[$i]), False)
			Next

			For $i = 0 To UBound($TroopName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopName[$i]), Eval($TroopName[$i] & "Comp"))
			Next
			For $i = 0 To UBound($TroopDarkName) - 1
				GUICtrlSetData(Eval("txtNum" & $TroopDarkName[$i]), Eval($TroopDarkName[$i] & "Comp"))
			Next

	EndSwitch
	lblTotalCount()
EndFunc   ;==>SetComboTroopComp

Func lblTotalCount()
	GUICtrlSetData($lblTotalCount, GUICtrlRead($txtNumBarb) + GUICtrlRead($txtNumArch) + GUICtrlRead($txtNumGobl))
	If GUICtrlRead($lblTotalCount) = "100" Then
		GUICtrlSetBkColor($lblTotalCount, $COLOR_MONEYGREEN)
	ElseIf GUICtrlRead($lblTotalCount) = "0" Then
		GUICtrlSetBkColor($lblTotalCount, $COLOR_ORANGE)
	Else
		GUICtrlSetBkColor($lblTotalCount, $COLOR_RED)
	EndIf
 EndFunc   ;==>lblTotalCount

 Func lblTotalCountSpell()
	; GUICtrlSetData($lblTotalCountSpell, GUICtrlRead($txtNumLightningSpell)*2 + GUICtrlRead($txtNumHealSpell)*2 + GUICtrlRead($txtNumRageSpell)*2 + GUICtrlRead($txtNumPoisonSpell) + GUICtrlRead($txtNumHasteSpell))
	If (GUICtrlRead($txtNumLightningSpell)*2 + GUICtrlRead($txtNumHealSpell)*2 + GUICtrlRead($txtNumRageSpell)*2 + GUICtrlRead($txtNumJumpSpell)*2 + GUICtrlRead($txtNumFreezeSpell)*2 + GUICtrlRead($txtNumPoisonSpell) + GUICtrlRead($txtNumHasteSpell) + GUICtrlRead($txtNumEarthquakeSpell)) < GUICtrlRead($txtTotalCountSpell)+1 Then
		GUICtrlSetBkColor($txtNumLightningSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumHealSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumRageSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumPoisonSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumHasteSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumJumpSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumFreezeSpell, $COLOR_MONEYGREEN)
		GUICtrlSetBkColor($txtNumEarthquakeSpell, $COLOR_MONEYGREEN)
	Else
		GUICtrlSetBkColor($txtNumLightningSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumHealSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumRageSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumPoisonSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumHasteSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumJumpSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumFreezeSpell, $COLOR_RED)
		GUICtrlSetBkColor($txtNumEarthquakeSpell, $COLOR_RED)
	EndIf

	If GUICtrlRead($txtTotalCountSpell) = 0 then
		GUICtrlSetState($txtNumLightningSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumHealSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumRageSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumHasteSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumJumpSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_DISABLE)
		GUICtrlSetState($txtNumEarthquakeSpell, $GUI_DISABLE)
		GUICtrlSetBkColor($txtNumLightningSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumHealSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumRageSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumPoisonSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumHasteSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumJumpSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumFreezeSpell, $COLOR_WHITE)
		GUICtrlSetBkColor($txtNumEarthquakeSpell, $COLOR_WHITE)
	Else
		GUICtrlSetState($txtNumLightningSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumHealSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumRageSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumPoisonSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumHasteSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumJumpSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumFreezeSpell, $GUI_ENABLE)
		GUICtrlSetState($txtNumEarthquakeSpell, $GUI_ENABLE)
	EndIf

 EndFunc   ;==>lblTotalCountSpell

 Func hideDark()
	GUICtrlSetState($btnDark, $GUI_SHOW)
	GUICtrlSetState($btnNormal, $GUI_HIDE)
	For $i = $grpSpells To $lblFreezeS
		GUICtrlSetState($i, $GUI_HIDE)
	Next
	For $i = $grpDark To $lblTimesHasteS
		GUICtrlSetState($i, $GUI_SHOW)

	Next
EndFunc  ;==>hideDark

Func hideNormal()
	GUICtrlSetState($btnNormal, $GUI_SHOW)
	GUICtrlSetState($btnDArk, $GUI_HIDE)
	For $i = $grpDark To $lblTimesHasteS
		GUICtrlSetState($i, $GUI_HIDE)
	Next
	For $i = $grpSpells To $lblFreezeS
		GUICtrlSetState($i, $GUI_SHOW)
	Next

EndFunc   ;==>hideDark
