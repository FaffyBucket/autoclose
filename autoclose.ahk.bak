/*
*********************************************************************************
* autoclose																		*
*                                                                               *
* Version:              20.0                                                    *
* AutoHotkey Version:   1.1                                                     *
* Language:       		English                                                 *
* Platform:       		Windows 7, 8                                            *
* Author:         		www.twitter.com/matthiew                                *
*                                                                               *
* Script Function: Searches for a specific window and does something when it    *
* finds it.         															*
*********************************************************************************
*/

if not A_IsAdmin
{
	Run *RunAs "%A_AhkPath%" autoclose.ahk
	ExitApp
}

#NoEnv  ; Recommended for performance and compatibility with future AHK releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, Tray, Icon, A.ico
#Persistent
#SingleInstance Force
SetTitleMatchMode 2




;already_run_lgs = 0
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




/* 
 * AutoHotkey (#SingleInstance)
 * IfWinActive, , An older instance of this script is already running.
 * {
 * 	SendInput !Y
 * }
 */





;~ Call Of Duty games
;~ (Optimal settings)
IfWinActive, Set Optimal Settings?
{
	SendInput !n
}
;~ (Safe mode)
IfWinActive, Run In Safe Mode?
{
		SendInput !n
}




; CrashPlan (sleep)
IfWinActive, How long would you like to sleep?
{
	SendInput {Enter}
}




;Internet Explorer (default browser prompt)
IfWinActive, Internet Explorer is not your default browser
	{
	Send ^w
	}
	
	
	
	
/* 
 * LastPass CC fill
 * IfWinActive, LastPass FF Toolbar,
 * 	{
 * 	SendInput {Enter}
 * 	}
 */





;Logitech Gaming Software (LGS launches when device disconnected)
;~ IfWinActive, Logitech Gaming Software	;, , , qt_scrollarea_viewport
	;~ {
	;~ if already_run_lgs != 1
		;~ {
		;~ WinClose
		;~ already_run_lgs = 1
		;~ }
	;~ }




/* ; MakeMKV (Create folder confirmation)
 * IfWinActive, MakeMKV BETA popup
 * {
 * 	SendInput !y
 * }
 */




; ManageEngine ServiceDesk Plus
; [Reminder]
IfWinActive, Servicedesk - Reminder
{
	WinGet, active_id, ID, A
	if last_active_id != %active_id%
	{
		SendInput #{Up}
		SendInput {Tab 4}
		SendInput 1
		SendInput +{Tab 3}
		last_active_id = %active_id%
	}
}
; [Send Notification]
IfWinActive, ManageEngine ServiceDesk Plus - Send Notification
{
	WinGet, active_id, ID, A
	if last_active_id != %active_id%
	{
		SendInput #{Up}
		Sleep, 2000
		SendInput CHECK THE CCs
		SendInput {Enter 2}
		last_active_id = %active_id%
	}
}




;~ ;Maze
;~ ; Exit confirmation
;~ IfWinActive, Exit, Are you sure you want to exit?
;~ {
	;~ Send !Y
;~ }
;~ ; Login with Windows Authentication
;~ IfWinActive, Login, This is my preferred database
;~ {
	;~ SendInput {Tab}
	;~ SendInput {Space}
	;~ SendInput !o
;~ }




; Mouse and Keyboard Center
IfWinActive, Please wait while the application opens: MouseKeyboardCenter.exe
{
	SendInput !C
}




;Nitro Reader (set Actual Size, Continuous)
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
	
	
	
	
; Open File - Security Warning
IfWinActive, Open File - Security Warning
	{
	SendInput !r
	}




; Outlook.com (return to login screen on logout)
IfWinActive, MSN Australia | Hotmail login`, Breaking news`, Outlook`, Skype and Video - Waterfox
; IfWinActive, MSN Australia | Hotmail`, Outlook`, Skype`, News and Video - Waterfox
; IfWinActive, msn`, with Outlook.com`, Skype`, news and Hotmail - Waterfox
; IfWinActive, msn`, with Outlook.com`, Skype`, and news - Waterfox
{
	SendInput ^w
	Run, https://outlook.com/
}




;Program Compatibility Assistant. This requires Administrator access.
IfWinActive, Program Compatibility Assistant
{
	SendInput {Esc}
}




;Scan and fix
IfWinActive, , Scan and fix (recommended)
	{
	Send {Escape}
	}
	
	
	
	
;Skype for Business
IfWinActive, Microsoft Outlook, We're sorry
{
	Send {Escape}
}
	
	
	
	
;Spotify (stops Spotify from running at login)
IfWinActive, Spotify
{
	RegDelete, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Run, Spotify
}




/* ; Titanfall (crash on close)
 * IfWinExist, TitanFall.exe, Check online for a solution and close the program
 * {
 * 	WinActivate, TitanFall.exe, Check online for a solution and close the program
 * 	SendInput {Esc}
 * }
 */




return




/*
*********************************************************************************
autoclose Known Issues:
 - none




autoclose Version History:
20.0 - Added Skype for Business section.
19.2 - Updated Outlook.com section.
19.1 - Updated Outlook.com section.
19.0 - Disabled Maze section.
18.2 - Disabled Logitech Gaming Software section.
18.1 - Added to ManageEngine ServiceDesk Plus section.
18.0 - Added ManageEngine ServiceDesk Plus section.
17.1 - Added login subsection to Maze section.
17.0 - Added Spotify section.
	 - Removed Titanfall section.
	 - Cleaned up comments.
16.2 - Updated Call Of Duty section.
16.1 - Disabled LastPass section. It was triggering when deleting passwords from
	   LastPass. Need to find a way to exclude "LastPass FF Toolbar".
16.0 - Added LastPass section.
15.5 - Removed MakeMKV section. MakeMKV has multiple popups with the same title.
15.4 - Returned run as Administrator.
15.3 - Removed run as Administrator. It should be set in the shortcut instead
	   to avoid a UAC prompt.
15.2 - Updated Outlook.com section.
15.1 - Updated #SingleInstance.
	 - Removed AutoHotkey section.
15.0 - Added MakeMKV section.
	 - Retired README.md.
14.1 - Updated Titanfall section.
14.0 - Added Mouse and Keyboard Center section.
13.1 - Updated Outlook.com section.
13.0 - Added CrashPlan section.
12.0 - Added AutoHotkey section.
	 - Added Titanfall section.
	 - Updated documentation.
10.0 - Corrected version number.
	 - Updated "Open File - Security Warning" section.
7.6 - Updated run as Administrator command.
7.5 - Added "Outlook.com" section.
	- Updated documentation and README.md.
7.4 - autoclose now runs as Administrator so that "Program Compatibility
	  Assistant" section will work.
	- Added "Call Of Duty games" section.
	- Updated documentation and README.md.
7.3 - Added "Program Compatibility Assistant" section.
	- Added #SingleInstance.
    - Updated documentation and README.md.
7.2 - Updated documentation and reorganised files.
7.1 - Updated documentation.
7.0 - Imported to GitHub.
*********************************************************************************
*/