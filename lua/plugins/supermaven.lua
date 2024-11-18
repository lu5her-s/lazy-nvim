return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-y>",
        },
        color = {
          -- want pastel yellow
          suggestion_color = "#FFFAA0",
          cterm = 244,
        },
      })
    end,
  },
}
