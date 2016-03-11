default: install-packages link-config set-shell

install-packages: add-aur
	sudo pacman -Sy `cat packages_pac.txt`
	yaourt -S --needed --noconfir `cat packages_aur.txt`

add-aur:
	mkdir -p ~/tmp/AUR && cd ~/tmp/AUR/
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
	tar xfz package-query.tar.gz
	cd package-query  &&  makepkg
	sudo pacman -U package-query*.pkg.tar.xz
	cd ~/tmp/AUR/
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
	tar xzf yaourt.tar.gz
	cd yaourt && makepkg
	sudo pacman -U yaourt*.pkg.tar.xz

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`
