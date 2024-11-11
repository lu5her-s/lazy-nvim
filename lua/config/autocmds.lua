-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
  augroup my_filetype_settings
    autocmd!
    autocmd FileType html,css,xml,htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
    autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
    autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
  augroup END
]])

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

-- neotree reveal
-- vim.cmd([[nnoremap <leader>n :Neotree reveal<CR>]])

-- loaded my .vim
vim.cmd("source ~/.config/nvim/autoclose.vim")
vim.cmd("source ~/.config/nvim/whitespace.vim")
-- vim.cmd("source ~/.config/nvim/aw.vim")
-- when open nvim call :AWStart
-- vim.cmd("AWStart")
-- let g:aw_apiurl_host = <IP_OF_THE_HOST>

vim.lsp.buf.formatting = {
  format_opts = {
    async = true,
    timeout_ms = 10000,
  },
  filter = function(client)
    -- apply whatever logic you want (in this example, we'll only use null-ls)
    return client.name == "null-ls"
  end,
}
