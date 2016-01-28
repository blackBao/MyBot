; #FUNCTION# ====================================================================================================================
; Name ..........: DeHeroFilter
; Description ...: Checking of HERO and Earhquake Spell
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........: Lakereng (2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func DeHeroFilter()
	Local $HeroFilter = 0
	If $ichkDeKingFilter = 1 And $BarbarianKingAvailable = 0 Then
			SetLog("Active Hero Filter: No Barbarian King Available.. Attack Dead base only  ", $COLOR_PURPLE)
			$HeroFilter = 1
	Elseif $ichkDeWardenFilter = 1 And $GrandWardenAvailable = 0 Then
			SetLog("Active Hero Filter: No Grand Warden Available.. Attack Dead base only  ", $COLOR_PURPLE)
			$HeroFilter = 1
	ElseIf $ichkDeQueenFilter = 1 And $ArcherQueenAvailable = 0 Then
			SetLog("Active Hero Filter: No Archer Queen Available.. Attack Dead base only  ", $COLOR_PURPLE)
			$HeroFilter = 1
	ElseIf ($ichkDeQueenFilter = 1 And $ArcherQueenAvailable = 1) Or ($ichkDeWardenFilter = 1 And $GrandWardenAvailable = 1) Or ($ichkDeKingFilter = 1 And $BarbarianKingAvailable = 1) Then
		SetLog("DeActive Hero Filter.. ", $COLOR_PURPLE)
		$HeroFilter = 0
	EndIf
	If $CurEarthSpell >= 4 Then
				Setlog(" - No. of EarthquakeSpell: " & $CurEarthSpell & " Ready to drooped in battle")
				$ichkEarthquakeSpell[$LB] = 1
				GUICtrlSetState($chkABEarthquakeSpellCSV, $GUI_CHECKED)
			Else
				Setlog(" - No. of EarthquakeSpell: " & $CurEarthSpell & " waiting to 4 to drooped in battle")
				$ichkEarthquakeSpell[$LB] = 0
				GUICtrlSetState($chkABEarthquakeSpellCSV, $GUI_UNCHECKED)
			EndIf

	If $HeroFilter = 1 And $iCmbSearchMode = 2 Then
	   $iCmbSearchMode = 0
	ElseIf $HeroFilter = 0 And $iCmbSearchMode = 0 Then
		$iCmbSearchMode = 2
	EndIf
EndFunc