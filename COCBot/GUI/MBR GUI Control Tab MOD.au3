; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls MOD
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

;MBR GUI_MOD CONTROLS

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
		GUICtrlSetState($Account, $GUI_ENABLE)
		GUICtrlSetState($lblmultyAcc, $GUI_ENABLE)
		For $i = $grpControls To $cmbHoursStop
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		If GUICtrlRead($chkBotStop) = $GUI_CHECKED Then
			GUICtrlSetState($chkBotStop, $GUI_UNCHECKED)
		EndIf
	Else
		$ichkMultyFarming = 0
		GUICtrlSetState($Account, $GUI_DISABLE)
		GUICtrlSetState($lblmultyAcc, $GUI_DISABLE)
		For $i = $grpControls To $cmbHoursStop
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
	EndIf
EndFunc   ;==>MultiFarming

Func Account()
	$iAccount = GUICtrlRead($Account)
	IniWrite($config, "MOD", "Account", $iAccount)
EndFunc

Func SmartLightSpell()
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		$ichkSmartLightSpell = 1
	Else
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		$ichkSmartLightSpell = 0

	EndIf
 EndFunc   ;==>GUILightSpell

Func DrillZapTH()
    If GUICtrlRead($chkDrillZapTH) = 1 Then
	  DEDropSmartSpell()
   ElseIf GUICtrlRead($chkDrillZapTH) = 0 Then
	  Return False
   EndIf
EndFunc

Func txtMinDark()
	$itxtMinDark = GUICtrlRead($txtMinDark)
	IniWrite($config, "MOD", "txtMinDark", $itxtMinDark)
EndFunc
#cs
 Func btnConfirmRecSetting()
	switchRecSetting()
 EndFunc ;btnConfirmRecSetting
#ce
 Func LBHeroFilter()
	If GUICtrlRead($chkDeKingFilter) = $GUI_CHECKED Then
	  $ichkDeKingFilter = 1
	   GUICtrlSetState($btnNormalSwitch, $GUI_DISABLE)
	   GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
	   GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
	ElseIf GUICtrlRead($chkDeWardenFilter) = $GUI_CHECKED Then
      $ichkDeWardenFilter = 1
	  GUICtrlSetState($btnNormalSwitch, $GUI_DISABLE)
	  GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
	  GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
	ElseIf GUICtrlRead($chkDeQueenFilter) = $GUI_CHECKED Then
	  $ichkDeQueenFilter = 1
	  GUICtrlSetState($btnNormalSwitch, $GUI_DISABLE)
	  GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
	  GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
	Else
	$ichkDeWardenFilter = 0
	$ichkDeKingFilter = 0
	$ichkDeQueenFilter = 0
	GUICtrlSetState($btnNormalSwitch, $GUI_ENABLE)
	EndIf
 EndFunc

Func autoTrainSpell()
	If GUICtrlRead($chkTrainLightSpell) = $GUI_CHECKED Then
	  $ichkTrainLightSpell = 1
	  Else
      $ichkTrainLightSpell = 0
	EndIf
	If GUICtrlRead($chkTrainHealSpell) = $GUI_CHECKED Then
	  $ichkTrainHealSpell = 1
	  Else
      $ichkTrainHealSpell = 0
	EndIf
	If GUICtrlRead($chkTrainRageSpell) = $GUI_CHECKED Then
	  $ichkTrainRageSpell = 1
	  Else
      $ichkTrainRageSpell = 0
	EndIf
;~	If GUICtrlRead($chkTrainJumpSpell) = $GUI_CHECKED Then
;~	  $ichkTrainJumpSpell = 1
;~	  Else
;~	  $ichkTrainJumpSpell = 0
;~	EndIf
	If GUICtrlRead($chkTrainFreezeSpell) = $GUI_CHECKED Then
	  $ichkTrainFreezeSpell = 1
	  Else
      $ichkTrainFreezeSpell = 0
	EndIf
	If GUICtrlRead($chkTrainPoisonSpell) = $GUI_CHECKED Then
	  $ichkTrainPoisonSpell = 1
	  Else
      $ichkTrainPoisonSpell = 0
	EndIf
	If GUICtrlRead($chkTrainEarthquakeSpell) = $GUI_CHECKED Then
	  $ichkTrainEarthquakeSpell = 1
	  Else
      $ichkTrainEarthquakeSpell = 0
	EndIf
