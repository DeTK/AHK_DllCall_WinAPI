﻿; ===============================================================================================================================
; Function......: OpenClipboard
; DLL...........: User32.dll
; Library.......: User32.lib
; U/ANSI........:
; Author........: jNizM
; Modified......:
; Links.........: https://msdn.microsoft.com/en-us/library/ms649048.aspx
;                 https://msdn.microsoft.com/en-us/library/windows/desktop/ms649048.aspx
; ===============================================================================================================================
OpenClipboard(NewOwner = 0)
{
    if !(DllCall("user32.dll\OpenClipboard", "Ptr", NewOwner))
        return DllCall("kernel32.dll\GetLastError")
    return 1
}
; ===============================================================================================================================

OpenClipboard()





/* C++ ==========================================================================================================================
BOOL WINAPI OpenClipboard(                                                           // UInt
    _In_opt_  HWND hWndNewOwner                                                      // Ptr
);
============================================================================================================================== */