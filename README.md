# ordinals-for-FASMx64
Practical use of WinAPI function ordinals

FASM x64
Windows 11.

Malware often employs ordinals to evade static analysis detection. To locate function ordinals, open x64 Native Tools Command Prompt for VS 2022 as Administrator and execute:
dumpbin /exports C:\Windows\System32\kernel32.dll | findstr GetProcAddress

Output example:
718 | GetProcAddress

The leftmost column represents the ordinal! 718
