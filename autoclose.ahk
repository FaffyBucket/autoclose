/*
************************************************************************************************
* autoclose						                                                               *
*                                                                                              *
* Version:              40.00                                                                  *
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




	; Fn NumLock
	; For laptops with a virtual number pad via Fn. Turns NumLock on when an external
	; keyboard is attached, and off when there are no external keyboards detected.
    hasExternal := (GetKeyboardCount() > 2)
    SetNumLockState(hasExternal ? "On" : "Off")

    GetKeyboardCount()
    {
        count := 0
        svc := ComObjGet("winmgmts:")
        col := svc.ExecQuery("SELECT * FROM Win32_Keyboard")
        for dev in col {
            count += 1
        }
        return count
    }




	; OneNote
	if FileExist(A_Startup "\Send to OneNote.lnk")
	{
		FileDelete A_Startup "\Send to OneNote.lnk"
	}




	; Open File - Security Warning
	if WinActive("Open File - Security Warning")
	{
		Send "!O"
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