-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

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

--for bufferline
vim.opt.termguicolors = true

-- for autopep8
vim.g.autopep8_diff_type = "vertical"
