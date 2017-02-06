#include-once
#include <Array.au3>


#Region PeakyBuyerSettingsGUI
Func Settings()
	Local $GUISize[2] = [520, 535]
	Local $GUIPos[2] = [((@DesktopWidth / 2) - ($GUISize[0] / 2)), ((@DesktopHeight / 2) - ($GUISize[1] / 2))] ;Screen Center

	Local $PeakyBuyerSettingsGUI = _Metro_CreateGUI("PeakyBuyer - Settings", $GUISize[0], $GUISize[1], $GUIPos[0], $GUIPos[1], True)

	;Add control buttons
	Local $Control_Buttons_2 = _Metro_AddControlButtons(True, True, True, True)

	;Set variables for control buttons
	Local $GUI_CLOSE_BUTTON = $Control_Buttons_2[0]
	Local $GUI_MAXIMIZE_BUTTON = $Control_Buttons_2[1]
	Local $GUI_RESTORE_BUTTON = $Control_Buttons_2[2]
	Local $GUI_MINIMIZE_BUTTON = $Control_Buttons_2[3]
	Local $GUI_FULLSCREEN_BUTTON = $Control_Buttons_2[4]
	Local $GUI_FSRestore_BUTTON = $Control_Buttons_2[5]

	Local $ListSettings = GUICtrlCreateList("", 10, 60, 85, $GUISize[1] - 400, $WS_BORDER, $SS_BLACKRECT)
	GUICtrlSetData(-1, "Hotkeys|Player list|Other", "Hotkeys")
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	Global $ButtonSaveSettings = _Metro_CreateButton("Save", 10, 235, 85, 30)

	Local $ArrStart[3], $ArrEnd[3]

	$GroupSettings = GUICtrlCreateGroup("", 110, 50, $GUISize[0] - 140, $GUISize[1] - 75)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($GroupSettings), "wstr", 0, "wstr", 0)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

	#Region SettingsHotkeys
	$ArrStart[0] = GUICtrlCreateDummy()

	GUICtrlCreateLabel("Start: ", 120, 80, 45, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Global $SettingsInputStartHotkey = GUICtrlCreateInput("", 175, 82, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("Exit: ", 120, 105, 45, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Global $SettingsInputExitHotkey = GUICtrlCreateInput("", 175, 107, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("Pause: ", 120, 130, 45, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Global $SettingsInputPauseHotkey = GUICtrlCreateInput("", 175, 132, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	$ArrEnd[0] = GUICtrlCreateDummy()
	#EndRegion SettingsHotkeys

	#Region SettingsPlayerList
	$ArrStart[1] = GUICtrlCreateDummy()

	GUICtrlCreateLabel("Player Name:", 120, 80, 95, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")

	Local $InputPlayerName = GUICtrlCreateInput("", 230, 82, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	Global $ComboPickNumber = GUICtrlCreateCombo("", 385, 82, 33, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1|2|3|4|5|6")
	_GUICtrlComboBox_SetCurSel($ComboPickNumber, 0)

	GUICtrlCreateLabel("Buy now max:", 120, 105, 105, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Local $InputBuyNowMax = GUICtrlCreateInput("", 230, 107, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL, $ES_NUMBER), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("Start Price:", 120, 130, 105, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Local $InputStartPrice = GUICtrlCreateInput("", 230, 132, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL, $ES_NUMBER), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("Buy now price:", 120, 155, 105, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Local $InputBuyNowPrice = GUICtrlCreateInput("", 230, 157, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL, $ES_NUMBER), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("Duration:", 120, 180, 105, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Local $ComboDuration = GUICtrlCreateCombo("", 230, 182, 145, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1h|3h|6h|12h|1day|3days")
	_GUICtrlComboBox_SetCurSel($ComboDuration, 0)

	Local $CheckboxQuickList = _Metro_CreateCheckbox("QuickList", 120, $GUISize[1] - 320, 90, 24)

	Local $CheckboxIsSpecial = _Metro_CreateCheckbox("Special", 210, $GUISize[1] - 320, 80, 24)

	GUICtrlCreateLabel("Players on list:", 120, $GUISize[1] - 270, 105, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")

	Local $LabelPlayersCounter = GUICtrlCreateLabel("0", 230, $GUISize[1] - 270, 30, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0x76ee00")

	Local $ListPlayers = GUICtrlCreateList("", 120, 290, 150, $GUISize[1] - 320, BitOR($WS_BORDER, $WS_VSCROLL), $SS_BLACKRECT)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	Local $ButtonManagePlayerList = _Metro_CreateButton("Save/load list", 295, $GUISize[1] - 270, 150, 30)

	Local $ButtonAddPlayer = _Metro_CreateButton("Add Player", 295, $GUISize[1] - 190, 150, 30)
	Local $ButtonEditPlayer = _Metro_CreateButton("Edit Price", 295, $GUISize[1] - 150, 150, 30)
	Local $ButtonRemovePlayer = _Metro_CreateButton("Remove", 295, $GUISize[1] - 110, 150, 30)
	Local $ButtonRemoveAllPlayers = _Metro_CreateButton("Remove All Players", 295, $GUISize[1] - 70, 150, 30)

	$ArrEnd[1] = GUICtrlCreateDummy()

	#EndRegion SettingsPlayerList

	#Region SettingsOther
	$ArrStart[2] = GUICtrlCreateDummy()

	GUICtrlCreateLabel("PeakyBuyer Speed:", 120, 80, 135, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")

	Global $SettingsInputPeakyBuyerSpeed = GUICtrlCreateInput("", 285, 82, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("MoseMove speed:", 120, 105, 135, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Global $SettingsInputMoseMoveSpeed = GUICtrlCreateInput("", 285, 107, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL, $ES_NUMBER), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	GUICtrlCreateLabel("Auto Relist:", 120, 135, 135, 18)
	_GUICtrlSetFont(-1, 13, 400, 0, "Calibri", 2)
	GUICtrlSetColor(-1, "0xFFFFFF")
	;GUICtrlSetBkColor(-1, "0x800080") ; Test Size

	Global $SettingsInputAutoRelist = GUICtrlCreateInput("", 285, 137, 145, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL, $ES_NUMBER), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	$ArrEnd[2] = GUICtrlCreateDummy()
	#EndRegion SettingsOther

	GUISetState(@SW_SHOW)

	SettingsSwitcher(0, $ArrStart, $ArrEnd, $GroupSettings, $ListPlayers, $LabelPlayersCounter)
	LoadSettings()
	While 1
		_Metro_HoverCheck_Loop($PeakyBuyerSettingsGUI) ;Add hover check in loop
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $GUI_CLOSE_BUTTON
				_Metro_GUIDelete($PeakyBuyerSettingsGUI) ;Delete GUI/release resources, make sure you use this when working with multiple GUIs!
				Return 0
			Case $GUI_MAXIMIZE_BUTTON
				GUISetState(@SW_MAXIMIZE)
			Case $GUI_RESTORE_BUTTON
				GUISetState(@SW_RESTORE)
			Case $GUI_MINIMIZE_BUTTON
				GUISetState(@SW_MINIMIZE)
			Case $GUI_FULLSCREEN_BUTTON, $GUI_FSRestore_BUTTON
				_Metro_FullscreenToggle($PeakyBuyerSettingsGUI, $Control_Buttons_2)
			Case $ListSettings
				SettingsSwitcher(_GUICtrlListBox_GetCurSel($ListSettings), $ArrStart, $ArrEnd, $GroupSettings, $ListPlayers, $LabelPlayersCounter)
			Case $ButtonSaveSettings
				SaveSettings()
			Case $ButtonManagePlayerList
				_GUIDisable($PeakyBuyerSettingsGUI, 0, 30)
				PlayerListDialog()
				_GUIDisable($PeakyBuyerSettingsGUI)
			Case $ButtonAddPlayer
				AddPlayerToList(GUICtrlRead($InputPlayerName), GUICtrlRead($InputBuyNowMax), $ListPlayers, GUICtrlRead($ComboPickNumber), _Metro_CheckboxIsChecked($CheckboxIsSpecial), _Metro_CheckboxIsChecked($CheckboxQuickList), GUICtrlRead($InputStartPrice), GUICtrlRead($InputBuyNowPrice), _GUICtrlComboBox_GetCurSel($ComboDuration) + 1)
				GUICtrlSetData($InputPlayerName, "")
				GUICtrlSetData($InputBuyNowMax, "")
				_GUICtrlComboBox_SetCurSel($ComboPickNumber, 0)
				GUICtrlSetData($InputStartPrice, "")
				GUICtrlSetData($InputBuyNowPrice, "")
				_GUICtrlComboBox_SetCurSel($ComboDuration, 0)
				If _Metro_CheckboxIsChecked($CheckboxIsSpecial) Then _Metro_CheckboxUnCheck($CheckboxIsSpecial)
				CountPlayers($LabelPlayersCounter)
			Case $CheckboxQuickList
				If _Metro_CheckboxIsChecked($CheckboxQuickList) Then
					_Metro_CheckboxUnCheck($CheckboxQuickList)
				Else
					_Metro_CheckboxCheck($CheckboxQuickList)
				EndIf
			Case $CheckboxIsSpecial
				If _Metro_CheckboxIsChecked($CheckboxIsSpecial) Then
					_Metro_CheckboxUnCheck($CheckboxIsSpecial)
				Else
					_Metro_CheckboxCheck($CheckboxIsSpecial)
				EndIf
			Case $ButtonEditPlayer
				GUICtrlSetData($InputPlayerName, GetPlayerName(_GUICtrlListBox_GetCurSel($ListPlayers)))
				GUICtrlSetData($InputBuyNowMax, GetPlayerBuyNowMax(_GUICtrlListBox_GetCurSel($ListPlayers)))
				GUICtrlSetData($ComboPickNumber, GetPlayerPickNumber(_GUICtrlListBox_GetCurSel($ListPlayers)))
				GUICtrlSetData($InputStartPrice, GetPlayerStartPrice(_GUICtrlListBox_GetCurSel($ListPlayers)))
				GUICtrlSetData($InputBuyNowPrice, GetPlayerBuyNowPrice(_GUICtrlListBox_GetCurSel($ListPlayers)))
				_GUICtrlComboBox_SetCurSel($ComboDuration, GetPlayerDuration(_GUICtrlListBox_GetCurSel($ListPlayers)))
				If GetPlayerQuickSell(_GUICtrlListBox_GetCurSel($ListPlayers)) == "True" Then _Metro_CheckboxCheck($CheckboxQuickList)
				If GetPlayerSpecial(_GUICtrlListBox_GetCurSel($ListPlayers)) == "True" Then _Metro_CheckboxCheck($CheckboxIsSpecial)
				RemovePlayerFromList(_GUICtrlListBox_GetCurSel($ListPlayers))
				_GUICtrlListBox_DeleteString($ListPlayers, _GUICtrlListBox_GetCurSel($ListPlayers))
				CountPlayers($LabelPlayersCounter)
			Case $ButtonRemovePlayer
				RemovePlayerFromList(_GUICtrlListBox_GetCurSel($ListPlayers))
				_GUICtrlListBox_DeleteString($ListPlayers, _GUICtrlListBox_GetCurSel($ListPlayers))
				CountPlayers($LabelPlayersCounter)
			Case $ButtonRemoveAllPlayers
				RemoveAllPlayersFromList($ListPlayers)
				CountPlayers($LabelPlayersCounter)
		EndSwitch
	WEnd
EndFunc   ;==>Settings
#EndRegion PeakyBuyerSettingsGUI

Func LoadSettings()
	DoLogs("Loading Settings.")
	If Not FileExists($SettingsFile) Then
		DoLogs($SettingsFile & " does not exist.", True)
		Return
	EndIf
	;#Hotkeys Section
	GUICtrlSetData($SettingsInputStartHotkey, IniRead($SettingsFile, "Hotkeys", "StartHotkey", "HOME"))
	GUICtrlSetData($SettingsInputExitHotkey, IniRead($SettingsFile, "Hotkeys", "ExitHotkey", "END"))
	GUICtrlSetData($SettingsInputPauseHotkey, IniRead($SettingsFile, "Hotkeys", "PauseHotkey", "PAUSE"))

	;Other Section
	GUICtrlSetData($SettingsInputPeakyBuyerSpeed, IniRead($SettingsFile, "Other", "PeakyBuyerSpeed", "*1"))
	GUICtrlSetData($SettingsInputMoseMoveSpeed, IniRead($SettingsFile, "Other", "MouseMoveSpeed", "10"))
	GUICtrlSetData($SettingsInputAutoRelist, IniRead($SettingsFile, "Other", "AutoRelist", "0"))
EndFunc   ;==>LoadSettings

Func SaveSettings()
	If Not FileExists($SettingsFile) Then
		DoLogs($SettingsFile & " does not exist.", True)
		Return
	EndIf
	;#Hotkeys Section
	IniWrite($SettingsFile, "Hotkeys", "StartHotkey", GUICtrlRead($SettingsInputStartHotkey))
	IniWrite($SettingsFile, "Hotkeys", "ExitHotkey", GUICtrlRead($SettingsInputExitHotkey))
	IniWrite($SettingsFile, "Hotkeys", "PauseHotkey", GUICtrlRead($SettingsInputPauseHotkey))

	;#Other Section
	IniWrite($SettingsFile, "Other", "PeakyBuyerSpeed", GUICtrlRead($SettingsInputPeakyBuyerSpeed))
	IniWrite($SettingsFile, "Other", "MouseMoveSpeed", GUICtrlRead($SettingsInputMoseMoveSpeed))
	IniWrite($SettingsFile, "Other", "AutoRelist", GUICtrlRead($SettingsInputAutoRelist))

	DoLogs("Settings has been saved.", True)
EndFunc   ;==>SaveSettings

Func SettingsSwitcher($CurrentSelection, $ArrStart, $ArrEnd, $GroupSettings, $ListPlayers, $LabelPlayersCounter)
	For $i = 0 To UBound($ArrStart) - 1
		If $i = $CurrentSelection Then
			For $ii = $ArrStart[$i] To $ArrEnd[$i]
				GUICtrlSetState($ii, $GUI_SHOW)
			Next
			Switch ($i)
				Case 0
					GUICtrlSetData($GroupSettings, "Hotkeys")
				Case 1
					GUICtrlSetData($GroupSettings, "Player list")
					LoadPlayerList($ListPlayers)
					CountPlayers($LabelPlayersCounter)
				Case 2
					GUICtrlSetData($GroupSettings, "Other")
				Case Else
					GUICtrlSetData($GroupSettings, "Cos sie... cos sie popsulo")
			EndSwitch
		Else
			For $ii = $ArrStart[$i] To $ArrEnd[$i]
				GUICtrlSetState($ii, $GUI_HIDE)
			Next
		EndIf
	Next
EndFunc   ;==>SettingsSwitcher

Func LoadPlayerList($List)
	Local $StringSplit
	If FileExists($PlayerListFile) Then
		$CreateArray = FileReadToArray($PlayerListFile)
		If IsArray($CreateArray) Then
			_GUICtrlListBox_ResetContent($List)
			For $i = 0 To UBound($CreateArray) - 1
				$StringSplit = StringSplit($CreateArray[$i], ":")
				If IsArray($StringSplit) And $StringSplit[0] = 8 Then
					_GUICtrlListBox_AddString($List, $StringSplit[1] & " - " & _AddComa($StringSplit[2]) & " -> " & _AddComa($StringSplit[7]))
				Else
					_GUICtrlListBox_AddString($List, "Invalid player list")
					Return
				EndIf
			Next
		EndIf
	Else
		_FileCreate($PlayerListFile)
	EndIf
EndFunc   ;==>LoadPlayerList

Func RemovePlayerFromList($line)
	Local $ret
	Local $fOpen
	If $line >= 0 Then
		_FileReadToArray($PlayerListFile, $ret)
		_ArrayDelete($ret, 0)
		_ArrayDelete($ret, $line)
		FileWrite(FileOpen($PlayerListFile, 2), "") ; clean file
		_FileWriteFromArray($PlayerListFile, $ret)
	Else
		DoLogs("Select player first.", True)
	EndIf
EndFunc   ;==>RemovePlayerFromList

Func RemoveAllPlayersFromList($hPlayerList)
	FileDelete($PlayerListFile)
	Sleep(100)
	_FileCreate($PlayerListFile)
	_GUICtrlListBox_ResetContent($hPlayerList)
EndFunc   ;==>RemoveAllPlayersFromList

Func PlayerListDialog()
	Local $GUISize[2] = [250, 205]
	Local $GUIPos[2] = [((@DesktopWidth / 2) - ($GUISize[0] / 2)), ((@DesktopHeight / 2) - ($GUISize[1] / 2))] ;Screen Center

	Local $PlayerListDialog = _Metro_CreateGUI("", $GUISize[0], $GUISize[1], $GUIPos[0], $GUIPos[1], True)

	;Add control buttons
	Local $Control_Buttons_2 = _Metro_AddControlButtons(True, False, False, False) ;CloseBtn = True, MaximizeBtn = True, MinimizeBtn = True, FullscreenBtn = True, MenuBtn = True

	Local $List = GUICtrlCreateList("", 15, 35, 120, 125, $WS_BORDER, $SS_BLACKRECT)
	GUICtrlSetData(-1, LoadDataToList(), "Lista1")
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	Local $ListNameInput = GUICtrlCreateInput("Enter list name.", 15, 175, 170, 20, BitOR($ES_LEFT, $ES_AUTOHSCROLL), $SS_BLACKRECT)
	_GUICtrlSetFont(-1, 11, 400, 0, "Verdana", 2)
	GUICtrlSetColor(-1, $FontThemeColor)
	GUICtrlSetBkColor(-1, "0x3d3d3d")
	GUICtrlSetColor(-1, "0xFFFFFF")

	Local $Load = _Metro_CreateButton("Load", 140, 35, 85, 30)
	Local $Save = _Metro_CreateButton("Save", 140, 75, 85, 30)

	;Set variables for control buttons
	Local $GUI_CLOSE_BUTTON = $Control_Buttons_2[0]

	GUISetState(@SW_SHOW)

	While 1
		_Metro_HoverCheck_Loop($PlayerListDialog);This hover check has to be added to the main While loop, otherwise the hover effects won't work.
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE, $GUI_CLOSE_BUTTON
				_Metro_GUIDelete($PlayerListDialog)
				Return 0
			Case $Save
				SaveNewList(GUICtrlRead($ListNameInput))
			Case $Load
				LoadNewList(_GUICtrlListBox_GetText($List,_GUICtrlListBox_GetCurSel($List)))
		EndSwitch
	WEnd
EndFunc   ;==>PlayerListDialog

Func LoadDataToList()
    Local $aFileList = _FileListToArray($PlayerListPath, "*.txt")
	Local $str = ""

	For $i = 1 To $aFileList[0]
		$str &= StringTrimRight($aFileList[$i], 4) & "|"
	Next
	Return $str
EndFunc
Func SaveNewList($ListName)
	MsgBox(0, "", $ListName)
EndFunc

Func LoadNewList($ListName)
	MsgBox(0, "", $ListName)
EndFunc

Func AddPlayerToList($Name, $BuyNowMax, $List, $iNumber, $isSpecial, $bQuickList, $StartPrice, $BuyNowPrice, $Duration)
	If $Name == "" Then
		DoLogs("Name field is empty.", True)
		Return
	ElseIf $BuyNowMax == "" Then
		DoLogs("Please, specify buy now price before you add player.", True)
		Return
	Else
		_GUICtrlListBox_AddString($List, $Name & " - " & _AddComa($BuyNowMax))
		FileWriteLine($PlayerListFile, $Name & ":" & $BuyNowMax & ":" & $iNumber & ":" & $isSpecial & ":" & $bQuickList & ":" & $StartPrice & ":" & $BuyNowPrice & ":" & $Duration)
		Return
	EndIf
EndFunc   ;==>AddPlayerToList

Func GetPlayerName($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[1]
EndFunc   ;==>GetPlayerName

Func GetPlayerBuyNowMax($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[2]
EndFunc   ;==>GetPlayerBuyNowMax

Func GetPlayerPickNumber($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[3]
EndFunc   ;==>GetPlayerPickNumber

Func GetPlayerSpecial($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[4]
EndFunc   ;==>GetPlayerSpecial

Func GetPlayerQuickSell($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[5]
EndFunc   ;==>GetPlayerQuickSell

Func GetPlayerStartPrice($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[6]
EndFunc   ;==>GetPlayerStartPrice

Func GetPlayerBuyNowPrice($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	Return $array[7]
EndFunc   ;==>GetPlayerBuyNowPrice

Func GetPlayerDuration($line)
	$line += 1
	$array = StringSplit(FileReadLine($PlayerListFile, $line), ":")
	$array[8] -= 1
	Return $array[8]
EndFunc   ;==>GetPlayerDuration

Func CountPlayers($Label)
	If FileExists($PlayerListFile) Then GUICtrlSetData($Label, _FileCountLines($PlayerListFile))
EndFunc   ;==>CountPlayers

Func _AddComa($Var)
	Dim $t, $final
	$result = StringSplit($Var, "")

	For $x = $result[0] To 1 Step -1
		$t = $t + 1
		If $t = 4 Then
			$final = "," & $final
			$t = 1
		EndIf
		$final = $result[$x] & $final
	Next

	Return $final
EndFunc   ;==>_AddComa
