@echo off
echo �����U��
:loop
wmic logicaldisk where "drivetype=2" get name>temp.txt 2>nul
for /f "skip=1" %%a in ('type temp.txt') do set pan=%%a
del temp.txt>nul 2>nul
if "%pan%"=="" ping localhost -n 2 >nul&goto loop
cls
echo ��ȷ��U���̷�:%pan%
pause
cls
set key=%random%
(echo %key%)>%pan%\key
echo @echo off >U�̿�����.bat
echo shutdown /s /t 20 /c "����20���ڲ���U�̽�����������Խ��Զ��ر�" >>U�̿�����.bat
echo :loop >>U�̿�����.bat
echo if exist %pan%\key set /p key=^<%pan%\key >>U�̿�����.bat
echo if "%%key%%"=="%key%" shutdown /a^&exit >>U�̿�����.bat
echo goto loop >>U�̿�����.bat
echo �뽫U�̿�����.bat�ƶ������������ļ��У��������
pause