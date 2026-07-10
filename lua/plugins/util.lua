return {

  -- git diff view
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },

  -- {
  --   "vhyrro/luarocks.nvim",
  --   config = function()
  --     require("luarocks").setup({})
  --   end,
  -- },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup()
  --   end,
  -- },

  -- emmet
  {
    "mattn/emmet-vim",
  },

  -- lorem ipsum
  -- {
  --   "derektata/lorem.nvim",
  --   config = function()
  --     local lorem = require("lorem")
  --     lorem.setup({
  --       sentenceLength = "mixedShort",
  --       comma = 1,
  --     })
  --   end,
  -- },

  -- rainbow csv
  {
    "mechatroner/rainbow_csv",
  },

  -- nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  require("fzf-lua").setup({
    previewer = "builtin",
    winopts = {
      preview = {
        vertical = "up:45%",
        horizontal = "right:50%",
        layout = "horizontal",
        fallback = "chafa", -- or 'viu'
      },
    },
  }),
}
