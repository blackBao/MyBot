; #FUNCTION# ====================================================================================================================
; Name ..........: Switch Account And Donate
; Description ...:
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

Func SwitchDonate()
		;..............Switch Account & Donate Then Switch Back...................
		 If $ichkSwitchDonate = 1 Then
			SetLog("Switching account For Donate", $COLOR_blue)
			DetectAccount()
		If $iVillageName = "Main" Then

			SwitchSecond()
			$RunState = True
         While 1
			Collect()
		 Train()
         DonateCC()
			RequestCC()
			ExitLoop
			WEnd
			SwitchMain()
		ElseIf $iVillageName = "Second" Then
			SwitchMain()
			$RunState = True
         While 1
		 Train()
         DonateCC()
			RequestCC()
			ExitLoop
			WEnd
			SwitchSecond()
			EndIf
		If _Sleep(1000) Then Return
		EndIf

  EndFunc
