/*
************************************************************************************************
* autoclose						                                                               *
*                                                                                              *
* Version:              42.00                                                                  *
* AutoHotkey Version:   2.0                                                                    *
* Language:       		English                                                                *
* Platform:       		Windows 10, 11                                                         *
* Author:         		matthiew                                                               *
*                                                                                              *
* Script Function: Searches for a specific window and does something when it finds it.         *
************************************************************************************************
*/




#Requires AutoHotkey v2.0
Persistent
#SingleInstance Force
TraySetIcon ("click.ico")

SetTimer Main, 1000
return

Main()
{




	; Apex Legends
	if WinActive("Apex Legends")
	{
		if WinWaitNotActive("Apex Legends")
		{
			SetCapsLockState false
		}
	}




	; Crash Report
	; This doesn't work yet
	if WinActive("ahk_exe WerFault.exe")
	{
		Send "{Up}{Enter}"
	}
		



	; Fn NumLock
	; For laptops with a virtual number pad via Fn. Toggles NumLock on/off when a dock is
	; connected/disconnected. Assumes that the presence of a dock = the presence of an external keyboard.
	; Note that keyboard detection has too many false positives due to virtual keyboards.
	; Intended for laptops, but conflicts with desktops so disabled.
	DockConnected := IsDockConnected()
    ;SetNumLockState(DockConnected ? "On" : "Off")
	IsDockConnected()
	{
		wmi := ComObjGet("winmgmts:")
		devices := wmi.ExecQuery("SELECT * FROM Win32_PnPEntity")

		for device in devices
		{
			if InStr(device.Name, "Dock")
			{
				return true
			}
		}
		return false
	}




	; OneNote
	if (PID := ProcessExist("ONENOTEM.EXE"))
	{
		ProcessPath := ProcessGetPath("ONENOTEM.EXE")
		ProcessClose "ONENOTEM.EXE"
		; MsgBox "Found OneNote MiniClipper at " ProcessPath
	}




	; Open File - Security Warning
	if WinActive("Open File - Security Warning","Do you want to open this file?")
	{
		Send "!O"
	}
	if WinActive("Open File - Security Warning","The publisher could not be verified. Are you sure that you want to run this software?")
	{
		Send "!R"
	}




	; Taskbar Pin Request
	if WinActive("This app is trying to pin a tile to the taskbar")
	{
		Send "!{F4}"
	}
}





/*
************************************************************************************************
autoclose Known Issues:
 - none




autoclose Version History:
42.00 - Disabled Fn Numlock section.
	  - Created Crash Report section, though it doesn't do anything at the moment.
41.04 - Rewrote Fn Numlock section. Keyboard detection had too many faults, so now doing dock detection.
41.03 - Disabled Fn Numlock section.
41.02 - Updated OneNote section.
41.01 - Updated Fn Numblock section.
41.00 - Overhauled OneNote section.
40.04 - Updated Fn Numblock section.
40.03 - Re-enabled OneNote section.
40.02 - Disabled OneNote section.
40.01 - Updated "Open File - Security Warning" to add alternate warning.
40.00 - Added "Open File - Security Warning" section.
39.01 - Improved logic for cancelling taskbar pin prompts.
39.00 - Added "Taskbar Pin Request" section.
38.00 - Added "Fn NumLock" section.
37.01 - Changed a variable to a clearer name.
37.00 - Added OneNote section: Removes Send to OneNote from start-up.
36.00 - Added Word section: Sets view to 100%, single-page.
35.01 - Updated Apex Legends section: Fixed Caps Lock usage as a keybind for the game.
35.00 - First version of autoclose for AHK2.0.
	  - All functions removed.
	  - New icon.
	  - Added "Apex Legends" section.
************************************************************************************************
*/