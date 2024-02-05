:: Discord Loader
:: by fahmiyufrizal@2024
:: Modifikasi script ini tanpa menghilangkan credits!
:: Script ginian mau dicolong juga? lemah!

@echo off
cd /d "%~dp0"
reg import "%~dp0_Reg\Discord.reg"
start "" Discord\Update.exe --processStart Discord.exe