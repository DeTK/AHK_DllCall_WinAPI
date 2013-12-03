﻿; =================================================================================================
; Function......: GetVersionEx
; DLL...........: Kernel32.dll
; Library.......: Kernel32.lib
; U/ANSI........: GetVersionExW (Unicode) and GetVersionExA (ANSI)
; Author........: jNizM
; Modified......:
; Links.........: http://msdn.microsoft.com/en-us/library/windows/desktop/ms724451(v=vs.85).aspx
; =================================================================================================
GetVersionEx()
{
    static OSVEREX, init := VarSetCapacity(OSVEREX, 284, 0) && NumPut(284, OSVEREX, "UInt")
    if (DllCall("Kernel32.dll\GetVersionEx", "Ptr", &OSVEREX))
    {
        return, { 0 : NumGet(OSVEREX,   0, "UInt"),   1 : NumGet(OSVEREX,       4, "UInt")
                , 2 : NumGet(OSVEREX,   8, "UInt"),   3 : NumGet(OSVEREX,      12, "UInt")
                , 4 : NumGet(OSVEREX,  16, "UInt"),   5 : StrGet(&OSVEREX+20, 128, "UTF-16")
                , 6 : NumGet(OSVEREX, 276, "UShort"), 7 : NumGet(OSVEREX,     278, "UShort")
                , 8 : NumGet(OSVEREX, 280, "UShort"), 9 : NumGet(OSVEREX,     282, "UChar") }
    }
}
; ===================================================================================

GetVersionEx := GetVersionEx()

MsgBox, % "GetVersionEx function`n"
        . "OSVERSIONINFOEX structure`n`n"
        . "OSVersionInfoSize:`t`t"     GetVersionEx[0]   "`n"
        . "MajorVersion:`t`t"          GetVersionEx[1]   "`n"
        . "MinorVersion:`t`t"          GetVersionEx[2]   "`n"
        . "BuildNumber:`t`t"           GetVersionEx[3]   "`n"
        . "PlatformId:`t`t"            GetVersionEx[4]   "`n"
        . "CSDVersion:`t`t"            GetVersionEx[5]   "`n"
        . "ServicePackMajor:`t`t"      GetVersionEx[6]   "`n"
        . "ServicePackMinor:`t`t"      GetVersionEx[7]   "`n"
        . "SuiteMask:`t`t"             GetVersionEx[8]   "`n"
        . "ProductType:`t`t"           GetVersionEx[9]



/* C++ ==============================================================================
BOOL WINAPI GetVersionEx(
    _Inout_  LPOSVERSIONINFO lpVersionInfo        // (284)            Ptr
);


typedef struct _OSVERSIONINFOEX {
    DWORD dwOSVersionInfoSize;                    //  4 =>   0        UInt
    DWORD dwMajorVersion;                         //  4 =>   4        UInt
    DWORD dwMinorVersion;                         //  4 =>   8        UInt
    DWORD dwBuildNumber;                          //  4 =>  12        UInt
    DWORD dwPlatformId;                           //  4 =>  16        UInt
    TCHAR szCSDVersion[128];                      //  4 => 128        UTF-16
    WORD  wServicePackMajor;                      //  2 => 276        UShort
    WORD  wServicePackMinor;                      //  2 => 278        UShort
    WORD  wSuiteMask;                             //  2 => 280        UShort
    BYTE  wProductType;                           //  2 => 282        UChar
    BYTE  wReserved;                              //  Reserved for future use.
} OSVERSIONINFOEX, *POSVERSIONINFOEX, *LPOSVERSIONINFOEX;
================================================================================== */