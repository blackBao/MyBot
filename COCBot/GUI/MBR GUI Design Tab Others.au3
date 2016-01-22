; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Others
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: Lakereng (2016) And Extreme DE Side MOD
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$tabOthers = GUICtrlCreateTabItem("Others")
	;;;;;;;;;;;;;;;;;
    ;;; Mult-Farming
    ;;;;;;;;;;;;;;;;;
	Local $x = 30, $y = 150
	$grpMultyFarming = GUICtrlCreateGroup("Multi-Farming Mode", $x - 20, $y - 20, 180, 65)
		$chkSwitchDonate = GUICtrlCreateCheckbox("Switch Account and Donate", $x - 5, $y - 5, -1, -1)
			$txtTip = "Will switch account and Donate, then switch back"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SwitchAndDonate")
	$y += 20
		$chkMultyFarming = GUICtrlCreateCheckbox("Multi-Farming Mode", $x - 5, $y, -1 , -1)
			$txtTip = "Will switch account and attack, then switch back"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "MultiFarming")

    Local $x = 210, $y = 150
    $grpStatsMisc = GUICtrlCreateGroup("Smart Zap Drill", $x - 20, $y - 20, 175, 65)
		 GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 5, 24, 24)
		 $chkSmartLightSpell = GUICtrlCreateCheckbox("Use Ligthning", $x + 20, $y - 5, -1, -1)
			$txtTip = "Check this to drop lightning spells on DE drills"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SmartLightSpell")
		 $chkTrainLightSpell = GUICtrlCreateCheckbox("Auto train lighting spell", $x + 20, $y + 20, -1, -1)
			$txtTip = "Check this to always create spell lightning please set 0 lightnig spell on troops tab"
			GUICtrlSetTip(-1, $txtTip)
		 $txtMinDark = GUICtrlCreateInput("1000", $x + 110, $y - 5, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Input The Min Dark Elixer You Want To Drill Zap"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			GUICtrlSetState(-1, $GUI_DISABLE)
	Local $x = 365, $y = 150
	   $grpStatuszap = GUICtrlCreateGroup("Status", $x, $y - 20, 100, 65)
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 75, $y - 8, 21, 21)
		$lblSmartZap = GUICtrlCreateLabel("0", $x -10, $y - 5, 80, 30, $SS_RIGHT)
		GUICtrlSetFont(-1, 12, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1, 0x279B61)
		$txtTip = "The amount of Dark Elixir you zapped."
	    GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 75, $y + 17, 21, 21)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x -10, $y + 20, 80, 30, $SS_RIGHT)
		GUICtrlSetFont(-1, 12, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
		$txtTip = "The amount of Lightning Spells Used in zapping."
	    GUICtrlSetTip(-1, $txtTip)

	Local $x = 30, $y = 215
		$grpProfiles = GUICtrlCreateGroup(GetTranslated(7,26, "Switch Profiles"), $x - 20, $y - 20, 225, 55)
		;$y -=5
		;$lblProfile = GUICtrlCreateLabel(GetTranslated(7,27, "Current Profile") & ":", $x, $y, -1, -1)
		;$y += 15
		$cmbRecSetting = GUICtrlCreateCombo("Custom", $x, $y, 100, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		$txtTip = GetTranslated(7,28, "Use this to switch to a different profile")& @CRLF & GetTranslated(7,29, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetData(-1, "TH Snipe |TH 8 (G + E) |TH 8(G + E + DE)|TH 8 (DE)|TH 9 (G + E) |TH 9 (G + E + DE) |TH 9 (DE) |TH 10 (G + E) |TH 10 (G + E + DE) |TH 10 (DE)", "Custom")
		;GUICtrlSetOnEvent(-1, "cmbRecSetting")
		$btnConfirmRecSetting = GUICtrlCreateButton ("Confirm", $x +120, $y, 65, 20)
		$txtTip = "Apply your selected settings with this button."
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "btnConfirmRecSetting")


	Local $x = 250, $y = 215
		$grpDesideFilter = GUICtrlCreateGroup("DE Side Filter", $x - 20, $y - 20, 175, 55)
			GUICtrlCreateIcon($pIconLib, $eIcnKing, $x, $y, 24, 24)
				$txtTip = "Check this to Filter De Side Attack If No available King And Attack Dead Base Only"
				GUICtrlSetTip(-1, $txtTip)
			$chkDeKingFilter = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "DeKingFilter")
			$x += 50
			GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x, $y, 24, 24)
				$txtTip = "Check this to Filter De Side Attack If No available Queen And Attack Dead Base Only"
				GUICtrlSetTip(-1, $txtTip)
			$chkDeQueenFilter = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "DeQueenFilter")
			$x += 50
			GUICtrlCreateIcon($pIconLib, $eIcnWarden, $x, $y, 24, 24)
				$txtTip = "Check this to Filter De Side Attack If No available Warden And Attack Dead Base Only"
				GUICtrlSetTip(-1, $txtTip)
			$chkDeWardenFilter = GUICtrlCreateCheckbox("", $x + 30, $y,17, 17)
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "DeWardenFilter")


GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
