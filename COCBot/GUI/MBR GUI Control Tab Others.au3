; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Others
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:  lakereng
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;MBR GUI_Others CONTROLS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func SwitchAndDonate()
	If GUICtrlRead($chkSwitchDonate) = $GUI_CHECKED Then
		$ichkSwitchDonate = 1
	Else
		$ichkSwitchDonate = 0
	EndIf
EndFunc   ;==>SwitchAndDonate


Func MultiFarming()
	If GUICtrlRead($chkMultyFarming) = $GUI_CHECKED Then
		$ichkMultyFarming = 1
	Else
		$ichkMultyFarming = 0
	EndIf
EndFunc   ;==>MultiFarming

  Func SmartLightSpell()
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		GUICtrlSetState($chkTrainLightSpell, $GUI_ENABLE)
		$ichkSmartLightSpell = 1
	Else
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		GUICtrlSetState($chkTrainLightSpell, $GUI_DISABLE)
		GUICtrlSetState($chkTrainLightSpell, $GUI_UNCHECKED)
		$ichkSmartLightSpell = 0

	EndIf
 EndFunc   ;==>GUILightSpell

Func autoLightSpell()
	If GUICtrlRead($chkTrainLightSpell) = $GUI_CHECKED Then
	  $ichkTrainLightSpell = 1
	  Else
      $ichkTrainLightSpell = 0
    EndIf

EndFunc

Func DrillZapTH()
    If GUICtrlRead($chkDrillZapTH) = 1 Then
	  DEDropSmartSpell()
   ElseIf GUICtrlRead($chkDrillZapTH) = 0 Then
	  Return False
   EndIf
EndFunc

Func txtMinDark()
	$itxtMinDark = GUICtrlRead($txtMinDark)
	IniWrite($config, "options", "txtMinDark", $itxtMinDark)
EndFunc

 Func btnConfirmRecSetting()
	switchRecSetting()
 EndFunc ;btnConfirmRecSetting

 Func DeKingFilter()
	If GUICtrlRead($chkDeKingFilter) = $GUI_CHECKED Then
	  $ichkDeKingFilter = 1
	  Else
      $ichkDeKingFilter = 0
	  EndIf
EndFunc

Func DeWardenFilter()
	If GUICtrlRead($chkDeWardenFilter) = $GUI_CHECKED Then
	  $ichkDeWardenFilter = 1
	  Else
      $ichkDeWardenFilter = 0
	  EndIf
EndFunc

Func DeQueenFilter()
	If GUICtrlRead($chkDeQueenFilter) = $GUI_CHECKED Then
	  $ichkDeQueenFilter = 1
	  Else
      $ichkDeQueenFilter = 0
	  EndIf
EndFunc
