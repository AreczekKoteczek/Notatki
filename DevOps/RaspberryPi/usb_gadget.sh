#!/bin/bash
# Konfiguracja USB Gadget dla BadUSB (HID + Mass Storage) jako klawiatura Logitech K120

# Ładuj moduły
modprobe libcomposite

# Utwórz gadget USB
cd /sys/kernel/config/usb_gadget/
mkdir -p badusb
cd badusb

# Ustaw atrybuty urządzenia (Logitech K120)
echo 0x046d > idVendor  # Logitech Vendor ID
echo 0xc31c > idProduct # Logitech K120 Product ID
echo 0x0100 > bcdDevice # Wersja urządzenia 1.0.0
echo 0x0200 > bcdUSB    # USB 2.0
mkdir -p strings/0x409
echo "Logitech" > strings/0x409/manufacturer
echo "USB Keyboard" > strings/0x409/product
echo "1234567890" > strings/0x409/serialnumber

# Konfiguracja HID (klawiatura)
mkdir -p functions/hid.usb0
echo 1 > functions/hid.usb0/protocol
echo 1 > functions/hid.usb0/subclass
echo 8 > functions/hid.usb0/report_length
echo -ne \\x05\\x01\\x09\\x06\\xa1\\x01\\x05\\x07\\x19\\xe0\\x29\\xe7\\x15\\x00\\x25\\x01\\x75\\x01\\x95\\x08\\x81\\x02\\x95\\x01\\x75\\x08\\x81\\x01\\x95\\x05\\x75\\x01\\x05\\x08\\x19\\x01\\x29\\x05\\x91\\x02\\x95\\x01\\x75\\x03\\x91\\x01\\x95\\x06\\x75\\x08\\x15\\x00\\x25\\x65\\x05\\x07\\x19\\x00\\x29\\x65\\x81\\x00\\xc0 > functions/hid.usb0/report_desc

# Konfiguracja Mass Storage (pendrive)
mkdir -p functions/mass_storage.usb0
echo 1 > functions/mass_storage.usb0/stall
echo 0 > functions/mass_storage.usb0/lun.0/cdrom
echo 0 > functions/mass_storage.usb0/lun.0/ro
echo 0 > functions/mass_storage.usb0/lun.0/nofua
echo "/root/usb_storage.img" > functions/mass_storage.usb0/lun.0/file

# Utwórz konfigurację
mkdir -p configs/c.1
ln -s functions/hid.usb0 configs/c.1/
ln -s functions/mass_storage.usb0 configs/c.1/
mkdir -p configs/c.1/strings/0x409
echo "Config 1: HID + Mass Storage" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower

# Aktywuj gadget
echo "3f980000.usb" > UDC