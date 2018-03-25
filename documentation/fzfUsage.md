# Using fzf fuzzy finder
This is quite powerfull tool for navigating files and directories.
And is astoundingly fast. It has a lot of configuration that need to be
learned.

## Installing

follow official recomendation from [fzf GitHub](https://github.com/junegunn/fzf)

## Command line usage

`CTRL-T` - open search in current dir and selected files could be pasted
to terminal prompt._Better first to enter command to be executed on files_

```bash
vim <CTRL-T> # select files and paste after command
```

`CTRL-R` - List commands history and we could select one.

`ALT-C` - search through directories and cd into selected one.

### Fuzzy completion for zsh and bash

Using `** TAB` could start fuzzy completion after every `command + <word> + **TAB`

### Fuzzy completion for killing process PID

This is provided out of the box with SIGKILL just type `kill -9 TAB` and select
processes to kill

```bash

kill -9 TAB

```

## Neovim usage

installation allows running `:FZF` command and use it as fuzzy file finder
Aditional commands available are:

|      Command |                                Description |
|          --- |                                        --- |
|       :Files |                    Files (similar to :FZF) |
|      :GFiles |                   Git files (git ls-files) |
|     :GFiles? |                         Git files (status) |
|     :Buffers |                               Open buffers |
|      :Colors |                               Color shemes |
| :Ag[pattern] | {ag}{5} search result(ALT-A to select all  result) ALT-D deselect |
| : Lines           | Lines in loaded buffers     |
| :BLines [query]   | Lines in current buffer     |
| :Locate [PATTERN] | `locate` command output     |
| :Tags [query]     | Tags in project (ctagas -R) |
| :BTags [query]    | Tags in current buffer      |
| :Marks            | Marks                       |
| :History          | `v:oldfiles` na buffers     |
| :History:         | Command history             |
| :History/         | Search history              |
| :Snippets         | snipets ({Ultisnips})       |



