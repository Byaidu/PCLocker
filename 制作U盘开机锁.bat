@echo off
echo 请插入U盘
:loop
wmic logicaldisk where "drivetype=2" get name>temp.txt 2>nul
for /f "skip=1" %%a in ('type temp.txt') do set pan=%%a
del temp.txt>nul 2>nul
if "%pan%"=="" ping localhost -n 2 >nul&goto loop
cls
echo 请确认U盘盘符:%pan%
pause
cls
set key=%random%
(echo %key%)>%pan%\key
echo @echo off >U盘开机锁.bat
echo shutdown /s /t 20 /c "请在20秒内插入U盘解锁，否则电脑将自动关闭" >>U盘开机锁.bat
echo :loop >>U盘开机锁.bat
echo if exist %pan%\key set /p key=^<%pan%\key >>U盘开机锁.bat
echo if "%%key%%"=="%key%" shutdown /a^&exit >>U盘开机锁.bat
echo goto loop >>U盘开机锁.bat
echo 请将U盘开机锁.bat移动到开机启动文件夹，完成设置
pause