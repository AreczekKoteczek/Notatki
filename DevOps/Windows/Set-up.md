# Windows 11 Setup

## Why Windows 11
- Latest Microsoft OS, faster response time than Windows 10, just better after optimisation

- [Windows media creation tool](https://www.microsoft.com/pl-pl/software-download/windows11)

## Windows 11 internet bypass

Shift + F10, and type in cmd:
``` cmd copy
oobe\BypassNRO
```

## Post-Install Optimization
- Use [ReviOS](https://github.com/meetrevision/playbook/releases) script from [https://ameliorated.io/](https://ameliorated.io/) for system optimization

## Install Libraries & Tools
- [DirectX Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=35)
- [Visual C++ Redistributables](https://github.com/abbodi1406/vcredist/releases/)
- [Vesktop](https://github.com/Vencord/Vesktop/releases/)
- [VSCodium](https://github.com/VSCodium/vscodium/releases)
- [Git](https://git-scm.com/downloads)
- [GitHub Desktop](https://desktop.github.com/download/)
- [KeepassXC](https://github.com/keepassxreboot/keepassxc/releases/)
- [Firefox](https://www.mozilla.org/pl/firefox/all/desktop-release/)
- [Notepad++](https://notepad-plus-plus.org/downloads/)
- [7zip](https://www.7-zip.org/download.html)


## Kali Linux WSL Setup
```powershell copy
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --update --pre-release
wsl --set-default-version 2
wsl --install kali-linux
```