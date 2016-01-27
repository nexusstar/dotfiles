# dotfiles
__This is installation instruction for this dotfiles under OS X El Capitan__

This repository branch consist of all the configuration used in my Linux (Ubuntu) and instruction how to move them under OS X.

## __Before__ Install

1. Install [Homebrew](http://brew.sh/)
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

```
1. Disable Configuration System Integrity Protection

This fixes:

__operation not permited when mv cp etc. commands__

Reboot and press cmd+r when booting up. Then go to
utilities > terminal

```
crutil disable
reboot
```
Why [here](https://developer.apple.com/library/mac/documentation/Security/Conceptual/System_Integrity_Protection_Guide/ConfiguringSystemIntegrityProtection/ConfiguringSystemIntegrityProtection.html)

1. Install python, cmake, nodejs, go
```
brew isntall caskroom/cask/brew-cask

brew install go

brew install mercurial

brew install nodejs

brew install mono

brew install cmake

brew install python3

pip2 install virtualenv

pip3 install virtualenv

```

## Build Vim from source

```
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope
sudo make
sudo make install

```

## install

1. download or clone repository

i am using
```
~/tools/dotfiles

```

1. link ~/tools/dotfiles/vim/.vim to ~/.vim

```
sudo ln -s ~/tools/dotfiles/vim/.vim ~/.vim

```


1. Add [vim-plug](https://github.com/junegunn/vim-plug)
```
 curl -fLo __dotfiles-dir__/vim/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

1. Install [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

Compiling YCM **with** semantic support for C-family languages:

- C# support: add `--omnisharp-completer` to `./install.py`
- Go support: ensure go is installed and add `--gocode-completer`
- TypeScript support: install [nodejs and npm][npm-install] then install the
  TypeScript SDK with `npm install -g typescript`.
  - JavaScript support: install [nodejs and npm][npm-install] and add
    `--tern-completer` to `./install.py`
    - Rust support: install [rustc and cargo][rust-install] and add
      `--racer-completer` to `./install.py`

      For example, to install with all language features, ensure npm, go, mono, rust,
      and typescript API are installed and in your PATH, then:

          cd ~/.vim/bundle/YouCompleteMe
              ./install.py --clang-completer --omnisharp-completer --gocode-completer \
                      --tern-completer --racer-completer


1. Install plugs by running :PlugInstall




## Author

(@nexusstar)


## Vim key bindings

Execute `\\` to run `~/.vim/mappings.sh` which shows all current leader bindings. This acts as documentation for my mappings.

## Vim notes
  __change conceal level__
  set conceallevel=

## Unlicenced

Find the full [unlicense][] in the `UNLICENSE` file, but here's a snippet.

>This is free and unencumbered software released into the public domain.
>
>Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

##Based on dotfiles by [OliverCaldwell][]

[OliverCaldwell]: https://twitter.com/OliverCaldwell
[the unlicence]: http://unlicense.org/
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
[vim-syntax-expand]:https://github.com/Wolfy87/vim-syntax-expand
[unlicense]:UNLICENSE
