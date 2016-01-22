; #FUNCTION# ====================================================================================================================
; Name ..........: Switch Account
; Description ...: Switch To 1st And 2nd Account
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........:
; Modified ......: Lakereng (2016) And Extreme DE Side MOD
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;;;;;;;##### Main Account #####;;;;;;;
Func SwitchMain()
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectMain()
	LoadMain()

	While 1
		waitMainScreen()
		ExitLoop
	WEnd

	$RunState = True
	FileDelete((@ScriptDir & "\images\Main.bmp"))
	DetectAccount()
	$fullArmy = False
EndFunc   ;==>SwitchMain

Func SelectMain()
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect

	While 1
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)

		If IsArray($Message) Then
			SetLog("Main account selected", $COLOR_blue)
			Click($Message[0], $Message[1] + 63 + $midOffsetY) ;Select Main account
			Sleep(2000)
			CheckOK()
			ExitLoop
		EndIf
	WEnd
EndFunc   ;==>SelectMain

Func LoadMain() ;Load Main Account
	Local $iLoopCount = 0

	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Main account", $COLOR_blue)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectMain()
			LoadMain()
			ExitLoop
		EndIf
	WEnd
EndFunc   ;==>LoadMain

;;;;;;;##### Second Account#####;;;;;;;
Func SwitchSecond()
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectSecond()

	LoadSecond()

	While 1
		waitMainScreen()
		ExitLoop
	WEnd
	$RunState = True
	FileDelete((@ScriptDir & "\images\Second.bmp"))
	DetectAccount()
EndFunc   ;==>SwitchSecond



Func SelectSecond()
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect

	While 1
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			SetLog("Second Account Selected", $COLOR_blue)
			Sleep(1000)
			Click($Message[0], $Message[1] + 112 + $midOffsetY) ;Select Second account
			Sleep(2000)
			CheckOK()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>SelectSecond


Func LoadSecond() ; Load Second Account
	Local $iLoopCount = 0

	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Second account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				Click(521, 198) ;Click Confirm
				Sleep(1500)
				Click(339, 215) ;Click Confirm txtbox
				SetLog("Insert CONFIRM To Text Box ", $COLOR_blue)
				Sleep(1500)
				ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}") ;Enter  Confirm  txt
				Sleep(2000)
				Click(521, 198) ;Click Confirm
			Else
				Click(521, 198) ;Click Confirm
			EndIf
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 1500 Then
			SelectSecond()
			LoadSecond()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadSecond



Func CheckOK()

	Local $OkX, $OkY
	$Ok = @ScriptDir & "\images\Ok.png"
	If Not FileExists($Ok) Then Return False
	$OkLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $OkTol = 0 To 20
		If $OkLoc = 0 Then
			$OkX = 0
			$OkY = 0
			$OkLoc = _ImageSearch($Ok, 1, $OkX, $OkY, $OkTol)
			If $OkLoc = 1 And isInsideDiamondXY($OkX, $OkY) Then
				SetLog("Found Ok Button ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Ok Button found (" & $OkX & "," & $OkY & ") tolerance:" & $OkTol, $COLOR_PURPLE)
				Click($OkX, $OkY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find OK Button", $COLOR_PURPLE)
	If _Sleep(500) Then Return
	checkMainScreen(False) ; check for screen errors while function was running

EndFunc   ;==>CheckOK Button
