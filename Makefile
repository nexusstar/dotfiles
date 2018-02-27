default: link-config set-shell

link-config:
	stow --restow `ls -d */ | grep -v "documentation|test"`

set-shell:
	chsh -s `which zsh`
