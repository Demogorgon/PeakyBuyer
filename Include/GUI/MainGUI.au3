#include-once
#include <GUIConstants.au3>
#include <GuiListBox.au3>
#include <GuiComboBox.au3>
#include <GuiEdit.au3>
#include <Array.au3>
#include <File.au3>
#include <String.au3>

#Region PeakyBuyerMainGUI
Local $GUISize[2] = [470, 295]
Local $GUIPos[2] = [((@DesktopWidth / 2) - ($GUISize[0] / 2)), ((@DesktopHeight / 2) - ($GUISize[1] / 2))] ;Screen Center

_SetTheme("DarkTeal") ;See MetroThemes.au3 for selectable themes or to add more

$PeakyBuyerGUI = _Metro_CreateGUI("PeakyBuyer", $GUISize[0], $GUISize[1], $GUIPos[0], $GUIPos[1], True)

$Control_Buttons = _Metro_AddControlButtons(True, True, True, True, True) ;CloseBtn = True, MaximizeBtn = True, MinimizeBtn = True, FullscreenBtn = True, MenuBtn = True

$GUI_CLOSE_BUTTON = $Control_Buttons[0]
$GUI_MAXIMIZE_BUTTON = $Control_Buttons[1]
$GUI_RESTORE_BUTTON = $Control_Buttons[2]
$GUI_MINIMIZE_BUTTON = $Control_Buttons[3]
$GUI_FULLSCREEN_BUTTON = $Control_Buttons[4]
$GUI_FSRestore_BUTTON = $Control_Buttons[5]
$GUI_MENU_BUTTON = $Control_Buttons[6]

Dim $MenuButtonsArray[4] = ["Settings", "GitHub", "Donate"]

GUICtrlCreateLabel("<----", 50, 10, 25, 20) ; Label with program name
GUICtrlSetResizing(-1, 768 + 64 + 2)
_GUICtrlSetFont(-1, 11, 400, 0, "Calibri", 3)
GUICtrlSetColor(-1, $FontThemeColor)

$LabelName = GUICtrlCreateLabel("PeakyBuyer", 200, 45, 120, 33) ; Label with program name
_GUICtrlSetFont(-1, 18, 800, 0, "Calibri", 5)
GUICtrlSetResizing(-1, 768 + 32 + 8 + 128)
GUICtrlSetColor(-1, 0xADDFFF)

$EditLogs = GUICtrlCreateEdit("", 40, 85, $GUISize[0] - 80, 120) ;Logs goes here
GUICtrlSetResizing(-1, 1)
GUICtrlSetBkColor(-1, "0x3d3d3d")
GUICtrlSetColor(-1, "0xFFFFFF")
GUICtrlSetFont(-1, 12, 400, 0, "Calibri")

$LabelVersion = GUICtrlCreateLabel(GetVerion(), 10, $GUISize[1] - 25, 78, 15) ;Label with program version, align to left bottom corner
GUICtrlSetResizing(-1, 768 + 64 + 2)
_GUICtrlSetFont(-1, 11, 400, 0, "Calibri", 2)
GUICtrlSetColor(-1, $FontThemeColor)

$ButtonStart = _Metro_CreateButton("Start", 40, 220, 90, 30)

#EndRegion PeakyBuyerMainGUI
GUISetState(@SW_SHOW)

Func GetVerion()
	Local $Vers = ""
	If Not @Compiled Then
		$Vers = "Not Compiled"
	Else
		$Vers = FileGetVersion(@AutoItExe)
	EndIf

	Return $Vers
EndFunc   ;==>GetVerion

Func DoLogs($What2Log, $ShowMsgBox = False)
	Local $Logfile = @ScriptDir & "\Logs" & "\Logs -" & @MDAY & "." & @MON & "." & @YEAR & ".txt" ; path to log file.
	If Not FileExists($Logfile) Then
		_FileCreate($Logfile) ;Creating logfile if it doesn't exist yet.
	EndIf
	FileWriteLine($Logfile, "[" & @MDAY & "." & @MON & "." & @YEAR & " " & @HOUR & ":" & @MIN & "] " & $What2Log)
	_GUICtrlEdit_AppendText($EditLogs, "[" & @HOUR & ":" & @MIN & "] " & $What2Log & @CRLF)
	If $ShowMsgBox Then _Metro_MsgBox(0, "", $What2Log, 300, 14)
EndFunc   ;==>DoLogs
