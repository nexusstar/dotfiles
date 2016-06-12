# dotfiles

This repository consists of configuration for some tools I use within my Linux ([ArchLinux][]) and NeoVim environment.

## Install Arch Linux

+ [Initial Setup and Installation][]



## Pre install

For using fonts first  clone __subbomodules__

```bash
git submodule update --init --recursive

```

Copy fonts to ~/dotfiles/fonts/.fonts

```bash
cp ~/dotfiles/documentation/fonts/FontAwesome/fonts/*.ttf ~/dotfiles/fonts/.fonts
cp ~/dotfiles/documentation/fonts/YosemiteSanFranciscoFont/*.ttf ~/dotfiles/fonts/.fonts
```

## Install dotfiles

1. Download or clone repository in `$HOME` directory

```

 cd ~/dotfiles
 make

```


## Author

[nexusstar][]

## ToDo

- [x] [ Documentation ][]
- [ ] Comment out modules in neovim plugin file
- [ ] Remove fish configuration *don't use it anymore*

## Vim key bindings

Execute `\\` to run `~/.vim/mappings.sh` which shows all current leader bindings. This acts as documentation for my mappings.


## Unlicenced

Find the full [unlicense][] in the `UNLICENSE` file, but here's a snippet.

>This is free and unencumbered software released into the public domain.
>
>Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

  Based on dotfiles by

  [OliverCaldwell][] & [Nick Nisi][]

[nexusstar]: https://github.com/nexusstar/dotfiles
[OliverCaldwell]: https://github.com/Olical/dotfiles
[Nick Nisi]: https://github.com/nicknisi/dotfiles
[the unlicence]: http://unlicense.org/
[vim-plug]: https://github.com/junegunn/vim-plug
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
[vim-syntax-expand]:https://github.com/Wolfy87/vim-syntax-expand
[unlicense]:UNLICENSE
[ArchLinux]: https://www.archlinux.org/
[Initial Setup and Installation]: documentation/InstallArchLinux.md
