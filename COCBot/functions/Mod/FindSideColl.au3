; #FUNCTION# ====================================================================================================================
; Name ..........: FindSideColl
; Description ...: Choise Side with many Collector
; Syntax ........:
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
Func FindSideColl()
#comments-start
Local $InternalArea[8][3] = [[73, 336, "LEFT"], _
		[783, 336, "RIGHT"], _
		[432, 68, "TOP"], _
		[432, 603, "BOTTOM"], _
		[73 + (432 - 73) / 2, 68 + (336 - 68) / 2, "TOP-LEFT"], _
		[432 + (783 - 432) / 2, 68 + (336 - 68) / 2, "TOP-RIGHT"], _
		[73 + (432 - 73) / 2, 336 + (603 - 336) / 2, "BOTTOM-LEFT"], _
		[432 + (783 - 432) / 2, 336 + (603 - 336) / 2, "BOTTOM-RIGHT"] _
		]

	Local $hTimer = TimerInit()
		_WinAPI_DeleteObject($hBitmapFirst)
		$hBitmapFirst = _CaptureRegion2()
		_GetRedArea()

	;reset variables
	Global $PixelMine[0]
	Global $PixelElixir[0]
	Global $PixelDarkElixir[0]
	Local $SideTopLeft = 0
	Local $SideBottomLeft = 0
	Local $SideTopRight = 0
	Local $SideBottomRight = 0

	If $iChkSmartDB < 1 Then
		$PixelMine = GetLocationMine()
		CleanRedArea($PixelMine)
		If (IsArray($PixelMine)) Then
			For $i = 0 To UBound($PixelMine) - 1
				$pixel = $PixelMine[$i]
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
		$PixelElixir = GetLocationElixir()
		CleanRedArea($PixelElixir)
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
	EndIf
#comments-end
	If $SideTopLeft > $SideBottomLeft And $SideTopRight And $SideBottomRight Then
		SetLog($SideTopLeft & " Collector To Side Top Left... Attacking Top Left", $COLOR_BLUE)
		$BuildingEdge = 1
	ElseIf $SideBottomLeft > $SideTopRight And $SideBottomRight And $SideTopLeft Then
		SetLog($SideBottomLeft & " Collector To Side Bottom Left... Attacking Bottom Left", $COLOR_BLUE)
		$BuildingEdge = 2
	ElseIf $SideTopRight > $SideBottomLeft And $SideBottomRight And $SideTopLeft Then
		SetLog($SideTopRight & " Collector To Side Top Right ... Attacking Top Right", $COLOR_BLUE)
		$BuildingEdge = 3
	ElseIf $SideBottomRight > $SideBottomLeft And $SideTopRight And $SideTopLeft Then
		SetLog($SideBottomRight & " Collector To Side Bottom Right... Attacking Bottom Right", $COLOR_BLUE)
		$BuildingEdge = 0
	Else
		SetLog("Random Side ... Attacking Random Side", $COLOR_BLUE)
		$BuildingEdge = (Random(Round(0, 3)))
		$BuildingLoc = 0
	EndIf

EndFunc

Func isResourceDiamond($aCoords)
	Local $Left = 65, $Right = 782, $Top = 75, $Bottom = 605 ; set the diamond shape 860x780
	Local $aDiamond[2][2] = [[$Left, $Top], [$Right, $Bottom]]
	Local $aMiddle = [($aDiamond[0][0] + $aDiamond[1][0]) / 2, ($aDiamond[0][1] + $aDiamond[1][1]) / 2]
	Local $aSize = [$aMiddle[0] - $aDiamond[0][0], $aMiddle[1] - $aDiamond[0][1]]

	Local $DX = Abs($aCoords[0] - $aMiddle[0])
	Local $DY = Abs($aCoords[1] - $aMiddle[1])

	If ($DX / $aSize[0] + $DY / $aSize[1] <= 1) Then
 		If $aCoords[0] < 68 Then ; coordinates where the game will click on the CHAT tab (safe margin)
 			If $debugSetlog = 1 Then Setlog("Coordinate Inside Village, but Exclude CHAT", $COLOR_PURPLE)
 			Return False
 		ElseIf $aCoords[0] < 412 And $aCoords[1] < 59 Then ; coordinates where the game will click on the BUILDER button (safe margin)
 			If $debugSetlog = 1 Then Setlog("Coordinate Inside Village, but Exclude BUILDER", $COLOR_PURPLE)
 			Return False
 		ElseIf $aCoords[0] > 692 And $aCoords[1] < 210 Then ; coordinates where the game will click on the GEMS button (safe margin)
 			If $debugSetlog = 1 Then Setlog("Coordinate Inside Village, but Exclude GEMS", $COLOR_PURPLE)
 			Return False
 		EndIf
		If $debugSetlog = 1 Then Setlog("Coordinate Inside Village", $COLOR_PURPLE)
		Return True ; Inside Village
	Else
		If $debugSetlog = 1 Then Setlog("Coordinate Outside Village", $COLOR_PURPLE)
		Return False ; Outside Village
	EndIf

EndFunc   ;==>isResourceDiamond