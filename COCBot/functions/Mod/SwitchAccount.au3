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
Global $iSwCount, $iconfirm
Func SwitchMain()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectMain()
		waitMainScreen()

	$RunState = True
	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Main.bmp"))
	EndIf
	$fullArmy = False
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Main account", $COLOR_blue)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
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
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf
	WEnd
EndFunc   ;==>SwitchMain

Func SelectMain()
	Local $iLoopCount = 0
	Local $iSwCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1
	While 1
		Sleep(1000)

		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			CheckMain() ;Select Main account
			Sleep(2000)
			CheckOK()
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 2000 Then
			SelectMain()
			ExitLoop
		EndIf
	WEnd

	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	Else
	    LoadMain()
	EndIf

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
				$iConfirm = 1
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
			ExitLoop
		EndIf
	WEnd
EndFunc   ;==>LoadMain

;;;;;;;##### Second Account#####;;;;;;;
Func SwitchSecond()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectSecond()
		waitMainScreen()

	$RunState = True
	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Second.bmp"))
	EndIf
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
				$iConfirm = 1
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
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf

	WEnd
EndFunc   ;==>SwitchSecond

Func SelectSecond()
	Local $iLoopCount = 0
	Local $iSwCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1
	While 1
	Sleep(10000)
	SetLog("Please wait account select", $COLOR_GREEN)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			CheckSecond()
			Sleep(2000)
			CheckOK()
			ExitLoop
		EndIf
		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 5000 Then
			SelectSecond()
			ExitLoop
		EndIf
	WEnd
	Sleep (500)
	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	Else
	    LoadSecond()
	EndIf

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
				$iConfirm = 1
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
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadSecond

;;;;;;;##### Tree Account#####;;;;;;;
Func SwitchTree()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectTree()
		waitMainScreen()

	$RunState = True
	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Tree.bmp"))
	EndIf
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Tree account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
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
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf

	WEnd
EndFunc   ;==>SwitchTree

Func SelectTree()
	Local $iLoopCount = 0
	Local $iSwCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1
	While 1
	Sleep(10000)
	SetLog("Please wait account select", $COLOR_GREEN)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			CheckTree()
			Sleep(2000)
			CheckOK()
			ExitLoop
		EndIf
		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 5000 Then
			SelectTree()
			ExitLoop
		EndIf
	WEnd
	Sleep (500)
	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	Else
	    LoadTree()
	EndIf

EndFunc   ;==>SelectTree


Func LoadTree() ; Load Tree Account
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Tree account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
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
			SelectTree()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadTree

;;;;;;;##### Four Account#####;;;;;;;
Func SwitchFour()
	$iConfirm = 0
	waitMainScreen()
	Send("{CapsLock off}")
	Click(830, 590) ;Click Switch
	Sleep(1000)

	SelectFour()
		waitMainScreen()

	$RunState = True
	If $iConfirm = 1 Then
		FileDelete((@ScriptDir & "\images\Multyfarming\Four.bmp"))
	EndIf
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Four account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
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
		If $iLoopCount > 1000 Then
			ExitLoop
		EndIf

	WEnd
EndFunc   ;==>SwitchFour

Func SelectFour()
	Local $iLoopCount = 0
	Local $iSwCount = 0
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	$iSwCount += 1
	While 1
	Sleep(10000)
	SetLog("Please wait account select", $COLOR_GREEN)
		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			CheckFour()
			Sleep(2000)
			CheckOK()
			ExitLoop
		EndIf
		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 5000 Then
			SelectFour()
			ExitLoop
		EndIf
	WEnd
	Sleep (500)
	If $iSwCount > 5 Then
		SetLog(" Exit Now ...Cancel change account")
		Click(437, 399 + $midOffsetY) ;Click  Disconn
		ClickP($aAway, 2, $iDelayTrain5, "#0291")
	ElseIf IsMainPage() Then
		Setlog("Change account cancel")
		Return True
	Else
	    LoadFour()
	EndIf

EndFunc   ;==>SelectFour

Func LoadFour() ; Load Four Account
	Local $iLoopCount = 0
	While 1
		Local $Message = _PixelSearch(487, 387, 492, 391, Hex(0xE8E8E0, 6), 0);load pixel
		If IsArray($Message) Then
			SetLog("Load Four account", $COLOR_blue)
			Sleep(1500)
			Click(512, 433) ;Click Load Button
			Sleep(1000)

			Local $Message = _PixelSearch(470, 249 + $midOffsetY, 478, 255 + $midOffsetY, Hex(0xE8E8E0, 6), 0)
			If IsArray($Message) Then
				$iConfirm = 1
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
			SelectFour()
			ExitLoop
		EndIf

	WEnd

