-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 2-space indent for template-like filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "xml", "htmldjango" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})

-- Django template autoclose pairs (buffer-local)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "htmldjango",
  callback = function()
    vim.keymap.set("i", "{{", "{{  }}<left><left><left>", { buffer = true })
    vim.keymap.set("i", "{%", "{%  %}<left><left><left>", { buffer = true })
    vim.keymap.set("i", "{#", "{#  #}<left><left><left>", { buffer = true })
  end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-float",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-terminal",
  },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", { buffer = event.buf, silent = true })
  end,
})

-- load legacy vim helpers shipped with this config
vim.cmd("source " .. vim.fn.stdpath("config") .. "/whitespace.vim")

-- set buffer modified for codecompanion
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set modifiable",
})