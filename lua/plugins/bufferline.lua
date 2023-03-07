return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- opts = {
  --   separator_style = "slant", --| "slope" | "thick" | "thin" | { 'any', 'any' },
  -- },
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "slant", --| "slope" | "thick" | "thin" | { 'any', 'any' },
      },
    })
  end,
}
