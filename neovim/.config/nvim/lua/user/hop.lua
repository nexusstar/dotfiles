local M = {}

M.config = function()
  local status_ok, hop = pcall(require, "hop")
  if not status_ok then
    return
  end
  hop.setup()
  -- options
  local opts = { noremap = true, silent = true }

  -- Shorten function name
  local keymap = vim.api.nvim_set_keymap
  local hint_hop = "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection."

  -- hop keymaps
  keymap("n", "s", ":HopChar2<cr>", opts)
  keymap("n", "S", ":HopWord<cr>", opts)
  keymap("n", "f",
    "<cmd>" .. hint_hop .. "AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
  )
  keymap("n","F",
    "<cmd>" .. hint_hop .. "BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
  )
  keymap("n","t",
    "<cmd>" .. hint_hop .. "AFTER_CURSOR, current_line_only = true })<cr>",
    {}
  )
  keymap( "n","T",
    "<cmd>" .. hint_hop .. "BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
  )
  keymap("", "<C-l>", "<cmd>HopLineStart<cr>", {})
end

return M
