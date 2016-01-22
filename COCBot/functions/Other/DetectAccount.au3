; #FUNCTION# ====================================================================================================================
; Name ..........: Detect Account
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

 Func DetectAccount()

checkMainScreen()
	While 1
		ZoomOut()
	ExitLoop
	WEnd
	Sleep (2000)

_CaptureRegion(0, 0, 200, 18)

Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 0, 0,  200, 18)
Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
if  Not FileExists(@ScriptDir & "\images\main.bmp") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\main.bmp")
Elseif  Not FileExists(@ScriptDir & "\images\Second.bmp") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Second.bmp")
EndIf

if FileExists(@ScriptDir & "\images\temp.bmp") Then
   FileDelete((@ScriptDir & "\images\temp.bmp"))
EndIf

	  _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\temp.bmp")
	  _GDIPlus_ImageDispose($hBitmap)

$bm1 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\main.bmp")
$bm3 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Second.bmp")
$bm2 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\temp.bmp")

   If CompareBitmaps($bm1, $bm2) Then
	  SetLog("Main account Detected...", $COLOR_GREEN)
	  _GUICtrlComboBox_SetCurSel($cmbProfile, 0)
	  cmbProfile()
   ElseIf CompareBitmaps($bm3, $bm2) Then
	  _GUICtrlComboBox_SetCurSel($cmbProfile, 1)
	  cmbProfile()
   Else
	  SetLog("Temprory account Detected...", $COLOR_Gray)
   EndIf

_GDIPlus_ImageDispose($bm1)
_GDIPlus_ImageDispose($bm2)
_GDIPlus_ImageDispose($bm3)



EndFunc



Func CompareBitmaps($bm1, $bm2)
    $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    $Stride = DllStructGetData($BitmapData1, "Stride")
    $Scan0 = DllStructGetData($BitmapData1, "Scan0")
    $ptr1 = $Scan0
    $size1 = ($Bm1H - 1) * $Stride + ($Bm1W - 1) * 4
    $Bm2W = _GDIPlus_ImageGetWidth($bm2)
    $Bm2H = _GDIPlus_ImageGetHeight($bm2)
    $BitmapData2 = _GDIPlus_BitmapLockBits($bm2, 0, 0, $Bm2W, $Bm2H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    $Stride = DllStructGetData($BitmapData2, "Stride")
    $Scan0 = DllStructGetData($BitmapData2, "Scan0")
    $ptr2 = $Scan0
    $size2 = ($Bm2H - 1) * $Stride + ($Bm2W - 1) * 4
    $smallest = $size1
    If $size2 < $smallest Then $smallest = $size2
    $call = DllCall("msvcrt.dll", "int:cdecl", "memcmp", "ptr", $ptr1, "ptr", $ptr2, "int", $smallest)
    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)
    _GDIPlus_BitmapUnlockBits($bm2, $BitmapData2)

    Return ($call[0]=0)
EndFunc