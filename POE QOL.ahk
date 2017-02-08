#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GetCursorPosition()
{
	MouseGetPos, xpos, ypos 
	Msgbox, The cursor is at X[%xpos%] Y[%ypos%] 
	Return
}

OpenPortal(){
    BlockInput MouseMove
    MouseGetPos xx, yy
    Send {i}
    MouseMove, 1800, 820, 0
    Sleep 55
    Click Right
    Sleep 25
    Send {i}
    MouseMove, xx, yy, 0
    BlockInput MouseMoveOff
    Return
}

InviteLastWhisper()
{
	Send ^{Enter}{Home}{Delete}/invite{Space}{Enter}
}

TradeLastWhisper()
{
	Send ^{Enter}{Home}{Delete}/tradewith{Space}{Enter}
}

ThankTrader()
{
	Send ^{Enter}tyvm,{Space}gl{!}{Enter}
}

DeleteItem()
{
	Send {Enter}/destroy{Enter}
}

#IfWinActive Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64.exe
{
    ^WheelUp::Send {Left}  ;cntl-mouse wheel up toggles stash tabs left
    ^WheelDown::Send {Right}  ;cntl-mouse wheel down toggles stash tabs right.
	
	XButton1::Send i
	XButton2::Send 5
	
	F2::OpenPortal()
	
	F5::InviteLastWhisper()
	F6::TradeLastWhisper()
	F7::ThankTrader()
	
	F9::Send {Enter}/hideout{Enter}
	F11::DeleteItem()
	F12::GetCursorPosition()
}