;~	If GUICtrlRead($chkTrainHasteSpell) = $GUI_CHECKED Then
;~	  $ichkTrainHasteSpell = 1
;~	  Else
;~    $ichkTrainHasteSpell = 0
;~	EndIf
EndFunc

Func hidehero()
	GUICtrlSetState($btnHeroSwitch, $GUI_SHOW)
	GUICtrlSetState($btnNormalSwitch, $GUI_HIDE)
	For $i = $grpMultyFarming To $chkTrainEarthquakeSpell
		GUICtrlSetState($i, $GUI_HIDE)
	Next
	For $i = $grpSkipCentreDE To $cmbABMeetGEHero
		GUICtrlSetState($i, $GUI_SHOW)

	Next
	cmbABGoldElixirHero()
	For $i = $chkABMeetDEHero To $chkABMeetOneHero
		GUICtrlSetState($i, $GUI_SHOW)
	Next
EndFunc   ;==>hidehero

Func hideAdvanced()
	GUICtrlSetState($btnNormalSwitch, $GUI_SHOW)
	GUICtrlSetState($btnHeroSwitch, $GUI_HIDE)
	For $i = $grpSkipCentreDE To $chkABMeetOneHero
		GUICtrlSetState($i, $GUI_HIDE)
	Next
	For $i = $grpMultyFarming To $chkTrainEarthquakeSpell
		GUICtrlSetState($i, $GUI_SHOW)
	Next
	cmbSearchMode()
	GUICtrlSetState($cmbDBMeetGE, $GUI_SHOW)
	cmbDBGoldElixir()
	For $i = $chkDBMeetDE To $grpLiveBaseConditions
		GUICtrlSetState($i, $GUI_SHOW)
	Next
	GUICtrlSetState($cmbABMeetGE, $GUI_SHOW)
	cmbABGoldElixir()
	For $i = $chkABMeetDE To $picSearchReduceTrophy
		GUICtrlSetState($i, $GUI_SHOW)
	Next

EndFunc   ;==>hidenormal
#cs
	Func chkABEnableAfterHero()
	If GUICtrlRead($chkABEnableAfterHero) = $GUI_CHECKED Then
	_GUICtrlEdit_SetReadOnly($txtABEnableAfter, False)
	GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
	_GUICtrlEdit_SetReadOnly($txtDBEnableAfter, True)
	Else
	_GUICtrlEdit_SetReadOnly($txtABEnableAfter, True)
	EndIf
	EndFunc   ;==>chkABEnableAfter
#ce

Func cmbABGoldElixirHero()
	If _GUICtrlComboBox_GetCurSel($cmbABMeetGEHero) < 2 Then
		GUICtrlSetState($txtABMinGoldHero, $GUI_SHOW)
		GUICtrlSetState($picABMinGoldHero, $GUI_SHOW)
		GUICtrlSetState($txtABMinElixirHero, $GUI_SHOW)
		GUICtrlSetState($picABMinElixirHero, $GUI_SHOW)
		GUICtrlSetState($txtABMinGoldPlusElixirHero, $GUI_HIDE)
		GUICtrlSetState($picABMinGPEGoldHero, $GUI_HIDE)
		GUICtrlSetState($lblABMinGPEHero, $GUI_HIDE)
		GUICtrlSetState($picABMinGPEElixirHero, $GUI_HIDE)
	Else
		GUICtrlSetState($txtABMinGoldHero, $GUI_HIDE)
		GUICtrlSetState($picABMinGoldHero, $GUI_HIDE)
		GUICtrlSetState($txtABMinElixirHero, $GUI_HIDE)
		GUICtrlSetState($picABMinElixirHero, $GUI_HIDE)
		GUICtrlSetState($txtABMinGoldPlusElixirHero, $GUI_SHOW)
		GUICtrlSetState($picABMinGPEGoldHero, $GUI_SHOW)
		GUICtrlSetState($lblABMinGPEHero, $GUI_SHOW)
		GUICtrlSetState($picABMinGPEElixirHero, $GUI_SHOW)
	EndIf
EndFunc   ;==>cmbABGoldElixirHero

