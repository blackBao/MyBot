; #FUNCTION# ====================================================================================================================
; Name ..........: Algorithm_FourFingger
; Description ...:
; Syntax ........: Algorithm_FourFingger()
; Parameters ....: None
; Return values .: None
; Author ........: Lakereng (2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func algorithm_SmartDeadBase()
	Global $nbSides
	If $debugSetlog = 1 Then Setlog("algorithm_SmartDeadBase", $COLOR_PURPLE)
		SetSlotSpecialTroops()
		If _Sleep($iDelayalgorithm_AllTroops1) Then Return

		Local $hTimer = TimerInit()
		_WinAPI_DeleteObject($hBitmapFirst)
		$hBitmapFirst = _CaptureRegion2()
		_GetRedArea()

			SetLog("Locating Mines & Collectors", $COLOR_BLUE)
			$hTimer = TimerInit()
			Global $PixelMine[0]
			Global $PixelElixir[0]
			Global $PixelDarkElixir[0]
			Global $PixelNearCollector[0]
			Global $PixelNearCollectorx[0]
			Global $PixelElixirTrue[0]
			Global $SideTopLeft = 0
			Global $SideBottomLeft = 0
			Global $SideTopRight = 0
			Global $SideBottomRight = 0
			Local $PixelMinex = 0

				$PixelMine = GetLocationMine()
				If (IsArray($PixelMine)) Then
					For $i = 0 To UBound($PixelMine) - 1
						$PixelElixircheck = $PixelMine[$i]
						If isInsideDiamond($PixelElixircheck) Then
							$PixelMinex +=1
							ReDim $PixelElixirTrue[$PixelMinex]
							$PixelElixirTrue[$PixelMinex - 1] = $PixelElixircheck
						EndIf
					Next
					For $i = 0 To UBound($PixelElixirTrue) - 1
						$pixel = $PixelElixirTrue[$i]
						If isInsideDiamond($pixel) Then
							If $pixel[0] <= $InternalArea[2][0] Then
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopLeft += 1
								Else
									$SideBottomLeft += 1
								EndIf
							Else
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopRight += 1
								Else
									$SideBottomRight += 1
								EndIf
							EndIf
						EndIf
					Next
					_ArrayAdd($PixelNearCollector, $PixelElixirTrue)
					_ArrayAdd($PixelNearCollectorx, $PixelElixirTrue)
				EndIf

				$PixelElixir = GetLocationElixir()
				If (IsArray($PixelElixir)) Then
					For $i = 0 To UBound($PixelElixir) - 1
						$pixel = $PixelElixir[$i]
						If isInsideDiamond($pixel) Then
							If $pixel[0] <= $InternalArea[2][0] Then
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopLeft += 1
								Else
									$SideBottomLeft += 1
								EndIf
							Else
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopRight += 1
								Else
									$SideBottomRight += 1
								EndIf
							EndIf
						EndIf
					Next
				EndIf

			SetLog("Located  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")
			SetLog("[" & UBound($PixelNearCollectorx) & "] Gold Mines")
			SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")
			$iNbrOfDetectedMines[$iMatchMode] += UBound($PixelElixirTrue)
			$iNbrOfDetectedCollectors[$iMatchMode] += UBound($PixelElixir)
			UpdateStats()

	SetLog("Please Wait!... Choose Side With Collector ", $COLOR_BLUE)
	FindSideColl()
	SetLog("Number of Side " & $nbSides, $COLOR_BLUE)
	If $nbSides = 0 Then Return
	If $nbSides = 1 Then ; Customise DE side wave deployment here
		$iMatchMode = $LB
		$iChkDeploySettings[$LB] = 5
		If $debugSetlog = 1 Then SetLog("List Deploy for Customized Side attack", $COLOR_PURPLE)

        Local $listInfoDeploy[24][5]
        Local $waveCount,$waveNumber
        Local $deploystring

        for $i = 0 to 23
            $listInfoDeploy[$i][0] = String($DeDeployType[$i])
            $listInfoDeploy[$i][1] = $nbSides
                $waveCount = 0
            $waveNumber = 0
            for $j = 0 to 23
               If string($DeDeployType[$i])=string($DeDeployType[$j]) Then
                  $waveCount = $waveCount + 1
                  If $j<=$i Then
                     $waveNumber = $waveNumber +1
                  EndIf
               EndIf
            Next
            $listInfoDeploy[$i][2] = $waveNumber
            $listInfoDeploy[$i][3] = $waveCount
            $listInfoDeploy[$i][4] = $DeDeployPosition[$i]
        Next
	ElseIf $nbSides = 5 Then
		If $debugSetlog = 1 Then SetLog("List Deploy for Four Fingger attack", $COLOR_PURPLE)
		Local $listInfoDeploy[11][5] = [[$eGiant, $nbSides, 1, 1, 2] _
			    , [$eBarb, $nbSides, 1, 1, 0] _
			    , [$eWall, $nbSides, 1, 1, 2] _
			    , [$eArch, $nbSides, 1, 1, 0] _
			    , [$eGobl, $nbSides, 1, 2, 0] _
			    , ["CC", 1, 1, 1, 1] _
			    , [$eHogs, $nbSides, 1, 1, 1] _
			    , [$eWiza, $nbSides, 1, 1, 0] _
			    , [$eMini, $nbSides, 1, 1, 0] _
			    , [$eGobl, $nbSides, 2, 2, 0] _
			    , ["HEROES", 1, 2, 1, 1] _
			    ]
	Else
		If $debugSetlog = 1 Then SetLog("listdeploy standard for attack", $COLOR_PURPLE)
		Local $listInfoDeploy[13][5] = [[$eGiant, $nbSides, 1, 1, 2] _
				, [$eBarb, $nbSides, 1, 2, 0] _
				, [$eWall, $nbSides, 1, 1, 1] _
				, [$eArch, $nbSides, 1, 2, 0] _
				, [$eBarb, $nbSides, 2, 2, 0] _
				, [$eGobl, $nbSides, 1, 2, 0] _
				, ["CC", 1, 1, 1, 1] _
				, [$eHogs, $nbSides, 1, 1, 1] _
				, [$eWiza, $nbSides, 1, 1, 0] _
				, [$eMini, $nbSides, 1, 1, 0] _
				, [$eArch, $nbSides, 2, 2, 0] _
				, [$eGobl, $nbSides, 2, 2, 0] _
				, ["HEROES", 1, 2, 1, 1] _
				]
	EndIf

	$isCCDropped = False
	$DeployCCPosition[0] = -1
	$DeployCCPosition[1] = -1
	$isHeroesDropped = False
	$DeployHeroesPosition[0] = -1
	$DeployHeroesPosition[1] = -1

	LaunchTroop2($listInfoDeploy, $CC, $King, $Queen, $Warden)


	If _Sleep($iDelayalgorithm_AllTroops4) Then Return
			SetLog("Dropping left over troops", $COLOR_BLUE)
			For $x = 0 To 1
				PrepareAttack($DB, True)
				For $i = $eBarb To $eLava
					LauchTroop($i, $nbSides, 0, 1)
					CheckHeroesHealth()
					If _Sleep($iDelayalgorithm_AllTroops5) Then Return
				Next
			Next
	;Activate KQ's power
	If ($checkKPower Or $checkQPower) And $iActivateKQCondition = "Manual" Then
		SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating Hero abilities", $COLOR_BLUE)
		If _Sleep($delayActivateKQ) Then Return
		If $checkKPower Then
			SetLog("Activating King's power", $COLOR_BLUE)
			SelectDropTroop($King)
			$checkKPower = False
		EndIf
		If $checkQPower Then
			SetLog("Activating Queen's power", $COLOR_BLUE)
			SelectDropTroop($Queen)
			$checkQPower = False
		EndIf
	EndIf
	SetLog("Finished Attacking, waiting for the battle to end")
EndFunc

Func Algorithm_FourFingger()
	Global $countFindPixCloser = 0
	Global $countCollectorexposed = 0
	$nbSides = 5
	$iChkDeploySettings[$DB] = 4
	$iChkRedArea[$DB] = 1
	$iChkSmartAttack[$DB][0] = 1
	$iChkSmartAttack[$DB][1] = 1
	$ichkDBRandomSpeedAtk = 1
	CheckDebug()
	If $debugSetlog = 1 Then Setlog("Algorithm_FourFingger", $COLOR_PURPLE)
	SetSlotSpecialTroops()

	If _Sleep($iDelayalgorithm_AllTroops1) Then Return

		Local $hTimer = TimerInit()
		_WinAPI_DeleteObject($hBitmapFirst)
		$hBitmapFirst = _CaptureRegion2()
		_GetRedArea()

			SetLog("Locating Mines & Collectors", $COLOR_BLUE)
			$hTimer = TimerInit()
			Global $PixelMine[0]
			Global $PixelElixir[0]
			Global $PixelDarkElixir[0]
			Global $PixelNearCollector[0]
			Global $PixelNearCollectorx[0]
			Global $PixelElixirTrue[0]
			Global $SideTopLeft = 0
			Global $SideBottomLeft = 0
			Global $SideTopRight = 0
			Global $SideBottomRight = 0
			Local $PixelMinex = 0

				$PixelMine = GetLocationMine()
				If (IsArray($PixelMine)) Then
					For $i = 0 To UBound($PixelMine) - 1
						$PixelElixircheck = $PixelMine[$i]
						If isInsideDiamond($PixelElixircheck) Then
							$PixelMinex +=1
							ReDim $PixelElixirTrue[$PixelMinex]
							$PixelElixirTrue[$PixelMinex - 1] = $PixelElixircheck
						EndIf
					Next
					For $i = 0 To UBound($PixelElixirTrue) - 1
						$pixel = $PixelElixirTrue[$i]
						If isInsideDiamond($pixel) Then
							If $pixel[0] <= $InternalArea[2][0] Then
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopLeft += 1
								Else
									$SideBottomLeft += 1
								EndIf
							Else
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopRight += 1
								Else
									$SideBottomRight += 1
								EndIf
							EndIf
						EndIf
					Next
					_ArrayAdd($PixelNearCollector, $PixelElixirTrue)
					_ArrayAdd($PixelNearCollectorx, $PixelElixirTrue)
				EndIf

				$PixelElixir = GetLocationElixir()
				If (IsArray($PixelElixir)) Then
					If isInsideDiamond($PixelElixir) Then
						_ArrayAdd($PixelNearCollector, $PixelElixir)
					EndIf
					For $i = 0 To UBound($PixelElixir) - 1
						$pixel = $PixelElixir[$i]
						If isInsideDiamond($pixel) Then
							If $pixel[0] <= $InternalArea[2][0] Then
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopLeft += 1
								Else
									$SideBottomLeft += 1
								EndIf
							Else
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopRight += 1
								Else
									$SideBottomRight += 1
								EndIf
							EndIf
						EndIf
					Next
				EndIf
#cs
				$PixelDarkElixir = GetLocationDarkElixir()
				CleanRedArea($PixelDarkElixir)
				If (IsArray($PixelDarkElixir)) Then
					For $i = 0 To UBound($PixelDarkElixir) - 1
						$pixel = $PixelDarkElixir[$i]
						If isInsideDiamond($pixel) Then
							If $pixel[0] <= $InternalArea[2][0] Then
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopLeft += 1
								Else
									$SideBottomLeft += 1
								EndIf
							Else
								If $pixel[1] <= $InternalArea[0][1] Then
									$SideTopRight += 1
								Else
									$SideBottomRight += 1
								EndIf
							EndIf
						EndIf
					Next
				EndIf
#ce
;~				$PixelDarkElixir = GetLocationDarkElixir()
;~				If (IsArray($PixelDarkElixir)) Then
;~					If isInsideDiamond($PixelDarkElixir) Then
;~						_ArrayAdd($PixelNearCollector, $PixelDarkElixir)
;~					EndIf
;~				EndIf

			SetLog("Located  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")
			SetLog("[" & UBound($PixelNearCollectorx) & "] Gold Mines")
			SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")
			$iNbrOfDetectedMines[$iMatchMode] += UBound($PixelElixirTrue)
			$iNbrOfDetectedCollectors[$iMatchMode] += UBound($PixelElixir)
			UpdateStats()

	SetLog("Attacking four finger fight style", $COLOR_BLUE)
	If $debugSetlog = 1 Then SetLog("List Deploy for Four Fingger attack", $COLOR_PURPLE)
		Local $listInfoDeploy[11][5] = [[$eGiant, $nbSides, 1, 1, 2] _
			    , [$eBarb, $nbSides, 1, 1, 0] _
			    , [$eWall, $nbSides, 1, 1, 2] _
			    , [$eArch, $nbSides, 1, 1, 0] _
			    , [$eGobl, $nbSides, 1, 2, 0] _
			    , ["CC", 1, 1, 1, 1] _
			    , [$eHogs, $nbSides, 1, 1, 1] _
			    , [$eWiza, $nbSides, 1, 1, 0] _
			    , [$eMini, $nbSides, 1, 1, 0] _
			    , [$eGobl, $nbSides, 2, 2, 0] _
			    , ["HEROES", 1, 2, 1, 1] _
			    ]

	$isCCDropped = False
	$DeployCCPosition[0] = -1
	$DeployCCPosition[1] = -1
	$isHeroesDropped = False
	$DeployHeroesPosition[0] = -1
	$DeployHeroesPosition[1] = -1

	LaunchTroop2($listInfoDeploy, $CC, $King, $Queen, $Warden)


	If _Sleep($iDelayalgorithm_AllTroops4) Then Return
			SetLog("Dropping left over troops", $COLOR_BLUE)
			For $x = 0 To 1
				PrepareAttack($DB, True)
				For $i = $eBarb To $eLava
					LauchTroop($i, $nbSides, 0, 1)
					CheckHeroesHealth()
					If _Sleep($iDelayalgorithm_AllTroops5) Then Return
				Next
			Next
	;Activate KQ's power
	If ($checkKPower Or $checkQPower) And $iActivateKQCondition = "Manual" Then
		SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating Hero abilities", $COLOR_BLUE)
		If _Sleep($delayActivateKQ) Then Return
		If $checkKPower Then
			SetLog("Activating King's power", $COLOR_BLUE)
			SelectDropTroop($King)
			$checkKPower = False
		EndIf
		If $checkQPower Then
			SetLog("Activating Queen's power", $COLOR_BLUE)
			SelectDropTroop($Queen)
			$checkQPower = False
		EndIf
	EndIf

	DisableDebug()
	SetLog("Finished Attacking, waiting for the battle to end")

EndFunc

Func CheckDebug()
	If FileExists(@ScriptDir & "\LakerengDebug.txt") Then
		$debugSearchArea = 1
		$debugRedArea = 1
		$debugSetlog = 1
		$debugImageSave = 1
		$debugBuildingPos = 1
	EndIf
EndFunc

Func DisableDebug()
	If FileExists(@ScriptDir & "\LakerengDebug.txt") Then
		$debugSearchArea = 0
		$debugRedArea = 0
		$debugSetlog = 0
		$debugImageSave = 0
		$debugBuildingPos = 0
	EndIf
EndFunc