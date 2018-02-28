# Using NeoVim

## First run

On first run nvim shows error for missing dictionary this is solved by running:

```
    :set spell
```

## Mappings

<leader> is mapped to < \ > double <leader> shows mappings.

### Edit
*<leader>bd* delete hidden buffers
*<leader>/c* counts search results
*<leader>cw* trim trailing whitespaces
*<leader>/d* clear search results (*<C-L>*- remove highlight)
### Git
*<leader>gb* git blame
*<leader>gc* git commit



## Problems

* Vdebug clashes with lldb.nvim module and use too similar mappings
