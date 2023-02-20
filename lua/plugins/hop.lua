return {
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    -- require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    -- hop.nvim
    require("hop").setup()

    -- normal mode (easymotion-like)
    vim.api.nvim_set_keymap("n", "<Leader>hb", "<cmd>HopWordBC<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<Leader>hw", "<cmd>HopWordAC<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<Leader>hj", "<cmd>HopLineAC<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<Leader>hk", "<cmd>HopLineBC<CR>", { noremap = true })

    -- visual mode (easymotion-like)
    vim.api.nvim_set_keymap("v", "<Leader>hw", "<cmd>HopWordAC<CR>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<Leader>hb", "<cmd>HopWordBC<CR>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<Leader>hj", "<cmd>HopLineAC<CR>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<Leader>hk", "<cmd>HopLineBC<CR>", { noremap = true })

    -- normal mode (sneak-like)
    vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", { noremap = false })
    vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", { noremap = false })

    -- visual mode (sneak-like)
    vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", { noremap = false })
    vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", { noremap = false })
  end,
}
