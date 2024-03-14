/*
************************************************************************************************
* autoclose						                                                               *
*                                                                                              *
* Version:              36.00                                                                  *
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




; Word
;	if WinActive("ahk_class WINWORD.exe")
;		{
;			MsgBox "Hello Word!"
;			Alt+W
;			1
;			Alt+W
;			J
;			Alt+H
;			Esc
;			Esc
;		}




}





/*
************************************************************************************************
autoclose Known Issues:
 - none




autoclose Version History:
36.00 - Added Word section: Sets view to 100%, single-page.
35.01 - Updated Apex Legends section: Fixed Caps Lock usage as a keybind for the game.
35.00 - First version of autoclose for AHK2.0.
	  - All functions removed.
	  - New icon.
	  - Added "Apex Legends" section.
************************************************************************************************
*/