EndFunc   ;==>LoadFour

Func CheckOK()

	Local $OkX, $OkY
	$Ok = @ScriptDir & "\images\Multyfarming\Ok.bmp"
	If Not FileExists($Ok) Then Return False
	$OkLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $OkTol = 0 To 20
		If $OkLoc = 0 Then
			$OkX = 0
			$OkY = 0
			$OkLoc = _ImageSearch($Ok, 1, $OkX, $OkY, $OkTol)
			If $OkLoc = 1 Then
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
EndFunc   ;==>CheckOK Button

Func CheckMain()

	Local $AccmainX, $AccmainY
	$Accmain = @ScriptDir & "\images\Multyfarming\Accmain.bmp"
	If Not FileExists($Accmain) Then Return False
	$AccmainLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccmainTol = 0 To 20
		If $AccmainLoc = 0 Then
			$AccmainX = 0
			$AccmainY = 0
			$AccmainLoc = _ImageSearch($Accmain, 1, $AccmainX, $AccmainY, $AccmainTol)
			If $AccmainLoc = 1 Then
				SetLog("Found Main Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Main Account found (" & $AccmainX & "," & $AccmainY & ") tolerance:" & $AccmainTol, $COLOR_PURPLE)
				Click($AccmainX, $AccmainY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Main Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckMain

Func CheckSecond()

	Local $AccSecondX, $AccSecondY
	$AccSecond = @ScriptDir & "\images\Multyfarming\AccSecond.bmp"
	If Not FileExists($AccSecond) Then Return False
	$AccSecondLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccSecondTol = 0 To 20
		If $AccSecondLoc = 0 Then
			$AccSecondX = 0
			$AccSecondY = 0
			$AccSecondLoc = _ImageSearch($AccSecond, 1, $AccSecondX, $AccSecondY, $AccSecondTol)
			If $AccSecondLoc = 1 Then
				SetLog("Found Second Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Second Account found (" & $AccSecondX & "," & $AccSecondY & ") tolerance:" & $AccSecondTol, $COLOR_PURPLE)
				Click($AccSecondX, $AccSecondY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Second Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckSecond

Func CheckTree()

	Local $AccTreeX, $AccTreeY
	$AccTree = @ScriptDir & "\images\Multyfarming\AccTree.bmp"
	If Not FileExists($AccTree) Then Return False
	$AccTreeLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccTreeTol = 0 To 20
		If $AccTreeLoc = 0 Then
			$AccTreeX = 0
			$AccTreeY = 0
			$AccTreeLoc = _ImageSearch($AccTree, 1, $AccTreeX, $AccTreeY, $AccTreeTol)
			If $AccTreeLoc = 1 Then
				SetLog("Found Tree Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Tree Account found (" & $AccTreeX & "," & $AccTreeY & ") tolerance:" & $AccTreeTol, $COLOR_PURPLE)
				Click($AccTreeX, $AccTreeY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Tree Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckTree

Func CheckFour()

	Local $AccFourX, $AccFourY
	$AccFour = @ScriptDir & "\images\Multyfarming\AccFour.bmp"
	If Not FileExists($AccFour) Then Return False
	$AccFourLoc = 0
	_CaptureRegion()
	If _Sleep(500) Then Return
	For $AccFourTol = 0 To 20
		If $AccFourLoc = 0 Then
			$AccFourX = 0
			$AccFourY = 0
			$AccFourLoc = _ImageSearch($AccFour, 1, $AccFourX, $AccFourY, $AccFourTol)
			If $AccFourLoc = 1 Then
				SetLog("Found Four Account ", $COLOR_GREEN)
				If $DebugSetLog = 1 Then SetLog("Four Account found (" & $AccFourX & "," & $AccFourY & ") tolerance:" & $AccFourTol, $COLOR_PURPLE)
				Click($AccFourX, $AccFourY,1,0,"#0120")
				If _Sleep(500) Then Return
				Return True
			EndIf
		EndIf
	Next
	If $DebugSetLog = 1 Then SetLog("Cannot find Four Account", $COLOR_PURPLE)
	If _Sleep(500) Then Return
EndFunc   ;==>CheckFour