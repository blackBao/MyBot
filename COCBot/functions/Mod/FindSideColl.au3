; #FUNCTION# ====================================================================================================================
; Name ..........: FindSideColl
; Description ...: Choose Side with Collector And Mine
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Lakereng(2016)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func FindSideColl()
	Local $TL = $SideTopLeft
	Local $TR = $SideTopRight
	Local $BL = $SideBottomLeft
	Local $BR = $SideBottomRight

	If (($TL = $BL) And ($TL = ($TR Or $BR)) And (($BR OR $TR) < 3)) Or (($TR = $BR) And ($TR = ($TL Or $BL)) And (($TL Or $BL) < 3)) Then
		SetLog($BL & " Collector To Side Bottom Left", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right", $COLOR_PURPLE)
		SetLog($TL & " Collector To Side Top Left", $COLOR_PURPLE)
		SetLog("Attacking Use FourFingger", $COLOR_BLUE)
		If ($iChkRedArea[$iMatchMode]) Then
			$nbSides = 4
		Else
			$nbSides = 5
		EndIf
	ElseIf (($TL < 3) And (($TR < 3) Or ($BL < 3) Or ($BR < 3))) Or (($TR < 3) And (($TL < 3) Or ($BL < 3) Or ($BR < 3))) Or (($BR < 3) And (($TL < 3) Or ($BL < 3) Or ($TR < 3))) Or (($BL < 3) And (($TL < 3) Or ($TR < 3) Or ($BR < 3))) Then
		SetLog($BL & " Collector To Side Bottom Left", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right", $COLOR_PURPLE)
		SetLog($TL & " Collector To Side Top Left", $COLOR_PURPLE)
		SetLog("Attacking Use TWO Side", $COLOR_BLUE)
		$nbSides = 2
		If ($BL > $TL) And ($BL > $TR) And ($BL > $BR) Then
			$BuildingEdge = 2
			$BuildingEdge2 = 3
		ElseIf ($TR > $TL) And ($TR > $BL) And ($TR > $BR) Then
			$BuildingEdge = 3
			$BuildingEdge2 = 2
		ElseIf ($BR > $TL) And ($BR > $BL) And ($BR > $TR) Then
			$BuildingEdge = 0
			$BuildingEdge2 = 1
		Else
			$BuildingEdge = 1
			$BuildingEdge2 = 0
		EndIf
	ElseIf ($TL > $BL) And ($TL > $TR) And ($TL > $BR) Then
		SetLog($BL & " Collector To Side Bottom Left", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right", $COLOR_PURPLE)
		SetLog($TL & " Collector To Side Top Left... Attacking Top Left", $COLOR_BLUE)
		$BuildingEdge = 1
		$nbSides = 1
	ElseIf ($BL > $TR) And ($BL > $BR) And ($BL > $TL) Then
		SetLog($TL & " Collector To Side Top Left", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right", $COLOR_PURPLE)
		SetLog($BL & " Collector To Side Bottom Left... Attacking Bottom Left", $COLOR_BLUE)
		$BuildingEdge = 2
		$nbSides = 1
	ElseIf ($TR > $BL) And ($TR > $BR) And ($TR > $TL) Then
		SetLog($TL & " Collector To Side Top Left", $COLOR_PURPLE)
		SetLog($BL & " Collector To Side Bottom Left", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right ... Attacking Top Right", $COLOR_BLUE)
		$BuildingEdge = 3
		$nbSides = 1
	ElseIf ($BR > $BL) And ($BR > $TR) And ($BR > $TL) Then
		SetLog($TL & " Collector To Side Top Left", $COLOR_PURPLE)
		SetLog($BL & " Collector To Side Bottom Left", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right... Attacking Bottom Right", $COLOR_BLUE)
		$BuildingEdge = 0
		$nbSides = 1
	Else
		SetLog($TL & " Collector To Side Top Left", $COLOR_PURPLE)
		SetLog($BL & " Collector To Side Bottom Left", $COLOR_PURPLE)
		SetLog($TR & " Collector To Side Top Right", $COLOR_PURPLE)
		SetLog($BR & " Collector To Side Bottom Right", $COLOR_PURPLE)
		SetLog("Not Found Side.. force Four Side attack", $COLOR_BLUE)
		$BuildingEdge = (Random(Round(0, 3), 1))
		$BuildingLoc = 0
		If ($iChkRedArea[$iMatchMode]) Then
			$nbSides = 4
		Else
			$nbSides = 5
		EndIf
	EndIf

EndFunc   ;==>FindSideColl
