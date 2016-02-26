; #FUNCTION# ====================================================================================================================
; Name ..........: TEst Smart Dead Base
; Description ...:
; Syntax ........: TestSmartDeadBase()
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
Func TestSmartDeadBase()
	Global $countFindPixCloser = 0
	Global $countCollectorexposed = 0
	$nbSides = 5
	Local $hTimer = TimerInit()
		_WinAPI_DeleteObject($hBitmapFirst)
		$hBitmapFirst = _CaptureRegion2()
		_GetRedArea()

			SetLog("Locating Mines, Collectors & Drills", $COLOR_BLUE)
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

			SetLog("Located  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")
			SetLog("[" & UBound($PixelNearCollectorx) & "] Gold Mines")
			SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")
			SetLog("Attacking four finger fight style", $COLOR_BLUE)

		 SetLog("List Deploy for Test Smart Dead Base", $COLOR_PURPLE)
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

		ReadResource($listInfoDeploy, $CC, $King, $Queen, $Warden)

EndFunc

Func ReadResource($listInfoDeploy, $CC, $King, $Queen, $Warden)
	Local $listListInfoDeployTroopPixel[0]
	Local $pixelRandomDrop[2]
	Local $pixelRandomDropcc[2]
	Global $countFindPixCloser = 0
	Global $countCollectorexposed = 0

		For $i = 0 To UBound($listInfoDeploy) - 1
			Local $troop = -1
			Local $troopNb = 0
			Local $name = ""
			$troopKind = $listInfoDeploy[$i][0]
			$nbSides = $listInfoDeploy[$i][1]
			$waveNb = $listInfoDeploy[$i][2]
			$maxWaveNb = $listInfoDeploy[$i][3]
			$slotsPerEdge = $listInfoDeploy[$i][4]
			If $debugSetlog = 1 Then SetLog("**ListInfoDeploy row " & $i & ": USE " & $troopKind & " SIDES " & $nbSides & " WAVE " & $waveNb & " XWAVE " & $maxWaveNb & " SLOTXEDGE " & $slotsPerEdge, $COLOR_PURPLE)
			If (IsNumber($troopKind)) Then
				For $j = 0 To UBound($atkTroops) - 1 ; identify the position of this kind of troop
					If $atkTroops[$j][0] = $troopKind Then
						$troop = $j
						$troopNb = Ceiling($atkTroops[$j][1] / $maxWaveNb)
						Local $plural = 0
						If $troopNb > 1 Then $plural = 1
						$name = NameOfTroop($troopKind, $plural)
					EndIf
				Next
			EndIf
			If ($troop <> -1 And $troopNb > 0) Or IsString($troopKind) Then
				Local $listInfoDeployTroopPixel
				If (UBound($listListInfoDeployTroopPixel) < $waveNb) Then
					ReDim $listListInfoDeployTroopPixel[$waveNb]
					Local $newListInfoDeployTroopPixel[0]
					$listListInfoDeployTroopPixel[$waveNb - 1] = $newListInfoDeployTroopPixel
				EndIf
				$listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$waveNb - 1]

				ReDim $listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) + 1]
				If (IsString($troopKind)) Then
					Local $arrCCorHeroes[1] = [$troopKind]
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $arrCCorHeroes
				Else
					Local $infoDropTroop = DropTroop2($troop, $nbSides, $troopNb, $slotsPerEdge, $name)
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $infoDropTroop
				EndIf
				$listListInfoDeployTroopPixel[$waveNb - 1] = $listInfoDeployTroopPixel
			EndIf
		Next
	Setlog("There are " & $countCollectorexposed & " collector(s) near RED LINE of " & Ubound($PixelNearCollector) & " collectors")
	If _Sleep(1000) Then Return
	If ($countCollectorexposed/Ubound($PixelNearCollector)*100) <= $SmartCollectors Then
		Setlog("you setting of Collector " & $SmartCollectors & "%  And near RED LINE " & ($countCollectorexposed/Ubound($PixelNearCollector)*100) & "%",  $COLOR_RED )
		If _Sleep(500) Then Return
		SetLog("Change Side Attack to Collector side attack!...", $COLOR_BLUE)
	EndIf
EndFunc
