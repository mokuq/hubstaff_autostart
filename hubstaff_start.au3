Func _Au3RecordSetup()
Opt('WinWaitDelay',100)
Opt('WinDetectHiddenText',1)
Opt('MouseCoordMode',0)
Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
If $aResult[1] <> '00000409' Then
  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000409->' & $aResult[1] & ')')
EndIf

EndFunc

Func _WinWaitActivate($title,$text,$timeout=5)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
 EndFunc

 _AU3RecordSetup()

Run('C:\Program Files\Hubstaff\HubstaffClient.exe')
Sleep(500)
_WinWaitActivate("Hubstaff","")
Sleep(500)
Send("{CTRLDOWN}{SHIFTDOWN}{ALTDOWN}{T}")
Send("{ALTUP}{CTRLUP}{SHIFTUP}")
