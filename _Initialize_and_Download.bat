:: Discord Loader
:: by fahmiyufrizal@2024
:: Modifikasi script ini tanpa menghilangkan credits!
:: Script ginian mau dicolong juga? lemah!

@echo off
set disable_updates=yes
title Discord Loader [github.com/fahmiyufrizal]
taskkill /f /im Discord*
if exist DiscordSetup.exe del /q DiscordSetup.exe
if not exist "%~dp0Discord" mkdir "Discord"
if not exist "%~dp0_Installer" mkdir _Installer
if not exist "%~dp0_Reg" mkdir _Reg

echo [+] Downloading Discord...
curl -s -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36" -H "Cache-Control: no-cache" -o "%~dp0_Installer\DiscordSetup.exe" "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86">nul

echo [+] Installing Discord...
start "" "%~dp0_Installer\DiscordSetup.exe" -S
ping 127.0.0.1 -n 30 > nul
xcopy "%localappdata%\Discord" "%~dp0Discord" /Y /E
if exist "%localappdata%\Discord" RD /S /Q "%localappdata%\Discord"
mklink /J "%localappdata%\Discord" "%~dp0Discord"
reg export "HKEY_CURRENT_USER\SOFTWARE\Classes\Discord" "%~dp0_Reg\Discord.reg" /y
if /I %disable_updates% == yes reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Discord" /f

echo.
cls
if exist Discord\Update.exe (cls && echo [+] Use Launch_Discord.exe to launch Discord next time! && echo [+] And use Discord_Mini_Updater.exe to update Discord or use Discord_Mini_Updater_AutoScheduler.exe to schedule auto update! && echo pause>nul) else (echo Problem && pause>nul)

