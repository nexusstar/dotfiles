#Install ArchLinux from scratch

   >There are many ArchLinux tutorial so this is primary for my own reference but if you see something that can be improved don't hesitate to point it out.


## Basic install and configuration

Check for internet connection first enable dhcpcd daemon
```
dhcpcd
```

Use ping to check if connection is enabled
```
ping -c 3 google.com
```

Prepare the Storage devices
Identify the devices
```
lsblk
```

Partition disk
```
cfdisk /dev/sda
```

Check again the partition table:
```
lsblk
```

Configure mnt home and swap

```

mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home

```

Choose mirror list
```
pacman -Sy
pacman -S reflector
reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist
```

Install base packages
```
pacstrap -i /mnt base base-develecho
```

Generate fstab
```
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

Configure installation
```
arch-chroot /mnt
vi /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
ls /usr/share/zoneinfo
ln -s /usr/share/zoneinfo/Europe/Sofia > /etc/localtime
hwclock --systohc --utc
```
Uncomment multilib source
```
vi /etc/pacman.conf
```
Update
```
pacman -Sy
```

Set Hostname
```
echo nexus > /etc/hostname
systemctl enable dhcpcd@enp0s3.service
```
Give Root password
```
passwd
```

Add non-root user
```
pacman -S sudo bash-completion
useradd -m -g users -G wheel,storage,power -s /bin/bash nexus
passwd nexus
```

Allow user to run sudo
```
EDITOR=vi visudo
```
>Uncomment %wheel ALL=(ALL) ALLcli


Add booloader
```
mkinitcpio -p linux
pacman -S grub os-prober
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

All done with install exit and reboot
```
exit
unmount -R /mnt
reboot
```

##Post install and make it usable

Enable network daemon
```
dhcpcd
```

Install audio
```
pacman -S alsa-utils
```

Try it:
```
alsamixer
```

Install extra packages:
```
pacman -S xorg-server xorg-server-utils mesa ttf-dejavu samba smbclient networkmanager networkmanager-vpnc networkmanager-pptp networkmanager-openconnect network-manager-applet gvfs gvfs-smb sshfs
```

List Graphic card type
```
lspci -k | grep -A 2 -i "VGA"
```

   pacman -S xf86-video-intel

   OR for ati cards
   pacman -S xf86-video-ati

   OR for nvidia cards
   nvidia
   OR for virtualbox
   virtualbox-guest-utils

Enable network manager

```
systemctl enable NetworkManager
```
