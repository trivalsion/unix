## "Script" which tells how to install and configure an Arch Linux OS
# !! THIS SCRIPT WAS NOT UPDATED IN A LONG TIME !!


### Installation ###
## System Installation  ##
timedatectl set-ntp true

# BIOS-specific setup 
fdisk /dev/sdX 
	* Input: o, n(select all defaults, except "Last sector" = "+2G"), n(select all defaults),  t("Partition Number" = "1", "Partition Type" = "19"(Linux Swap)), a("Partition Number = "2"), w
mkswap /dev/sdX1
mkfs.ext4 /dev/sdX2
swapon /dev/sdX1
mount /dev/sdX2 /mnt

# UEFI-specific setup
fdisk /dev/sdX
	* Input: g, n(select all defaults, except the "Last sector" = "+550M"), n(select all defaults, except "Last sector" = "+2G"), t("Partition Number" = "1", "Partition Type" = "1"(EFI Boot Partition)), t("Partition Number" = "2", "Partition Type" = "19"(Linux Swap)), w
mkfs.fat -F32 /dev/sdX1 # Format the EFI system partition to fat32
mkswap /dev/sdX2
mkfs.ext4 /dev/sdX3
swapon /dev/sdX2
mount /dev/sdX3 /mnt

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt


## System configuration ##
# Install a text editor, network manager so that networking would be enabled on reboot, CPU mircrocode, grub bootloader utilities
pacman -S nano networkmanager intel-ucode grub sudo

# Setup the localtime
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime
hwclock --systohc

# Generate locale's
# First uncomment(remove # before) en_US.UTF-8 UTF-8 in /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Setup the hosts file
touch /etc/hosts
echo "127.0.0.1 localhost
::1 localhost
127.0.1.1 myhostname.localdomain myhostname" >> /etc/hosts

# UEFI-specific setup
pacman -S efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

# BIOS-specific setup
grub-install --target=i386-pc /dev/sdX

grub-mkconfig -o /boot/grub/grub.cfg

passwd
exit
umount -R /mnt
reboot




### Post-Installation ###
# Enable neworking
systemctl enable NetworkManager
reboot

# Add a user with home directory
useradd -m user 
passwd user
usermod -aG wheel,audio,video user
# Add superuser privileges to the wheel group, so the user could execute root commands by using "sudo command"
EDITOR=nano visudo
# Uncomment "%wheel ALL=(ALL) ALL" line

# Update the system
sudo pacman -Syu

# Install GNOME(Uses wayland by default, check using - "echo $XDG_SESSION_TYPE")
sudo pacman -Syu gnome
sudo systemctl enable gdm.service # Make gdm start on boot
sudo systemctl start gdm.service  # Stary gdm now

# Replace PulseAudio with pipewire(Make sure to answear y on all propmpts so that pipewire replaces alsa)
sudo pacman -Syu pipewire pipewire-alsa pipewire-pulse  
reboot


# Arch Intallation - https://wiki.archlinux.org/title/installation_guide
# 	Arch installation video guide - https://www.youtube.com/watch?v=PQgyW10xD8s
# Setting up disks - https://wiki.archlinux.org/title/Fdisk
# UEFI - https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface
# Setting up bootloader - https://wiki.archlinux.org/title/GRUB
# Microcode - https://wiki.archlinux.org/title/Microcode
# Network Manager - https://wiki.archlinux.org/title/NetworkManager
# Pipewire - https://wiki.archlinux.org/title/PipeWire
# GNOME - https://wiki.archlinux.org/title/GNOME

# Arch Maintenance - https://wiki.archlinux.org/title/System_maintenance

# EndeavourOS, custmizable arch-based distro - https://endeavouros.com/
# Official Arch Installer - https://github.com/archlinux/archinstall
# Arch install automation - https://shirotech.com/linux/how-to-automate-arch-linux-installation/
