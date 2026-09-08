-- Web (html/css/json) specific config
vim.g.user_emmet_leader_key = "<C-e>"

return {
  -- emmet
  {
    "mattn/emmet-vim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html", "css", "json", "jsonc" })
    end,
  },
}