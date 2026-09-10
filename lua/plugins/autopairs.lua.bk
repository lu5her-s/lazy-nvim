return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      fast_wrap = {
        map = "<C-a>",
        chars = { "{", "[", "(", '"', "'" },
        manual_positions = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  end,
}
