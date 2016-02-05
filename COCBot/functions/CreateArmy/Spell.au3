
; #FUNCTION# ====================================================================================================================
; Name ..........: BrewSpells
; Description ...: Create Normal Spells and Dark Spells
; Syntax ........: BrewSpells()
; Parameters ....:
; Return values .: None
; Author ........: ProMac ( 08-2015)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func BrewSpells()

	; ATTENTION : This function only works if the ArmyOverView Windows is open
	; Spell Creation
	; Dark Spell Factory

	If $iTotalCountSpell = 0 Then Return

	If $CurSFactory < $TotalSFactory Or $ichkTrainLightSpell = 1 Or $ichkTrainHealSpell = 1 Or $ichkTrainRageSpell = 1 Or $ichkTrainJumpSpell = 1 Or $ichkTrainFreezeSpell = 1 Or $ichkTrainPoisonSpell = 1 Or $ichkTrainEarthquakeSpell = 1 Or $ichkTrainHasteSpell = 1 Then ;  If not full the Spell Factory then try to make spells
		;Auto Train Lightning, create 2 lightning spells
			If $ichkTrainLightSpell = 1 Then
				$LightningSpellComp = $CurLightningSpell + 2
				SetLog("Auto Train Lighting Spell")
			EndIf
			If $ichkTrainHealSpell = 1 Then
				$HealSpellComp = $CurHealSpell + 2
				SetLog("Auto Train Heal Spell")
			EndIf
			If $ichkTrainRageSpell = 1 Then
				$RageSpellComp = $CurRageSpell + 2
				SetLog("Auto Train Rage Spell")
			EndIf
			If $ichkTrainJumpSpell = 1 Then
				$JumpSpellComp = $CurJumpSpell + 2
				SetLog("Auto Train Jump Spell")
			EndIf
			If $ichkTrainFreezeSpell = 1 Then
				$FreezeSpellComp = $CurFreezeSpell + 2
				SetLog("Auto Train Freeze Spell")
			EndIf
			If $ichkTrainPoisonSpell = 1 Then
				$PoisonSpellComp = $CurPoisonSpell + 2
				SetLog("Auto Train poison Spell")
			EndIf
			If $ichkTrainEarthquakeSpell = 1 Then
				$EarthquakeSpellComp = $CurEarthSpell + 2
				SetLog("Auto Train Heal Spell")
			EndIf
		; Spell Creation
		; Normal Spell Factory

		If $numFactorySpellAvaiables = 1 And ($LightningSpellComp > 0 Or $RageSpellComp > 0 Or $HealSpellComp > 0 Or $JumpSpellComp > 0 Or $FreezeSpellComp > 0) Then
			$iBarrHere = 0
			While Not (isSpellFactory())
				If Not (IsTrainPage()) Then Return
				_TrainMoveBtn(+1) ;click Next button
				$iBarrHere += 1
				If _Sleep($iDelayTrain3) Then ExitLoop
				If $iBarrHere = 8 Then ExitLoop
			WEnd
			If isSpellFactory() Then
				If $LightningSpellComp > 0 Then ; Lightning Spells
					$TempLightningSpell = Number(getBarracksTroopQuantity(175 + 107 * 0, 296 + $midOffsetY))
					Local $LightningSpell = $LightningSpellComp - ($CurLightningSpell + $TempLightningSpell)
					If $debugSetlog = 1 Then SetLog("Making Lightning Spell: " & $LightningSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempLightningSpell = 0 Then
						If _ColorCheck(_GetPixelColor(239, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; White into number 0
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $LightningSpell > 0 Then
								GemClick(222, 354 + $midOffsetY, $LightningSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $LightningSpell & " Lightning Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Lightning Spell(s)")
					EndIf
				EndIf
				If $HealSpellComp > 0 Then ; Heal Spells
					$TempHealSpell = Number(getBarracksTroopQuantity(175 + 107 * 1, 296 + $midOffsetY))
					Local $HealSpell = $HealSpellComp - ($CurHealSpell + $TempHealSpell)
					If $debugSetlog = 1 Then SetLog("Making Heal Spell: " & $HealSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempHealSpell = 0 Then
						If _ColorCheck(_GetPixelColor(346, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $HealSpell > 0 Then
								GemClick(334, 354 + $midOffsetY, $HealSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $HealSpell & " Heal Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Heal Spell(s)")
					EndIf
				EndIf
				If $RageSpellComp > 0 Then ; Rage Spells
					$TempRageSpell = Number(getBarracksTroopQuantity(175 + 107 * 2, 296 + $midOffsetY))
					Local $RageSpell = $RageSpellComp - ($CurRageSpell + $TempRageSpell)
					If $debugSetlog = 1 Then SetLog("Making Rage Spell: " & $RageSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempRageSpell = 0 Then
						If _ColorCheck(_GetPixelColor(453, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $RageSpell > 0 Then
								GemClick(430, 354 + $midOffsetY, $RageSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $RageSpell & " Rage Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Rage Spell(s)")
					EndIf
				EndIf
				If $JumpSpellComp > 0 Then ; Jump Spells
					$TempJumpSpell = Number(getBarracksTroopQuantity(175 + 107 * 3, 296 + $midOffsetY))
					Local $JumpSpell = $JumpSpellComp - ($CurJumpSpell + $TempJumpSpell)
					If $debugSetlog = 1 Then SetLog("Making Jump Spell: " & $JumpSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempJumpSpell = 0 Then
						If _ColorCheck(_GetPixelColor(560, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $JumpSpell > 0 Then
								GemClick(510, 354 + $midOffsetY, $JumpSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $JumpSpell & " Jump Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Jump Spell(s)")
					EndIf
				EndIf
				If $FreezeSpellComp > 0 Then ; Freeze Spells
					$TempFreezeSpell = Number(getBarracksTroopQuantity(175 + 107 * 4, 296 + $midOffsetY))
					Local $FreezeSpell = $FreezeSpellComp - ($CurFreezeSpell + $TempFreezeSpell)
					If $debugSetlog = 1 Then SetLog("Making Freeze Spell: " & $FreezeSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempFreezeSpell = 0 Then
						If _ColorCheck(_GetPixelColor(667, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $FreezeSpell > 0 Then
								GemClick(626, 354 + $midOffsetY, $FreezeSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $FreezeSpell & " Freeze Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Freeze Spell(s)")
					EndIf
				EndIf
			Else
				SetLog("Spell Factory not found...", $COLOR_BLUE)
			EndIf
		EndIf

		If $numFactoryDarkSpellAvaiables = 1 And ($PoisonSpellComp > 0 Or $EarthquakeSpellComp > 0 Or $HasteSpellComp > 0) Then
			$iBarrHere = 0
			While Not (isDarkSpellFactory())
				If Not (IsTrainPage()) Then Return
				_TrainMoveBtn(+1) ;click Next button
				$iBarrHere += 1
				If $iBarrHere = 8 Then ExitLoop
				If _Sleep($iDelayTrain3) Then Return
			WEnd
			If isDarkSpellFactory() Then
				If $PoisonSpellComp > 0 Then ; Poison Spells
					$TempPoisonSpell = Number(getBarracksTroopQuantity(175 + 107 * 0, 296 + $midOffsetY))
					Local $PoisonSpell = $PoisonSpellComp - ($CurPoisonSpell + $TempPoisonSpell)
					If $debugSetlog = 1 Then SetLog("Making Poision Spell: " & $PoisonSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempPoisonSpell = 0 Then
						If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(239, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $PoisonSpell > 0 Then
								GemClick(222, 354 + $midOffsetY, $PoisonSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $PoisonSpell & " Poison Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Poison Spell(s)")
					EndIf
				EndIf

				If $EarthquakeSpellComp > 0 Then ; Earth Spells
                    $TempEarthSpell = Number(getBarracksTroopQuantity(175 + 107 * 1, 296 + $midOffsetY))
                    Local $EarthSpell = $EarthquakeSpellComp - ($CurEarthSpell + $TempEarthSpell)
                    If $debugSetlog = 1 Then SetLog("Making Earth Spell: " & $EarthSpell)
                    If _sleep($iDelayTrain2) Then Return
                    If $TempEarthSpell = 0 Then
                        If _sleep($iDelayTrain2) Then Return
                        If _ColorCheck(_GetPixelColor(346, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; black pixel in number 5
                            setlog("Not enough Elixir to create Spell", $COLOR_RED)
                            Return
                        ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
                            setlog("Spell Factory Full", $COLOR_RED)
                            Return
                        Else
                            If $EarthSpell > 0 Then
                                GemClick(334, 354 + $midOffsetY, $EarthSpell, $iDelayTrain7, "#0290")
                                SetLog("Created " & $EarthSpell & " Earth Spell(s)", $COLOR_BLUE)
                            EndIf
                        EndIf
					Else
                        Setlog("Already done Earth Spell(s)")
                    EndIf
                EndIf

				If $HasteSpellComp > 0 Then ; Haste Spells
					$TempHasteSpell = Number(getBarracksTroopQuantity(175 + 107 * 2, 296 + $midOffsetY))
					Local $HasteSpell = $HasteSpellComp - ($CurHasteSpell + $TempHasteSpell)
					If $debugSetlog = 1 Then SetLog("Making Haste Spell: " & $HasteSpell)
					If _sleep($iDelayTrain2) Then Return
					If $TempHasteSpell = 0 Then
						If _sleep($iDelayTrain2) Then Return
						If _ColorCheck(_GetPixelColor(453, 375 + $midOffsetY, True), Hex(0xFFFFFF, 6), 20) = False Then ; black pixel in number 5
							setlog("Not enough Elixir to create Spell", $COLOR_RED)
							Return
						ElseIf _ColorCheck(_GetPixelColor(200, 346 + $midOffsetY, True), Hex(0x414141, 6), 20) Then
							setlog("Spell Factory Full", $COLOR_RED)
							Return
						Else
							If $HasteSpell > 0 Then
								GemClick(430, 354 + $midOffsetY, $HasteSpell, $iDelayTrain7, "#0290")
								SetLog("Created " & $HasteSpell & " Haste Spell(s)", $COLOR_BLUE)
							EndIf
						EndIf
					Else
						Setlog("Already done Haste Spell(s)")
					EndIf
				EndIf
			Else
				SetLog("Dark Spell Factory not found...", $COLOR_BLUE)
			EndIf
		EndIf
	Else
		SetLog("Spell Factory is full ...", $COLOR_BLUE)
	EndIf
EndFunc   ;==>BrewSpells
