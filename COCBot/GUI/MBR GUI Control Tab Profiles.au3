
Func setupProfileComboBox1()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbGoldMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbGoldMaxProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox2()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbGoldMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbGoldMinProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox3()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbElixirMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbElixirMaxProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox4()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbElixirMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbElixirMinProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox5()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbDEMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbDEMaxProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox6()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbDEMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbDEMinProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox7()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbTrophyMaxProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbTrophyMaxProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox
Func setupProfileComboBox8()
	; Array to store Profile names to add to ComboBox
	Local $profileString = ""
	Local $aProfiles = _FileListToArray($sProfilePath, "*", $FLTA_FOLDERS)
	If @error Then
		; No folders for profiles so lets set the combo box to a generic entry
		$profileString = "<No Profiles>"
	Else
		; Lets create a new array without the first entry which is a count for populating the combo box
		Local $aProfileList[$aProfiles[0]]
		For $i = 1 to $aProfiles[0]
			$aProfileList[$i - 1] = $aProfiles[$i]
		Next

		; Convert the array into a string
		$profileString = _ArrayToString($aProfileList, "|")
	EndIF

	; Clear the combo box current data in case profiles were deleted
	GUICtrlSetData($cmbTrophyMinProfile, "", "")
	; Set the new data of available profiles
	GUICtrlSetData($cmbTrophyMinProfile, $profileString, "<No Profiles>")
EndFunc   ;==>setupProfileComboBox