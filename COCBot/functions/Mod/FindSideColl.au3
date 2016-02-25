; #FUNCTION# ====================================================================================================================
; Name ..........: FindSideColl
; Description ...: Choose Side with Collector And Mine
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

	If $SideTopLeft > $SideBottomLeft And $SideTopRight And $SideBottomRight Then
		If $SideTopLeft = $SideBottomLeft Or $SideTopRight Or $SideBottomRight Then
			If $SideTopLeft = ($SideBottomLeft And $SideTopRight) Or ($SideBottomLeft And $SideBottomRight) Or ($SideTopRight And $SideBottomRight) Then
				$nbSides = 3
				SetLog(" Found 3 Side. have same many Collector....Change attack to 3 side attack ", $COLOR_BLUE)
			Else
				$nbSides = 2
				SetLog(" Found 2 Side. have same many Collector....Change attack to 2 side attack ", $COLOR_BLUE)
			EndIf
		Else
			SetLog($SideTopLeft & " Collector To Side Top Left... Attacking Top Left", $COLOR_BLUE)
			$BuildingEdge = 1
			$nbSides = 1
		EndIf
	ElseIf $SideBottomLeft > $SideTopRight And $SideBottomRight And $SideTopLeft Then
		If $SideBottomLeft = $SideTopRight Or $SideBottomRight Or $SideTopLeft Then
			If $SideBottomLeft = ($SideTopLeft And $SideTopRight) Or ($SideTopLeft And $SideBottomRight) Or ($SideTopRight And $SideBottomRight) Then
				$nbSides = 3
				SetLog(" Found 3 Side. have same many Collector....Change attack to 3 side attack ", $COLOR_BLUE)
			Else
				$nbSides = 2
				SetLog(" Found 2 Side. have same many Collector....Change attack to 2 side attack ", $COLOR_BLUE)
			EndIf
		Else
			SetLog($SideBottomLeft & " Collector To Side Bottom Left... Attacking Bottom Left", $COLOR_BLUE)
			$BuildingEdge = 2
			$nbSides = 1
		EndIf
	ElseIf $SideTopRight > $SideBottomLeft And $SideBottomRight And $SideTopLeft Then
		If $SideTopRight = $SideBottomLeft Or $SideBottomRight Or $SideTopLeft Then
			If $SideTopRight = ($SideTopLeft And $SideBottomLeft) Or ($SideTopLeft And $SideBottomRight) Or ($SideBottomLeft And $SideBottomRight) Then
				$nbSides = 3
				SetLog(" Found 3 Side. have same many Collector....Change attack to 3 side attack ", $COLOR_BLUE)
			Else
				$nbSides = 2
				SetLog(" Found 2 Side. have same many Collector....Change attack to 2 side attack ", $COLOR_BLUE)
			EndIf
		Else
			SetLog($SideTopRight & " Collector To Side Top Right ... Attacking Top Right", $COLOR_BLUE)
			$BuildingEdge = 3
			$nbSides = 1
		EndIf
	ElseIf $SideBottomRight > $SideBottomLeft And $SideTopRight And $SideTopLeft Then
		If $SideBottomRight = $SideBottomLeft Or $SideTopRight Or $SideTopLeft Then
			If $SideBottomRight = ($SideTopLeft And $SideBottomLeft) Or ($SideTopLeft And $SideTopRight) Or ($SideBottomLeft And $SideTopRight) Then
				$nbSides = 3
				SetLog(" Found 3 Side. have same many Collector....Change attack to 3 side attack ", $COLOR_BLUE)
			Else
				$nbSides = 2
				SetLog(" Found 2 Side. have same many Collector....Change attack to 2 side attack ", $COLOR_BLUE)
			EndIf
		Else
			SetLog($SideBottomRight & " Collector To Side Bottom Right... Attacking Bottom Right", $COLOR_BLUE)
			$BuildingEdge = 0
			$nbSides = 1
		EndIf
	Else
		SetLog("Not Found Side.. force Four Fingger", $COLOR_BLUE)
		$BuildingEdge = (Random(Round(0, 3)))
		$BuildingLoc = 0
		$nbSides = 5
	EndIf

EndFunc
Func FindDESideColl()

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
		SetLog("Not Found Side.. force Four Fingger", $COLOR_BLUE)
		$BuildingEdge = (Random(Round(0, 3)))
		$BuildingLoc = 0
	EndIf

EndFunc