Func chkABMeetDEHero()
	If GUICtrlRead($chkABMeetDEHero) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABMinDarkElixirHero, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtABMinDarkElixirHero, True)
	EndIf
EndFunc   ;==>chkABMeetDEHero

Func chkABMeetTrophyHero()
	If GUICtrlRead($chkABMeetTrophyHero) = $GUI_CHECKED Then
		_GUICtrlEdit_SetReadOnly($txtABMinTrophyHero, False)
	Else
		_GUICtrlEdit_SetReadOnly($txtABMinTrophyHero, True)
	EndIf
EndFunc   ;==>chkABMeetTrophyHero

Func chkABMeetTHHero()
	If GUICtrlRead($chkABMeetTHHero) = $GUI_CHECKED Then
		GUICtrlSetState($cmbABTHHero, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbABTHHero, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABMeetTHHero

Func chkABWeakBaseHero()
	If GUICtrlRead($chkABWeakBaseHero) = $GUI_CHECKED Then
		GUICtrlSetState($cmbABWeakMortarHero, $GUI_ENABLE)
		GUICtrlSetState($cmbABWeakWizTowerHero, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbABWeakMortarHero, $GUI_DISABLE)
		GUICtrlSetState($cmbABWeakWizTowerHero, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkABWeakBaseHero

Func chkLBBKFilter()
	If GUICtrlRead($chkLBBKFilter) = $GUI_CHECKED Then
		For $i = $chkDeKingFilter To $chkDeWardenFilter
		GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
	EndIf
	If GUICtrlRead($chkLBAQFilter) = $GUI_CHECKED Then
		For $i = $chkDeKingFilter To $chkDeWardenFilter
		GUICtrlSetState($i, $GUI_UNCHECKED)
		Next
	EndIf
EndFunc   ;==>chkLBBKFilter

Func SmartDeadBase()
	If GUICtrlRead($SmartDeadBase) = $GUI_CHECKED Then
		For $i = $cmbSmartDB To $txtSmartNear
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		GUICtrlSetState($chkDBAutoChoose, $GUI_DISABLE)
		If GUICtrlRead($chkDBAutoChoose) = $GUI_CHECKED Then
			GUICtrlSetState($chkDBAutoChoose, $GUI_UNCHECKED)
		EndIf
	Else
		For $i = $cmbSmartDB To $txtSmartNear
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		GUICtrlSetState($chkDBAutoChoose, $GUI_ENABLE)
	EndIf
EndFunc ;====> SmartDeadBase
Func SmartNear()
	$SmartNear = GUICtrlRead($txtSmartNear)
	IniWrite($config, "MOD", "txtSmartNear", $SmartNear)
EndFunc
Func SmartCollectors()
	$SmartCollectors = GUICtrlRead($txtSmartCollectors)
	IniWrite($config, "MOD", "txtSmartCollectors", $SmartCollectors)
EndFunc

Func txtAPIKey()
   $stxtAPIKey  = GUICtrlRead($txtAPIKey)
   IniWrite($config, "Stats", "txtAPIKey", $stxtAPIKey)
   $MyApiKey = $stxtAPIKey
EndFunc ;==> txtAPIKey

 Func chkCoCStats()
   If GUICtrlRead($chkCoCStats) = $GUI_CHECKED Then
	  $ichkCoCStats = 1
	  GUICtrlSetState($txtAPIKey, $GUI_ENABLE)
   Else
	  $ichkCoCStats = 0
	  GUICtrlSetState($txtAPIKey, $GUI_DISABLE)
EndIf
IniWrite($config, "Stats", "chkCoCStats",$ichkCoCStats)
EndFunc ;==> chkCoCStats

#cs Func MakeAccount()
	$RunState = True
		_CaptureRegion(157,339, 200, 18)
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 157, 339,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
	If Not FileExists(@ScriptDir & "\images\Accmain.bmp") Then
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Accmain.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\AccSecond.bmp") Then
		_CaptureRegion(157,385, 200, 18)
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 157, 385,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\AccSecond.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\Ok.bmp") Then
		_CaptureRegion(532,487, 200, 18)
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap,532,487,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Ok.bmp")
	$RunState = False
	EndIf
EndFunc
#ce