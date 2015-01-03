/*
************************************************************************************************
* autoclose																					   *
*                                                                                              *
* Version:              7.6                                                                    *
* AutoHotkey Version:   1.1                                                                    *
* Language:       		English                                                                *
* Platform:       		Windows 7, 8                                                           *
* Author:         		www.twitter.com/matthiew                                               *
*                                                                                              *
* Script Function: Searches for a specific window and does something when it finds it.         *
************************************************************************************************
*/

if not A_IsAdmin
{
	Run *RunAs "%A_AhkPath%" autoclose.ahk
	ExitApp
}

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, Tray, Icon, A.ico
#Persistent
#SingleInstance
SetTitleMatchMode 2




already_run_lgs = 0
last_active_id = 0
SetTimer, ifwinactive, 400
return


ifwinactive:




;Acrobat Pro
IfWinActive, - Adobe Acrobat Pro ;ahk_exe acrobat.exe
	{
	WinGet, active_id, ID, A
	if last_active_id != %active_id%
		{
		Send ^1
		Send !vpc
		last_active_id = %active_id%
		}
	}




;Call Of Duty games
IfWinActive, Set Optimal Settings?
{
	SendInput !n
}




;Internet Explorer
IfWinActive, Internet Explorer is not your default browser
	{
	Send ^w
	}
	
	
	
	
;Logitech Gaming Software
IfWinActive, Logitech Gaming Software	;, , , qt_scrollarea_viewport
	{
	if already_run_lgs != 1
		{
		WinClose
		already_run_lgs = 1
		}
	}




;Maze
IfWinActive, Exit, Are you sure you want to exit?
	{
	Send !Y
	}




;Nitro Reader
IfWinActive,  - Nitro Reader 3
	{
	WinGet, active_id, ID, A
	if last_active_id != %active_id%
		{
		Send ^1
		Send ^4
		last_active_id = %active_id%
		}
	}
	
	
	
	
;Open File - Security Warning
IfWinActive, Open File - Security Warning
	{
	WinClose
	}




;Outlook.com
IfWinActive, msn`, with Outlook.com`, Skype`, and news - Waterfox
{
	SendInput ^w
	Run, https://outlook.com/
}




;Program Compatibility Assistant
IfWinActive, Program Compatibility Assistant
{
	SendInput {Esc}
}




;Scan and fix
IfWinActive, , Scan and fix (recommended)
	{
	Send {Escape}
	}




return




/*
************************************************************************************************
autoclose Known Issues:




autoclose Version History:
7.6 - Updated run as Administrator command.
7.5 - Added "Outlook.com" section.
	- Updated documentation and README.md.
7.4 - autoclose now runs as Administrator so that "Program Compatibility Assistant" section
	  will work.
	- Added "Call Of Duty games" section.
	- Updated documentation and README.md.
7.3 - Added "Program Compatibility Assistant" section.
	- Added #SingleInstance.
    - Updated documentation and README.md.
7.2 - Updated documentation and reorganised files.
7.1 - Updated documentation.
7.0 - Imported to GitHub.
************************************************************************************************
*/