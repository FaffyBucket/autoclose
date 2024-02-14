/*
*********************************************************************************************************************************
* autoclose						                                                                                                *
*                                                                                                                               *
* Version:              35.0                                                                                                    *
* AutoHotkey Version:   2.0                                                                                                     *
* Language:       		English                                                                                                 *
* Platform:       		Windows 10                                                                                              *
* Author:         		www.twitter.com/matthiew                                                                                *
*                                                                                                                               *
* Script Function: Searches for a specific window and does something when it finds it.                                          *
*********************************************************************************************************************************
*/




#Requires AutoHotkey v2.0
Persistent
#SingleInstance Force
TraySetIcon ("click.ico")

SetTimer Trigger, 400
return

Trigger()
{
	if WinActive("Apex Legends")
		{
			SetCapsLockState "AlwaysOff"
			if WinWaitNotActive("Apex Legends")
			{
				SetCapsLockState true
				SetCapsLockState false
			}
		}
}




/*
*********************************************************************************************************************************
autoclose Known Issues:
 - none




autoclose Version History:
35.00 - First version of autoclose for AHK2.0.
	  - All functions removed.
	  - New icon.
	  - Added Apex Legends section.
*********************************************************************************************************************************
*/