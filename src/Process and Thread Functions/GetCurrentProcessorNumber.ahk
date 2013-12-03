﻿; =================================================================================================
; Function......: GetCurrentProcessorNumber
; DLL...........: Kernel32.dll
; Library.......: Kernel32.lib
; U/ANSI........:
; Author........: jNizM
; Modified......:
; Links.........: http://msdn.microsoft.com/en-us/library/windows/desktop/ms683181(v=vs.85).aspx
; =================================================================================================
GetCurrentProcessorNumber()
{
    return, DllCall("Kernel32.dll\GetCurrentProcessorNumber")
}
; ===================================================================================

MsgBox, % GetCurrentProcessorNumber()





/* C++ ==============================================================================
DWORD WINAPI GetCurrentProcessorNumber(void);
================================================================================== */