# WiFi Commands
Commands for cracking WiFi passwords

## Crack WiFi Handshake with Hashcat
```bash copy
.\hashcat.exe -m 22000 -a 0 -o umowa.txt --status --status-timer=300 .\149688_1750160072.hc22000 .\weakpass_4a.policy.txt
```
- Cracks a WiFi handshake (WPA/WPA2) using hashcat with a wordlist.
- `-m 22000`: Specifies WPA/WPA2 hash format (hc22000).
- `-a 0`: Uses wordlist attack mode.
- `-o umowa.txt`: Specifies output file for cracked password.
- `--status`: Displays cracking status.
- `--status-timer=300`: Updates status every 300 seconds.
- `.\149688_1750160072.hc22000`: Specifies the captured handshake file.
- `.\weakpass_4a.policy.txt`: Specifies the wordlist or policy file.