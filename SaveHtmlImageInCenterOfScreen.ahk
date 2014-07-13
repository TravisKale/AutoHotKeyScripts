*F1::
myGuid := GUID()

x := (A_ScreenWidth // 2)
y := (A_ScreenHeight // 2)
mousemove, x, y

MouseGetPos,,,NWD_WinID
WinGetClass, WinClass, ahk_id %NWD_WinID%
			MouseClick, Right
			Sleep 100
			SendInput, v
			Sleep 550
			SendInput, %myGuid%
			Sleep 200
			SendInput, {Enter}

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
		
