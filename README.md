# dotfiles

This repository consists of configuration for some tools I use within my Linux ([Ubuntu][]) and NeoVim environment.


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
- [x] Comment out modules in neovim plugin file
- [x] Remove fish configuration *don't use it anymore*
- [x] Remove YouCompleteMe and replace with Deoplete
- [x] Add Shogu denite for neovim

## Vim key bindings

Can use :Maps to use fzf searching for mappings

## Unlicenced

Find the full [unlicense][] in the `UNLICENSE` file, but here's a snippet.

>This is free and unencumbered software released into the public domain.
>
>Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

## Inspiration and thanks to excellent dotfiles by

  - [OliverCaldwell][]
  - [Mike Hartington][]
  - [Nick Nisi][]
  - [Cătălin Mariș][]

[nexusstar]: https://github.com/nexusstar/dotfiles
[OliverCaldwell]: https://github.com/Olical/dotfiles
[Nick Nisi]: https://github.com/nicknisi/dotfiles
[Cătălin Mariș]: https://github.com/alrra/dotfiles
[Mike Hartington]: https://github.com/mhartington/dotfiles
[the unlicence]: http://unlicense.org/
[vim-plug]: https://github.com/junegunn/vim-plug
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
[vim-syntax-expand]:https://github.com/Wolfy87/vim-syntax-expand
[unlicense]:UNLICENSE
[Ubuntu]: https://www.ubuntu.com/
[Initial Setup and Installation]: documentation/InstallArchLinux.md
