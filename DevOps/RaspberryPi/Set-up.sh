# Optymalizacja raspberry

sudo wget https://archive.kali.org/archive-keyring.gpg -O /usr/share/keyrings/kali-archive-keyring.gpg
sudo apt update && sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean

sudo nano /boot/firmware/config.txt 

disable_splash=1 
# Wyłącz logo startowe 
boot_delay=0 
# Brak opóźnień bootowania 
quiet 
# Cichy boot (mniej logów)
auto_initramfs=0 
# Wyłącz initramfs dla szybszego bootowania
dtoverlay=dwc2,dr_mode=peripheral
# Kontroler USB w trybie device

[pi02] 
arm_freq=1200 
# 1.2 GHz 
over_voltage=4 
# Stabilność dla podkręcenia
force_turbo=1 
# Wymuszenie maksymalnej wydajności CPU 
initial_turbo=10 
# Turbo na starcie dla szybszego bootowania

[all] 
hdmi_blanking=2 
# Wyłącz probowanie HDMI 
hdmi_ignore_edid=0xa5000080 
# Ignoruj EDID HDMI 
hdmi_ignore_cec_init=1 
# Wyłącz CEC 
hdmi_ignore_cec=1 
# Wyłącz CEC całkowicie 
dtoverlay=vc4-kms-v3d,nohdmi 
# Wyłącz HDMI 
max_framebuffers=1 
# Minimalne bufory ramki 
disable_fw_kms_setup=1 
# Wyłącz konfigurację KMS 
disable_overscan=1 
# Wyłącz overscan 
enable_tvout=0 
# Wyłącz composite video 
dtoverlay=disable-bt 
# Wyłącz Bluetooth 
dtparam=audio=off 
# Wyłącz audio 
dtparam=act_led_trigger=none 
# Wyłącz diodę ACT 
camera_auto_detect=0 
# Wyłącz autodetekcję kamery 
display_auto_detect=0 
# Wyłącz autodetekcję wyświetlacza 
force_eeprom_read=0 
# Wyłącz probowanie EEPROM HAT 
disable_poe_fan=1 # Wyłącz PoE 
ignore_lcd=1 
# Ignoruj LCD 
disable_touchscreen=1 
# Wyłącz ekran dotykowy 
dtparam=i2c_arm=off 
# Wyłącz I2C 
dtparam=spi=off 
# Wyłącz SPI 
enable_uart=0 
# Wyłącz UART 
gpu_mem=16 
# Minimalna pamięć dla GPU 
dtparam=sd_overclock=100 
# Zwiększenie taktowania karty SD (A2)

sudo nano /etc/modules
dwc2
libcomposite

systemctl list-units --type=service --state=running
systemd-analyze blame

sudo systemctl disable bluetooth
sudo systemctl stop bluetooth
sudo systemctl disable ModemManager
sudo systemctl stop ModemManager
sudo systemctl disable polkit
sudo systemctl stop polkit
sudo systemctl disable strongswan-starter
sudo systemctl stop strongswan-starter
sudo systemctl disable rtkit-daemon
sudo systemctl stop rtkit-daemon
sudo systemctl disable cron
sudo systemctl stop cron
sudo systemctl disable getty@tty1
sudo systemctl stop getty@tty1
sudo systemctl disable rsyslog
sudo systemctl stop rsyslog
sudo systemctl disable hciuart
sudo systemctl stop hciuart
sudo systemctl disable bthelper@hci0
sudo systemctl stop bthelper@hci0
sudo systemctl disable plymouth-start
sudo systemctl stop plymouth-start
sudo systemctl disable plymouth-read-write
sudo systemctl stop plymouth-read-write
sudo systemctl disable plymouth-quit
sudo systemctl stop plymouth-quit
sudo systemctl disable plymouth-quit-wait
sudo systemctl stop plymouth-quit-wait
sudo systemctl disable NetworkManager-wait-online
sudo systemctl stop NetworkManager-wait-online
sudo systemctl disable networking
sudo systemctl stop networking
sudo systemctl disable keyboard-setup
sudo systemctl stop keyboard-setup
sudo systemctl disable console-setup
sudo systemctl stop console-setup
sudo systemctl disable runonce
sudo systemctl stop runonce
sudo systemctl disable rpi-imager-fixup
sudo systemctl stop rpi-imager-fixup
sudo systemctl disable systemd-rfkill
sudo systemctl stop systemd-rfkill
sudo systemctl disable rpc-statd-notify
sudo systemctl stop rpc-statd-notify

sudo nano /etc/fstab
# Dodano noatime
# Ustawiono pass=0
lsblk
sudo tune2fs -c 0 /dev/mmcblk0p2
# tylko główna partycja

sudo nano /etc/systemd/system.conf
DefaultTimeoutStartSec=5s
DefaultTimeoutStopSec=5s
sudo systemctl daemon-reload

sudo nano /etc/systemd/journald.conf
SystemMaxUse=50M
RuntimeMaxUse=10M
sudo systemctl restart systemd-journald

sudo nano /etc/sysctl.conf
vm.swappiness=10
vm.vfs_cache_pressure=50
vm.dirty_ratio=20
vm.dirty_background_ratio=10

sudo nano /etc/modprobe.d/blacklist.conf
blacklist snd_bcm2835
blacklist videobuf2_v4l2
blacklist bcm2835_v4l2

sudo nano /etc/resolv.conf
nameserver 1.1.1.1
nameserver 1.0.0.1

sudo apt install htop zram-tools -y
sudo systemctl enable zramswap
sudo systemctl start zramswap

# Instalacja narzędzi

lsmod | grep -E 'dwc2|libcomposite'
cat /boot/firmware/config.txt | grep dwc2
dmesg | grep usb
cat /etc/modules | grep -E 'dwc2|libcomposite'

sudo nano /root/usb_gadget.sh
sudo chmod +x /root/usb_gadget.sh
sudo dd if=/dev/zero of=/root/usb_storage.img bs=1M count=1024
sudo mkfs.vfat /root/usb_storage.img
sudo /root/usb_gadget.sh

