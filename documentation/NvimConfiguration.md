# Using NeoVim

## First run

On first run nvim shows error for missing dictionary this is solved by running:

```
    :set spell
```

## Mappings

<leader> is mapped to < \ >.

use `:Map` to search mapping with fzf.
for usage of fzf read [fzfUsage](fzfUsage.md)

### Edit
`<leader>bd` delete hidden buffers
`<leader>/c` counts search results
`<leader>cw` trim trailing whitespaces
`<leader>/d` clear search results (`<C-L>`- remove highlight)

### Git (using vim-fugitive)
`<leader>gb` git blame
`<leader>gc` git commit



## Problems

