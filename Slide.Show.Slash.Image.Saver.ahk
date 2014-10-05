varWait:=1500 

Escape::SendInput, ^{Tab}

*F1::SendInput, {Left 2}

*F3::SendInput, {Enter}

*F9::varWait+=500	
		return
		
*F10::varWait-=250
		Send {Right}
		return

*F12::
MouseGetPos,,,NWD_WinID
WinGetClass, WinClass, ahk_id %NWD_WinID%
			MouseClick, Right
			Sleep 100
			SendInput, w
			Sleep 100
			SendInput, {Down 2}
			Sleep 100
			SendInput, {Enter}
			return
		
		
*F11::InputBox, varWait, "Enter SlideShow Speed in miliseconds", "Enter SlideShow Speed In Mili-Seconds", , , , , , , , 1500
		
#MaxThreadsPerHotkey 3
*F6::  ;		 Win+Z hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
    ; The next four lines are the action you want to repeat (update them to suit your preferences):
		
	;Send {Right}
	SendInput, {Right}
    Sleep varWait
	
    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
	{
		Notify("Stopping","Stopping",1)	
        break  ; Break out of this loop.
	}
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return










*F2::
myGuid := GUID()
myPath := "C:\Users\TravisKale\Desktop\H\"

x := (A_ScreenWidth // 2)
y := (A_ScreenHeight // 2)
mousemove, x, y

MouseGetPos,,,NWD_WinID
WinGetClass, WinClass, ahk_id %NWD_WinID%
			MouseClick, Right
			Sleep 100
			SendInput, v
			Sleep 1000 ;450
			SendInput, %myPath%
			SendInput, %myGuid%
			Sleep 100 ;500
			mousemove, 513, 445
			sleep 100 ;500
			MouseClick, Left
			
		
			
GUID()
{
format = %A_FormatInteger% ; save original integer format
SetFormat Integer, Hex ; for converting bytes to hex
VarSetCapacity(A,16)
DllCall("rpcrt4\UuidCreate","Str",A)
Address := &A
Loop 16
{
x := 256 + *Address ; get byte in hex, set 17th bit
StringTrimLeft x, x, 3 ; remove 0x1
h = %x%%h% ; in memory: LS byte first
Address++
}
SetFormat Integer, %format% ; restore original format
h := SubStr(h,1,8) . "-" . SubStr(h,9,4) . "-" . SubStr(h,13,4) . "-" . SubStr(h,17,4) . "-" . SubStr(h,21,12)
return h
} 
		
