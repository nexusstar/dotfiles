#Install ArchLinux from scratch

   There are many ArchLinux tutorial how to install
   This is primary for my own reference but if you see
   something that can be improved don't hesitate to point it out.


## List of command sequence

```
Check for internet connection first enable dhcpcd daemon 
dhcpcd

Use ping to check if connection is enabled
ping -c 3 google.com

Prepare the Storage devices
Identify the devices
lsblk
Partition disk
cfdisk /dev/sda
Check again with lsblk
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
Choose mirror list
pacman -Sy
pacman -S reflector
reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist
Install base packages
pacstrap -i /mnt base base-develecho
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt
vi /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
ls /usr/share/zoneinfo
ln -s /usr/share/zoneinfo/Europe/Sofia > /etc/localtime
hwclock --systohc --utc
vi /etc/pacman.conf
Uncomment [multilib]
pacman -Sy
Set Hostname 
echo nexus > /etc/hostname
systemctl enable dhcpcd@enp0s3.service
give Root password
passwd
pacman -S sudo bash-completion
useradd -m -g users -G wheel,storage,power -s /bin/bash nexus
passwd nexus
EDITOR=vi visudo
Uncomment %wheel ALL=(ALL) ALLcli
Add booloader
mkinitcpio -p linux
pacman -S grub os-prober
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
unmount -R /mnt
reboot
```
