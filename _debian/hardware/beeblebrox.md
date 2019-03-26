---
layout: page
title: Debian on Lenovo Thinkpad Yoga 11e
description: >
 Install and use Debian Sid on a Lenovo Thinkpad Yoga 11e, a small 11.6 inch
 Intel based notebook with long battery duration and touch capability.
last_modified_at: 2019-03-25
categories:
- hardware
---

# Beeblebrox

I bought [this model](https://www.lenovo.com/us/en/laptops/lenovo/student-chromebooks/ThinkPad-Yoga-11e-Chromebook-4th-Gen/p/22TP2TX153E20HY "") in Dezember 2016 as a used device for around 400 Euros. It came with a pre-installed Windows 8, a 128 GB SSD - which I changed for a 256GB Samsung EVO 850 - and 8 GB of RAM. The remaining hardware is mainly based on Intel. The brilliant 11.6 inch display has touch capability and flexible 360 degree hinches. This is an output of `lspci` as of the time of writing:

````shell{: title='output of lspci without partition information'}
# hwinfo --short
cpu:                                                            
                       Intel(R) Celeron(R) CPU  N2930  @ 1.83GHz, 700 MHz
                       Intel(R) Celeron(R) CPU  N2930  @ 1.83GHz, 603 MHz
                       Intel(R) Celeron(R) CPU  N2930  @ 1.83GHz, 566 MHz
                       Intel(R) Celeron(R) CPU  N2930  @ 1.83GHz, 525 MHz
keyboard:
  /dev/input/event0    AT Translated Set 2 keyboard
mouse:
  /dev/input/mice      SynPS/2 Synaptics TouchPad
  /dev/input/mice      ATML1000:00 03EB:8C1F
monitor:
                       LG Display LCD Monitor
graphics card:
                       Intel Atom Processor Z36xxx/Z37xxx Series Graphics & Display
sound:
                       Intel Atom Processor Z36xxx/Z37xxx Series High Definition Audio Controller
storage:
                       Intel Atom Processor E3800 Series SATA AHCI Controller
network:
  eth0                 Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
  wlan0                Intel Dual Band Wireless-N 7260
network interface:
  lo                   Loopback network interface
  wlan0                WLAN network interface
  eth0                 Ethernet network interface
disk:
  /dev/sda             Samsung SSD 850
usb controller:
                       Intel Atom Processor Z36xxx/Z37xxx, Celeron N2000 Series USB xHCI
bios:
                       BIOS
bridge:
                       Intel Atom Processor E3800 Series PCI Express Root Port 1
                       Intel Atom Processor Z36xxx/Z37xxx Series Power Control Unit
                       Intel Atom Processor E3800 Series PCI Express Root Port 4
                       Intel Atom Processor Z36xxx/Z37xxx Series SoC Transaction Register
                       Intel Atom Processor E3800 Series PCI Express Root Port 3
hub:
                       Linux Foundation 2.0 root hub
                       Genesys Logic 4-port hub
                       Linux Foundation 3.0 root hub
memory:
                       Main Memory
bluetooth:
                       Intel Bluetooth Device
unknown:
                       FPU
                       DMA controller
                       PIC
                       Keyboard controller
                       PS/2 Controller
                       Intel Atom Processor E3800 Series SMBus Controller
                       Intel Atom Processor Z36xxx/Z37xxx Series Trusted Execution Engine
  /dev/ttyS0           16550A
  /dev/input/event9    Acer Integrated Camera
````

The installation of Debian worked like a charme using a [netinst ISO](https://www.debian.org/CD/netinst/) on a USB devive. After the procedure finished successfully, I've upgraded the system to Debian Sid (as I always do with my workstations) and installed these packages providing (free and non-free) firmware support:

````shell
apt-get install firmware-linux firmware-linux-free firmware-linux-nonfree \
                firmware-intel-sound firmware-iwlwifi firmware-realtek \
                intel-microcode
````

Also these packages are installed:

````shell
libdrm-intel1 xserver-xorg-input-all xserver-xorg-video-intel xserver-xorg-input-synaptics i965-va-driver
````

With these packages installed, everything works out of the box. No special configuration is required.
Because the hardware is mainly Intel based, things work out of the box
