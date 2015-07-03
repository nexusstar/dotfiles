# dotfiles

This repository consists of configuration for some tools I use within my Linux ([Ubuntu][]) and Vim environment.

## Install

1. Download or clone repository
1. Install plugs by running :PlugInstall
1. Install [YouCompleteMe][]
Compiling YCM **with** semantic support for C-family languages:

    cd __dotfiles-dir__/vim/.vim/plugged/YouCompleteMe
    ./install.sh --clang-completer



## Tooling

 * `vim`     The best text editor. *Highly* customised.


## Author

[NexusStar][] / [@NexusStar][]

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
[vim-plug]: https://github.com/junegunn/vim-plug
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
[vim-syntax-expand]:https://github.com/Wolfy87/vim-syntax-expand
[unlicense]:UNLICENSE
