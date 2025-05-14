--
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Replace mapleader to \
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- disable some fanzy UI stuff when run in Neovide
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_floating_blur = 0
  vim.g.neovide_floating_opacity = 90
end

--for auto header
vim.g.header_field_author = "lu5her"
vim.g.header_field_author_email = "lu5her@mail"
vim.g.header_field_timestamp_format = "%a %b, %d %Y, %H:%M %j"
vim.g.header_auto_update_header = 1
vim.g.header_field_last_separator = 1
vim.g.header_max_size = 20

--for bufferline
vim.opt.termguicolors = true

-- for autopep8
vim.g.autopep8_diff_type = "vertical"

-- vim.g.airline_section_y = '{…}%3{codeium#GetStatusString()}'
-- vim.g.airline_section_y = '%3{codeium#GetStatusString()}'
-- vim.g.statusline = "%3{codeium#GetStatusString()}"

-- vim.g["codegpt_openai_api_key"] = "dEXMiu282AKk6PZO5JvJvpGXMjrqflV_YzTQ9yX1DdY"
-- vim.g["codegpt_chat_completions_url"] = "https://chimeragpt.adventblocks.cc/api/v1/chat/completions"

-- lazyvim.plugins.extras.ui.alpha

-- emmet remapkey
vim.g.user_emmet_leader_key = "<C-e>"

-- set autochdir
vim.opt.autochdir = true

-- set path to loaded_python3_provider
vim.g.python3_host_prog = "/usr/bin/python3"
-- vim.g.python_host_prog = "/usr/bin/python"
-- vim.g.providers.loaded_python3_provider = 1
vim.g.loaded_python3_provider = nil
-- vim.g.loaded_python_provider = 1
-- vim.g.loaded_ruby_provider = 1
-- vim.g.loaded_node_provider = 1
-- vim.g.loaded_perl_provider = 1

-- set showcmd in normal mode
vim.opt.showcmd = true

-- tagbar options
vim.g.tagbar_autofocus = 1
vim.g.tagbar_sort = 0
-- vim.g.tagbar_show_line_numbers = 1
vim.g.tagbar_show_tag_linenumbers = 2
vim.g.tagbar_autoclose = 1
vim.g.tagbar_autoclose_netrw = 1

vim.opt.laststatus = 3

vim.g.aw_apiurl_host = "127.0.0.1"
vim.g.aw_apiurl_port = "5600"
