local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

-- Check if stylelint-lsp server already defined.
if not lspconfig.stylelint_lsp then configs['stylelint-lsp'] = {default_config = {}} end
configs.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      -- other settings...
    }
  },
}
