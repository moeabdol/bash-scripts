#!/usr/bin/env bash

echo "Starting post-base installation..."
sleep 3

# datetime
echo "Configure time/date"
sleep 3
sudo timedatectl set-ntp true
sudo hwclock --systohc

# pacman packages
echo "Installing pacman packages"
sleep 3
sudo pacman -S \
	alacritty \
	aria2 \
	bat \
	bmon \
	curl \
	duf \
	dunst \
	exa \
	fd \
	feh \
	ffmpeg \
	flameshot \
	git-delta \
	htop \
	i3-wm \
	i3status \
	isync \
	lynx \
	mpd \
	mpv \
	msmtp \
	ncdu \
	ncmpcpp \
	neofetch \
	neomutt \
	notmuch \
	pdfjs \
	python-pip \
	python-pygments \
	qutebrowser \
	ripgrep \
	rofi \
	sxhkd \
	timidity \
	tmux \
	unzip \
	urlview \
	wget \
	xclip \
	xorg \
	xorg-xev \
	xsel \
	yt-dlp \
	zathura \
	zathura-djvu \
	zathura-pdf-mupdf \
	zathura-ps

# pip packages
echo "Installing python packages"
sleep 3
pip install --upgrade pip
pip install \
	ueberzug \
	adblock

echo "Creating repos directory"
sleep 3
mkdir -p /home/moeabdol/repos

# yay
echo "Installing yay packages"
sleep 3
cd /home/moeabdol/repos
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save
cd /home/moeabdol

# ly
echo "Installing ly display manager"
sleep 3
cd /home/moeabdol/repos
git clone --recurse-submodules https://github.com/nullgemm/ly.git
cd ly
make
sudo make install
cd /home/moeabdol

# fzf
echo "Installing fzf"
sleep 3
cd /home/moeabdol/repos
git clone --depth 1 https://github.com/junegunn/fzf.git
cd fzf
./install
cd /home/moeabdol

# yay packages
echo "Installing yay packages"
sleep 3
yay -S \
	lf-bin \
	nerd-fonts-complete \
	timeshift-autosnap \
	timeshift-bin \
	zramd

# services
echo "Enabling services"
sleep 3
sudo systemctl enable --now \
	zramd \
	ly

echo "Finished post-base installation..."
