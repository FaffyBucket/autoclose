/*
************************************************************************************************
* autoclose						                                                               *
*                                                                                              *
* Version:              37.00                                                                  *
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

SetTimer Trigger, 400
return

Trigger()
{




; Apex Legends
if WinActive("Apex Legends")
	{
		if WinWaitNotActive("Apex Legends")
		{
			SetCapsLockState false
		}
	}




; OneNote
if FileExist(A_Startup "\Send to OneNote.lnk")
	{
		FileDelete A_Startup "\Send to OneNote.lnk"
	}




}





/*
************************************************************************************************
autoclose Known Issues:
 - none




autoclose Version History:
37.00 - Added OneNote section: Removes Send to OneNote from start-up.
36.00 - Added Word section: Sets view to 100%, single-page.
35.01 - Updated Apex Legends section: Fixed Caps Lock usage as a keybind for the game.
35.00 - First version of autoclose for AHK2.0.
	  - All functions removed.
	  - New icon.
	  - Added "Apex Legends" section.
************************************************************************************************
*/