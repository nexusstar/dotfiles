default: install-packages link-config set-shell

install-packages: add-aur
	sudo pacman -Sy `cat packages_pac.txt`
	yaourt -S --needed --noconfirm `cat packages_aur.txt`

add-aur: add-repositories
	sudo pacman -Syuu
	sudo pacman -Sy yaourt

add-repositories:
	cat repositories.txt | sudo tee -a /etc/pacman.conf

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`
