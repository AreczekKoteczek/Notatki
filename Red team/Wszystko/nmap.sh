nmap -O -sV -sC -T5 10.10.202.131
sudo nmap -Pn -script vuln -p 80,135,139,445,3389  10.10.202.131