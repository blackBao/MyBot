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

$tabMOD = GUICtrlCreateTabItem("MOD")
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

    Local $x = 215, $y = 150
    $grpStatsMisc = GUICtrlCreateGroup("Smart Zap Drill", $x - 20, $y - 20, 155, 65)
		 GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y +5, 24, 24)
		 $chkSmartLightSpell = GUICtrlCreateCheckbox("", $x + 20, $y, 17, 17)
			$txtTip = "Check this to drop lightning spells on DE drills"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SmartLightSpell")
		 $txtMinDark = GUICtrlCreateInput("1000", $x + 20, $y + 20, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Input The Min Dark Elixer You Want To Drill Zap"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			GUICtrlSetState(-1, $GUI_DISABLE)
			$x += 35
	;Local $x = 365, $y = 150
	;   $grpStatuszap = GUICtrlCreateGroup("Status", $x, $y - 20, 100, 65)
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


	Local $x = 260, $y = 215
		$grpDesideFilter = GUICtrlCreateGroup("DE Side Filter", $x - 20, $y - 20, 175, 55)
			GUICtrlCreateIcon($pIconLib, $eIcnKing, $x, $y, 24, 24)
				$txtTip = "Check this to Filter De Side Attack If No available King And Attack Dead Base Only"
				GUICtrlSetTip(-1, $txtTip)
			$chkDeKingFilter = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "LBHeroFilter")
			$x += 50
			GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x, $y, 24, 24)
				$txtTip = "Check this to Filter De Side Attack If No available Queen And Attack Dead Base Only"
				GUICtrlSetTip(-1, $txtTip)
			$chkDeQueenFilter = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "LBHeroFilter")
			$x += 50
			GUICtrlCreateIcon($pIconLib, $eIcnWarden, $x, $y, 24, 24)
				$txtTip = "Check this to Filter De Side Attack If No available Warden And Attack Dead Base Only"
				GUICtrlSetTip(-1, $txtTip)
			$chkDeWardenFilter = GUICtrlCreateCheckbox("", $x + 30, $y,17, 17)
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "LBHeroFilter")
	Local $x = 30, $y = 270
		$grpAutoTrainSpell = GUICtrlCreateGroup("Auto Train Spell", $x - 20, $y - 20, 225, 85)
			GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x, $y, 24, 24)
				$txtTip = GetTranslated(14,39, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainLightSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$x +=50
			GUICtrlCreateIcon($pIconLib, $eIcnHealSpell, $x, $y, 24, 24)
				$txtTip = GetTranslated(14,40, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainHealSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$x +=50
			GUICtrlCreateIcon($pIconLib, $eIcnRageSpell, $x, $y, 24, 24)
				$txtTip = GetTranslated(14,41, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainRageSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$x +=50
				GUICtrlCreateIcon($pIconLib, $eIcnJumpSpell , $x, $y, 24, 24)
				$txtTip =GetTranslated(14,42, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainJumpSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$y += 27
			$x -= 150
			GUICtrlCreateIcon($pIconLib, $eIcnFreezeSpell , $x, $y, 24, 24)
				$txtTip = GetTranslated(14,43, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainFreezeSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$x +=50
			GUICtrlCreateIcon($pIconLib, $eIcnPoisonSpell , $x, $y, 24, 24)
				$txtTip = GetTranslated(14,44, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainPoisonSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$x +=50
			GUICtrlCreateIcon($pIconLib, $eIcnEarthquakeSpell , $x, $y, 24, 24)
				$txtTip = GetTranslated(14,45, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainEarthquakeSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
			$x +=50
				GUICtrlCreateIcon($pIconLib, $eIcnHasteSpell, $x, $y, 24, 24)
				$txtTip =GetTranslated(14,46, -1)
				GUICtrlSetTip(-1, $txtTip)
			$chkTrainHasteSpell = GUICtrlCreateCheckbox("", $x + 30, $y, 17, 17)
				GUICtrlSetTip(-1, $txtTip)
	Local $x = 380, $y = 150
		$grpHeroFilterSwitch = GUICtrlCreateGroup("Advanced Search", $x - 20, $y - 20, 100, 55)
		$btnHeroSwitch = GUICtrlCreateButton("Normal Filters", $x - 15, $y - 5, 90, 35)
			IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
			GUICtrlSetOnEvent($btnHeroSwitch, "hideAdvanced")
			GUICtrlSetState($btnHeroSwitch, $GUI_HIDE)
		$btnNormalSwitch = GUICtrlCreateButton("Advanced Filters", $x - 15, $y - 5, 90, 35)
			IF $btnColor then GUICtrlSetBkColor(-1, 0xDB4D4D)
			GUICtrlSetOnEvent($btnNormalSwitch, "hidehero")
		GUICtrlCreateGroup("", -99, -99, 1, 1)





	Local $x = 30, $y = 150
	$grpSkipCentreDE = GUICtrlCreateGroup("Skip Centre DE", $x - 20, $y - 20, 170, 55)
	GUICtrlSetState (-1, $GUI_HIDE)
		$cmbSkipCentreDE = GUICtrlCreateCombo("", $x - 15 , $y, 160, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Always attack centre DE storage no filter" & @CRLF & _
						"Always skip base when DE is in the centre." & @CRLF & "Only skip centre DE base if either BK or AQ filter enabled and they are healing."
			GUICtrlSetData(-1, "Always Attack Centre DE|Always Skip Centre DE|Skip When BK/AQ Sleeping", "Always Attack Centre DE")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 205
	$grpSkipUndetectedDE = GUICtrlCreateGroup("Skip Undetected DE", $x - 20, $y - 20, 170, 55)
	GUICtrlSetState (-1, $GUI_HIDE)
		$cmbSkipUndetectedDE = GUICtrlCreateCombo("", $x - 15 , $y, 160, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Always attack undetected DE storage no filter" & @CRLF & _
						"Always skip base when DE is not found." & @CRLF & "Only skip undetected DE base if either BK or AQ filter enabled and they are healing."
			GUICtrlSetData(-1, "Always Attack Undetected DE|Always Skip Undetected DE|Skip When BK/AQ Sleeping", "Always Attack Centre DE")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

		Local $x = 30, $y = 210
			$grpLiveBaseConditionsKing = GUICtrlCreateGroup("King Filter", $x - 20, $y - 20, 225, 130)
			GUICtrlSetState (-1, $GUI_HIDE)
			GUICtrlCreateIcon($pIconLib, $eIcnKing, $x +30, $y +40, 24, 24)
			GUICtrlSetState (-1, $GUI_HIDE)
			$chkLBBKFilter = GUICtrlCreateCheckbox("Enable For BK", $x + 70, $y + 45, -1, -1)
				$txtTip = "Enable this so that when King is healing bot will use new search conditions for Live Bases"
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetState(-1, $GUI_HIDE)
				GUICtrlSetOnEvent(-1, "chkLBBKFilter")
			$grpLiveBaseConditionsQueen = GUICtrlCreateGroup("Queen Filter", $x - 20, $y + 110, 225, 125)
			GUICtrlSetState (-1, $GUI_HIDE)
			GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x +30, $y +160, 24, 24)
			GUICtrlSetState (-1, $GUI_HIDE)
			$chkLBAQFilter = GUICtrlCreateCheckbox("Enable For AQ", $x + 70, $y + 165, -1, -1)
				$txtTip = "Enable this so that when Queen is healing bot will use new search conditions for Live Bases"
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetState(-1, $GUI_HIDE)
				GUICtrlSetOnEvent(-1, "chkLBBKFilter")

		Local $x = 260, $y = 210
			;Hero Heal Feature.
				$grpLiveBaseConditionsHero = GUICtrlCreateGroup("LiveBase No Hero Filter Conditions", $x - 20, $y - 20, 220, 255)
				GUICtrlSetState (-1, $GUI_HIDE)
				$y += 21
				$cmbABMeetGEHero = GUICtrlCreateCombo("", $x , $y + 10, 65, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					$txtTip = "Search for a base that meets the values set for Min. Gold, Elixir."
					GUICtrlSetData(-1, "G And E|G Or E|G + E", "G + E")
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetOnEvent(-1, "cmbABGoldElixirHero")
					GUICtrlSetState (-1, $GUI_HIDE)
				$txtABMinGoldHero = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
					$txtTip = "Set the Min. amount of Gold to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetLimit(-1, 6)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABMinGoldHero = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y, 16, 16)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 21
				$txtABMinElixirHero = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
					$txtTip = "Set the Min. amount of Elixir to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetLimit(-1, 6)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABMinElixirHero = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 131, $y, 16, 16)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y -= 11
				$txtABMinGoldPlusElixirHero = GUICtrlCreateInput("160000", $x + 80, $y, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
					$txtTip = "Set the Min. amount of Gold + Elixir to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetLimit(-1, 6)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABMinGPEGoldHero = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y + 1, 16, 16)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$lblABMinGPEHero = GUICtrlCreateLabel("+", $x + 147, $y + 1, -1, -1)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABMinGPEElixirHero = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 153, $y + 1, 16, 16)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 31
				$chkABMeetDEHero = GUICtrlCreateCheckbox("Dark Elixir", $x , $y, -1, -1)
					$txtTip = "Search for a base that meets the value set for Min. Dark Elixir."
					GUICtrlSetOnEvent(-1, "chkABMeetDEHero")
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$txtABMinDarkElixirHero = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
					$txtTip = "Set the Min. amount of Dark Elixir to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetLimit(-1, 5)
					GUICtrlSetState (-1, $GUI_HIDE)
					_GUICtrlEdit_SetReadOnly(-1, True)
				$picABMinDarkElixirHero = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 131, $y, 16, 16)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 21
				$chkABMeetTrophyHero = GUICtrlCreateCheckbox("Trophies", $x, $y, -1, -1)
					$txtTip = "Search for a base that meets the value set for Min. Trophies."
					GUICtrlSetOnEvent(-1, "chkABMeetTrophyHero")
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$txtABMinTrophyHero = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
					$txtTip = "Set the Min. amount of Trophies to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
					_GUICtrlEdit_SetReadOnly(-1, True)
					GUICtrlSetLimit(-1, 2)
				$picABMinTrophiesHero = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 131, $y, 16, 16)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 21
				$chkABMeetTHHero = GUICtrlCreateCheckbox("Townhall", $x, $y, -1, -1)
					$txtTip = "Search for a base that meets the value set for Max. Townhall Level."
					GUICtrlSetOnEvent(-1, "chkABMeetTHHero")
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$cmbABTHHero = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					$txtTip = "Set the Max. level of the Townhall to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState(-1, $GUI_DISABLE)
					GUICtrlSetState (-1, $GUI_HIDE)
					GUICtrlSetData(-1, "4-6|7|8|9|10|11", "4-6")
				$picABMaxTH1Hero = GUICtrlCreateIcon($pIconLib, $eIcnTH1, $x + 131, $y - 3, 24, 24)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$lblABMaxTHHero = GUICtrlCreateLabel("-", $x + 156, $y + 1, -1, -1)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABMaxTH10Hero = GUICtrlCreateIcon($pIconLib, $eIcnTH10, $x + 160, $y - 3, 24, 24)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 21
				$chkABMeetTHOHero = GUICtrlCreateCheckbox("Snipe outside TH (For any TH level)", $x, $y, -1, -1)
					$txtTip = "Search for a base that has an exposed Townhall. (Outside of Walls)"
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 21
				$chkABWeakBaseHero = GUICtrlCreateCheckbox("WeakBase", $x, $y, -1, -1)
					$txtTip = "Search for a base that has low defences."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
					GUICtrlSetOnEvent(-1, "chkABWeakBaseHero")
				$cmbABWeakMortarHero = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					$txtTip = "Set the Max. level of the Mortar to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 5")
					GUICtrlSetState(-1, $GUI_DISABLE)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABWeakMortarHero = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 131, $y - 3, 24, 24)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y +=23
				$cmbABWeakWizTowerHero = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
					$txtTip = "Set the Max. level of the Wizard Tower to search for on a village to attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 4")
					GUICtrlSetState(-1, $GUI_DISABLE)
					GUICtrlSetState (-1, $GUI_HIDE)
				$picABWeakWizTowerHero = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 131, $y - 2, 24, 24)
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				$y += 30
				$chkABMeetOneHero = GUICtrlCreateCheckbox("Meet One Then Attack", $x, $y, -1, -1)
					$txtTip = "Just meet only ONE of the above conditions, then Attack."
					GUICtrlSetTip(-1, $txtTip)
					GUICtrlSetState (-1, $GUI_HIDE)
				For $i = $grpLiveBaseConditionsKing To $chkABMeetOne
					GUICtrlSetState($i, $GUI_HIDE)
				Next
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
