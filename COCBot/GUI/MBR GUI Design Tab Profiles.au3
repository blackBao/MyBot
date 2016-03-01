$tabProfiles = GUICtrlCreateTabItem("Profiles")

Local $x = 30, $y = 150
	$grpProfiles = GUICtrlCreateGroup(GetTranslated(7,26, "Switch Profiles"), $x - 20, $y - 20, 250, 45)
		$y -= 5
		;$lblProfile = GUICtrlCreateLabel(GetTranslated(7,27, "Current Profile") & ":", $x, $y, -1, -1)
		;$y += 15
		$cmbProfile = GUICtrlCreateCombo("", $x - 3, $y + 1, 130, 18, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(7,28, "Use this to switch to a different profile")& @CRLF & GetTranslated(7,29, "Your profiles can be found in") & ": " & @CRLF & $sProfilePath
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox()
			GUICtrlSetState(-1, $GUI_SHOW)
			GUICtrlSetOnEvent(-1, "cmbProfile")
		$txtVillageName = GUICtrlCreateInput(GetTranslated(7,30, "MyVillage"), $x - 3, $y, 130, 20, BitOR($SS_CENTER, $ES_AUTOHSCROLL))
			GUICtrlSetLimit (-1, 100, 0)
			GUICtrlSetFont(-1, 9, 400, 1)
			GUICtrlSetTip(-1, GetTranslated(7,31, "Your village/profile's name"))
			GUICtrlSetState(-1, $GUI_HIDE)
			; GUICtrlSetOnEvent(-1, "txtVillageName") - No longer needed
		$btnAddConfirm = GUICtrlCreateButton("Add", $x + 132, $y, 45, 24)
			GUICtrlSetOnEvent(-1, "btnAddConfirm")
		$btnDeleteCancel = GUICtrlCreateButton("Delete", $x + 178, $y, 45, 24)
			GUICtrlSetOnEvent(-1, "btnDeleteCancel")
			If GUICtrlRead($cmbProfile) = "<No Profiles>" Then
				GUICtrlSetState(-1, $GUI_DISABLE)
			Else
				GUICtrlSetState(-1, $GUI_ENABLE)
			EndIf
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 200
	$grpGoldSwitch = GUICtrlCreateGroup("Gold Switch Profile Conditions", $x - 20, $y - 20, 450, 75) ;Gold Switch
		$chkGoldSwitchMax = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when gold is above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMaxProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox1()
		$lblGoldMax = GUICtrlCreateLabel("When Gold is Above", $x + 190, $y, -1, -1)
		$txtMaxGoldAmount = GUICtrlCreateInput("6000000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Gold to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
$y += 30
		$chkGoldSwitchMin = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when gold is below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbGoldMinProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox2()
		$lblGoldMin = GUICtrlCreateLabel("When Gold is Below", $x + 190, $y, -1, -1)
		$txtMinGoldAmount = GUICtrlCreateInput("500000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Gold to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 390, $y - 20, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 50
	$grpElixirSwitch = GUICtrlCreateGroup("Elixir Switch Profile Conditions", $x - 20, $y - 20, 450, 75) ; Elixir Switch
		$chkElixirSwitchMax = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Elixir is above amount."
			GUICtrlSetTip(-1, $txtTip)

		$cmbElixirMaxProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox3()
		$lblElixirMax = GUICtrlCreateLabel("When Elixir is Above", $x + 190, $y, -1, -1)
		$txtMaxElixirAmount = GUICtrlCreateInput("6000000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
$y += 30
		$chkElixirSwitchMin = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Elixir is below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbElixirMinProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox4()
		$lblElixirMin = GUICtrlCreateLabel("When Elixir is Below", $x + 190, $y, -1, -1)
		$txtMinElixirAmount = GUICtrlCreateInput("500000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 7)
		$picProfileElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 390, $y - 20, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 50
	$grpDESwitch = GUICtrlCreateGroup("Dark Elixir Switch Profile Conditions", $x - 20, $y - 20, 450, 75) ;DE Switch
		$chkDESwitchMax = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Dark Elixir is above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDEMaxProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox5()
		$lblDEMax = GUICtrlCreateLabel("When Dark Elixir is Above", $x + 190, $y, -1, -1)
		$txtMaxDEAmount = GUICtrlCreateInput("200000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Dark Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
$y += 30
		$chkDESwitchMin = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Dark Elixir is below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbDEMinProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox6()
		$lblDEMin = GUICtrlCreateLabel("When  Dark Elixir is Below", $x + 190, $y, -1, -1)
		$txtMinDEAmount = GUICtrlCreateInput("10000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Dark Elixir to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picProfileDE = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 390, $y - 20, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
$y += 50
	$grpTrophySwitch = GUICtrlCreateGroup("Trophy Switch Profile Conditions", $x - 20, $y - 20, 450, 85) ; Trophy Switch
		$chkTrophySwitchMax = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Trophies are above amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMaxProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox7()
		$lblTrophyMax = GUICtrlCreateLabel("When Trophies are Above", $x + 190, $y, -1, -1)
		$txtMaxTrophyAmount = GUICtrlCreateInput("3000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Trophies to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
$y += 30
		$chkTrophySwitchMin = GUICtrlCreateCheckbox("Switch To", $x, $y - 5, -1, -1)
			$txtTip = "Enable this to switch profiles when Trophies are below amount."
			GUICtrlSetTip(-1, $txtTip)
		$cmbTrophyMinProfile = GUICtrlCreateCombo("", $x + 75, $y - 5, 100, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Select which profile to be switched to when conditions met"
			GUICtrlSetTip(-1, $txtTip)
			setupProfileComboBox8()
		$lblTrophyMin = GUICtrlCreateLabel("When Trophies are Below", $x + 190, $y, -1, -1)
		$txtMinTrophyAmount = GUICtrlCreateInput("1000", $x + 325, $y - 5, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the amount of Trophies to trigger switching Profile."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
		$picProfileTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 390, $y - 20, 32, 32)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")