return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  -- config = true,
  config = function()
    require("codecompanion").setup({
      adapters = {
        -- gemini = function()
        --   return require("codecompanion.adapters").extend("gemini", {
        --     schema = {
        --       model = {
        --         default = "gemini-2.0-flash",
        --       },
        --     },
        --   })
        -- end,
        g4f = function()
          return require("codecompanion.adapters").extend("openai", {
            url = "https://6fc7-103-151-252-78.ngrok-free.app/v1/chat/completions",
            -- env = {
            --   -- api_base = "http://localhost:1337/v1",
            --   api_key = "secret",
            -- },
            schema = {
              model = {
                default = "gpt-4o",
                choices = {
                  ["deepseek-r1"] = { opts = { can_reason = true } },
                  "gpt-4o",
                  "grok-3",
                  ["gemini-2.0-flash"] = { opts = { can_reason = true } },
                },
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "g4f",
        },
        inline = {
          adapter = "g4f",
        },
        cmd = {
          adapter = "g4f",
        },
      },
    })
  end,
}
