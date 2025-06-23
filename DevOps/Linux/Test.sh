#!/bin/bash

while true; do
	echo 'Wybierz element menu:'
	echo '1. Skanuj lokalną sieć'
	echo '2. Pokaż listę dostępnych skryptów Nmap'
	echo '3. Uruchom MSF'
	echo '4. Uruchom Airmageddon'
	echo '5. Uruchom Wifite'
	echo '6. Uruchom Nesus-a'
	echo '9. Napraw virtualbox'
	echo '0. Wyjście'
	read -p 'Wybierz opcję: ' choice
	
	case $choice in
		1)
			IPTEMP=$(ip route | grep / | awk '{print$1}')
			sudo nmap -sP $IPTEMP | grep 'scan\|MAC'
			echo "   "
			echo "---------------------------"
			echo "   "
			echo "Podaj adres IP do przeskanowania:"
			read IPTEMP2
			echo "   "
			echo "---------------------------"
			echo "   "
			sudo nmap -sV -sC -p- $IPTEMP2
			echo "   "
			echo "---------------------------"
			echo "   "
			echo "koniec"
			;;
		2)
			ls /usr/share/nmap/scripts
			echo 'użyj skryptu używając "nmap -p(port) --script=(nazwa skyptu) (ip)"'
			;;
		3)	
			echo 'wyszukaj payloadu exploitu używając "search type:explot platform:windows port:22 rank:excelent"'
			sudo msfdb init && msfconsole
			;;
		4)
			sudo airgeddon
			;;
		5)
			sudo wifite
			;;
		6)
			sudo service nessusd start
			firefox https://127.0.0.1:8834
			;;
		9)
			'pobieranie "headers"-ów karnela'
			sudo apt reinstall linux-headers-$(uname -r)
			'reinstalacja dkms'
			sudo apt reinstall virtualbox-dkms dkms
			'reinstalacja vierualbox-a'
			sudo apt reinstall virtualbox
			'konfiguracja virtualbox-a'
			sudo modprobe vboxdrv
			'gotowe'
			;;
		0)
			echo 'Wyjście z programu.'
			break
			;;
			
		*)
			echo 'Nieprawidłowy wybór, spróboj ponownie.'
			;;
	esac
	echo ''
done