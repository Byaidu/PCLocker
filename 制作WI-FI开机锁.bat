@echo off
for /f "tokens=1,2 delims=: " %%a in ('netsh wlan show drivers') do set %%a=%%b
if not "%支持的承载网络%"=="是" echo 您的电脑不支持承载网络&pause&exit
set /p ssid=请输入SSID名称:
set /p key=请输入密钥:
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key% >nul
netsh wlan start hostednetwork >nul
cls
echo 请用手机连接无线网络%ssid%
:loop
for /f "skip=16 delims= " %%a in ('netsh wlan show hostednetwork') do set mac=%%a
if "%mac%"=="" ping localhost -n 2 >nul&goto loop
cls
echo 请确认手机MAC地址:%mac%
pause
cls
netsh wlan stop hostednetwork >nul
echo @echo off >WI-FI开机锁.bat
echo netsh wlan start hostednetwork ^>nul >>WI-FI开机锁.bat
echo shutdown /s /t 20 /c "请在20秒内使用手机解锁，否则电脑将自动关闭" >>WI-FI开机锁.bat
echo :loop >>WI-FI开机锁.bat
echo for /f "skip=16 delims= " %%%%a in ('netsh wlan show hostednetwork') do if "%%%%a"=="%mac%" netsh wlan stop hostednetwork^&shutdown /a^&exit >>WI-FI开机锁.bat
echo goto loop >>WI-FI开机锁.bat
echo 请将WI-FI开机锁.bat移动到开机启动文件夹，完成设置
pause