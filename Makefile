default: install-packages link-config install-omf set-shell

install-packages: add-aur
	sudo pacman -Sy `cat packages_pac.txt`
	yaourt -S --needed --noconfirm `cat packages_aur.txt`

add-aur: add-repositories
	sudo pacman -Syuu
	sudo pacman -Sy yaourt

add-repositories:
	cat repositories.txt | sudo tee -a /etc/pacman.conf

link-config:
	stow --restow `ls -d */ | grep -v "documentation"`

install-omf:
	curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

set-shell:
	chsh -s `which fish`

