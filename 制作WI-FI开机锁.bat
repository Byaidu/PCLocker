@echo off
for /f "tokens=1,2 delims=: " %%a in ('netsh wlan show drivers') do set %%a=%%b
if not "%֧�ֵĳ�������%"=="��" echo ���ĵ��Բ�֧�ֳ�������&pause&exit
set /p ssid=������SSID����:
set /p key=��������Կ:
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key% >nul
netsh wlan start hostednetwork >nul
cls
echo �����ֻ�������������%ssid%
:loop
for /f "skip=16 delims= " %%a in ('netsh wlan show hostednetwork') do set mac=%%a
if "%mac%"=="" ping localhost -n 2 >nul&goto loop
cls
echo ��ȷ���ֻ�MAC��ַ:%mac%
pause
cls
netsh wlan stop hostednetwork >nul
echo @echo off >WI-FI������.bat
echo netsh wlan start hostednetwork ^>nul >>WI-FI������.bat
echo shutdown /s /t 20 /c "����20����ʹ���ֻ�������������Խ��Զ��ر�" >>WI-FI������.bat
echo :loop >>WI-FI������.bat
echo for /f "skip=16 delims= " %%%%a in ('netsh wlan show hostednetwork') do if "%%%%a"=="%mac%" netsh wlan stop hostednetwork^&shutdown /a^&exit >>WI-FI������.bat
echo goto loop >>WI-FI������.bat
echo �뽫WI-FI������.bat�ƶ������������ļ��У��������
pause