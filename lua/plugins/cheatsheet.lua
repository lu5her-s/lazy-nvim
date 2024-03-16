return {
  "sudormrfbin/cheatsheet.nvim",

  requires = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },

  config = function()
    require("cheatsheet").setup()
  end,

  -- set <F3> to map key
  keys = {
    { "<F3>", "<cmd>Cheatsheet<cr>", desc = "Cheatsheet" },
  },
}
