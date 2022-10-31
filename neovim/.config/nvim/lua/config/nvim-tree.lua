-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
nvim_tree.update_to_buf_dir = {
  enable = true,
  auto_open = true,
}

nvim_tree.git_hl = true

nvim_tree.view = {
  width = 30,
  height = 30,
  hide_root_folder = false,
  side = "left",
  auto_resize = true,
  mappings = {
    custom_only = false,
    list = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    },
  },
  number = false,
  relativenumber = false,
}

nvim_tree.root_folder_modifier = ":t"

nvim_tree.actions = {
  use_system_clipboard = true,
  change_dir = {
    enable = true,
    global = false,
    restric_above_cwd = false
  },
  open_file ={
    quit_on_open = false,
  }
}

nvim_tree.disable_window_picker = 0

nvim_tree.show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
  tree_width = 30,
}

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = " ",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {".env", ".env.local"}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer ={
    highlight_opened_files = "icon", -- 0 "none", 1 "icon", 2 "name", 3 "all"
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    }
  }
}
