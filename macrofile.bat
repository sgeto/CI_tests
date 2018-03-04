;= @echo off
;= :: Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= :: In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here

;= General stuff
7z=7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on $*.7z $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
cmderr=cd /d "%CMDER_ROOT%"
tssh=ssh 192.168.137.111 -p 8022 -i %USERPROFILE%/.ssh/TERMUX_rsa
dlink=telnet 192.168.1.1
grep=grep --color
tftp=sftp -P 8022 -i C:\Users\Ali/.ssh/TERMUX_rsa 192.168.137.111
assh=ssh -l root 192.168.137.111
;= Prefix current dir to %PATH%
hpath=PATH=%CD%;%PATH%
libdll="PATH=..\..\src\.libs;%PATH%"
mkexpdef="expdef.exe -v -p *.dll > mydef.def"

;=git stuff
gc=git clone --recursive -j8  $*

;= Python stuff
python2=C:\Python27\python.exe $*
python3=C:\Python36\python.exe $*
ppath="set PYTHONPATH=%PYTHONPATH%;%CD%"

;= MinGW/Msys2 stuff
;= assuming GNU Make
make=make --jobs --environment-overrides --no-print-directory --warn-undefined-variables $*

;= MSVC stuff
msbuild=msbuild /nologo /logger:"C:\Program Files\AppVeyor\BuildAgent\Appveyor.MSBuildLogger.dll" $*
msbuild1=msbuild /nologo /target:Rebuild /verbosity:minimal /property:WarningLevel=3;PlatformToolset=v140;Configuration="Debug" $*
msbuild2=msbuild /nologo /maxcpucount /verbosity:quiet /consoleloggerparameters:ErrorsOnly;NoItemAndPropertyList;NoSummary;Verbosity=minimal /target:"Build" /property:platform=x64;Configuration="Release";Configuration="Debug" $*
nmake=nmake /nologo $*
cl=cl /nologo /MP $*
link=link /nologo $*
lib=lib /nologo $*
mt=mt /nologo $*
rc=rc /nologo $*