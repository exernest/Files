@ECHO OFF
cd %~dp0
:: ERST ����������
if exist CloudflareST.exe (GOTO t2) else (GOTO DL)
:t2
if exist ip.txt (GOTO t3) else (GOTO DL)
:t3
if exist ipv6.txt (GOTO MENU) else (GOTO DL)

:DL
ECHO.��⵽ȱ��CloudflareST.exe������ļ� ���ڻ�ȡ....
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
ECHO.                            Cloudflare����
ECHO.
ECHO.                       1  ����IPV4
ECHO.
ECHO.                       2  ����IPV6
ECHO.
ECHO.                       3  ����IPV4+IPV6
ECHO.
ECHO.                       4  ��   ��
ECHO.
ECHO.
ECHO.
choice /C 1234 /N /M "������ѡ����Ŀ����ţ�"

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
ECHO.��ֹ��δ��¼���������İ��»س�����Ctrl+C
ECHO. 
ECHO.���ٴΰ�1���ز˵�����2�˳��ű�
ECHO. 
choice /C 12 /N /M "������ѡ����Ŀ����ţ�"

IF ERRORLEVEL 2 GOTO exit
IF ERRORLEVEL 1 GOTO MENU

GOTO MENU

:cmd2

CloudflareST.exe -f ipv6.txt -o ""
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.��ֹ��δ��¼���������İ��»س�����Ctrl+C
ECHO. 
ECHO.���ٴΰ�1���ز˵�����2�˳��ű�
ECHO. 
choice /C 12 /N /M "������ѡ����Ŀ����ţ�"

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
ECHO.��ֹ��δ��¼���������İ��»س�����Ctrl+C
ECHO. 
ECHO.���ٴΰ�1���ز˵�����2�˳��ű�
ECHO. 
choice /C 12 /N /M "������ѡ����Ŀ����ţ�"

IF ERRORLEVEL 2 GOTO exit
IF ERRORLEVEL 1 GOTO MENU

GOTO MENU

:: ERST ����������