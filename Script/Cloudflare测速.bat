@ECHO OFF
cd %~dp0
:: ERST 发布于梓喵
if exist CloudflareST.exe (GOTO t2) else (GOTO DL)
:t2
if exist ip.txt (GOTO t3) else (GOTO DL)
:t3
if exist ipv6.txt (GOTO MENU) else (GOTO DL)

:DL
ECHO.检测到缺少CloudflareST.exe等相关文件 正在获取....
powershell (new-object Net.WebClient).DownloadFile('https://github.com/XIU2/CloudflareSpeedTest/releases/latest/download/CloudflareST_windows_amd64.zip','CloudflareST_windows_amd64.zip')
powershell -command "Expand-Archive -Force '%~dp0CloudflareST_windows_amd64.zip' '%~dp0'"
del CloudflareST_windows_amd64.zip
::del cfst_3proxy.bat
::del cfst_hosts.bat

if exist CloudflareST.exe (GOTO t4) else (GOTO DL)
:t4
if exist ip.txt (GOTO t5) else (GOTO DL)
:t5
if exist ipv6.txt (GOTO MENU) else (GOTO DL)

GOTO MENU

:MENU
cls
ECHO.
ECHO.                            Cloudflare测速
ECHO.
ECHO.                       1  测速IPV4
ECHO.
ECHO.                       2  测速IPV6
ECHO.
ECHO.                       3  测速IPV4+IPV6
ECHO.
ECHO.                       4  退   出
ECHO.
ECHO.
ECHO.
choice /C 1234 /N /M "请输入选择项目的序号："

IF ERRORLEVEL 4 GOTO exit
IF ERRORLEVEL 3 GOTO cmd3
IF ERRORLEVEL 2 GOTO cmd2
IF ERRORLEVEL 1 GOTO cmd1
PAUSE

:cmd1

CloudflareST.exe -f ip.txt -o ""
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.防止还未记录结果，错误的按下回车键或Ctrl+C
ECHO. 
ECHO.请再次按1返回菜单，按2退出脚本
ECHO. 
choice /C 12 /N /M "请输入选择项目的序号："

IF ERRORLEVEL 2 GOTO exit
IF ERRORLEVEL 1 GOTO MENU

GOTO MENU

:cmd2

CloudflareST.exe -f ipv6.txt -o ""
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.防止还未记录结果，错误的按下回车键或Ctrl+C
ECHO. 
ECHO.请再次按1返回菜单，按2退出脚本
ECHO. 
choice /C 12 /N /M "请输入选择项目的序号："

IF ERRORLEVEL 2 GOTO exit
IF ERRORLEVEL 1 GOTO MENU

GOTO MENU

:cmd3
ECHO.
ECHO.
ECHO.
CloudflareST.exe -f "ip.txt" -f "ipv6.txt" -o ""
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.防止还未记录结果，错误的按下回车键或Ctrl+C
ECHO. 
ECHO.请再次按1返回菜单，按2退出脚本
ECHO. 
choice /C 12 /N /M "请输入选择项目的序号："

IF ERRORLEVEL 2 GOTO exit
IF ERRORLEVEL 1 GOTO MENU

GOTO MENU

:: ERST 发布于梓喵
