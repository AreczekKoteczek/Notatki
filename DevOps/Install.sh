sudo apt install flatpak plasma-discover-backend-flatpak plasma-discover keepassxc libreoffice libreoffice-kf5 -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo -y
flatpak install flathub dev.vencord.Vesktop -y
flatpak install flathub com.vscodium.codium -y

wget https://betterdiscord.app/Download?id=144 > /home/arek/.var/app/dev.vencord.Vesktop/config/vesktop/themes/
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz

# sudo apt install network-manager-openvpn
# nmcli connection import type openvpn file Areczek.ovpn

# sudo apt install qt5ct
# sudo echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment
# sudo echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
