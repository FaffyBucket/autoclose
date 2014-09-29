; Version:        7
; AutoHotkey Version: 1.1.08
; Language:       English
; Platform:       Windows 7 64-bit
; Author:         Jive Turkey <matthiew@gmail.com>
;
; Script Function: Searches for a specific window and does something when it finds it.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, A.ico


SetTitleMatchMode 2
already_run_lgs = 0
last_active_id = 0

#Persistent
SetTitleMatchMode 2
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
	Send !r
	}

;Scan and fix
IfWinActive, , Scan and fix (recommended)
	{
	Send {Escape}
	}

return
