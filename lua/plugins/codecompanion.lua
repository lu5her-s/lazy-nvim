return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  -- config = true,
  config = function()
    require("codecompanion").setup({
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.0-flash",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
      },
    })
  end,
}
