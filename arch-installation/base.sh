#!/usr/bin/env bash

echo "Starting base installation..."
sleep 3

# localtime
echo "Configuring localtime"
sleep 3
ln -sf /usr/share/zoneinfo/Asia/Riyadh /etc/localtime
hwclock --systohc

# locale
echo "Configuring localse"
sleep 3
sed -i "62s/.//" /etc/locale.gen
sed -i "178s/.//" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=en" >> /etc/vconsole.conf

# host
echo "Configuring host"
sleep 3
echo "tiny-arch" >> /etc/hostname
echo -e "127.0.0.1\tlocalhost"
echo -e "::1\t\tlocalhost"
echo -e "127.0.1.1\ttiny-arch.local\t\ttiny-arch"

# base packages
echo "Installing pacman packages"
sleep 3
pacman -S \
	acpi \
	acpi_call \
	acpid \
	base-devel \
	bash-completion \
	bluez \
	bluez-utils \
	cups \
	dialog \
	dnsmasq \
	dnsutils \
	dosfstools \
	efibootmgr \
	firewalld \
	gvfs \
	gvfs-smb \
	hplip \
	inetutils \
	ipset \
	nftables \
	linux-headers \
	mtools \
	network-manager-applet \
	networkmanager \
	nfs-utils \
	openssh \
	pulseaudio \
	pulsemixer \
	reflector \
	rsync \
	sof-firmware \
	tlp \
	wpa_supplicant \
	xdg-user-dirs \
	xdg-utils

# nvidia
#pacman -S \
#	nvidia \
#	nvidia-utils \
#	nvidia-settings

# services
echo "Enabling systemd services"
sleep 3
systemctl enable \
	NetworkManager \
	acpid \
	bluetooth \
	cups \
	firewalld \
	fstrim.timer \
	reflector.timer \
	tlp

# users
echo "Change root password"
passwd
useradd -m moeabdol
echo "moeabdol ALL=(ALL) ALL" >> /etc/sudoers.d/moeabdol
echo "Change moeabdol password"
passwd moeabdol

echo "Finished base instalation..."
