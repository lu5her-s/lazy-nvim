--
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Replace mapleader to \
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- disable some extension providers (startup speed)
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- disable some fanzy UI stuff when run in Neovide
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_floating_blur = 0
  vim.g.neovide_floating_opacity = 90
end

local user = require("config.user")

-- for auto header (vim-header)
vim.g.header_field_author = user.author
vim.g.header_field_author_email = user.author_email
vim.g.header_field_timestamp_format = user.timestamp_format
vim.g.header_auto_update_header = 1
vim.g.header_field_last_separator = 1
vim.g.header_max_size = 20

-- for bufferline
vim.opt.termguicolors = true

-- python3 provider (LSP/dap for python)
vim.g.python3_host_prog = user.python3_host

-- set showcmd in normal mode
vim.opt.showcmd = true

-- tagbar options
vim.g.tagbar_autofocus = 1
vim.g.tagbar_sort = 0
vim.g.tagbar_show_tag_linenumbers = 2
vim.g.tagbar_autoclose = 1
vim.g.tagbar_autoclose_netrw = 1

vim.opt.laststatus = 3

-- auto approve MCPHub
vim.g.mcphub_auto_approve = true
vim.g.codecompanion_auto_tool_mode = true

-- enable transparent background by default (nvim-transparent)
vim.g.transparent_enabled = true

vim.opt.clipboard = "unnamedplus"

-- 🌸 Global indent — Aiy lock for Louis (space 2) — 2026-08-31
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·" }