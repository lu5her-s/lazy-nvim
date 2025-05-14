return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  opts = {
    -- strategies = {
    --   chat = {
    --     adapter = "g4f",
    --   },
    --   inline = {
    --     adapter = "g4f",
    --   },
    --   cmd = {
    --     adapter = "g4f",
    --   },
    -- },
    log_level = "ERROR",
  },
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
        g4f = function()
          return require("codecompanion.adapters").extend("openai", {
            url = "http://localhost:8080/v1/chat/completions",
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
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        cmd = {
          adapter = "gemini",
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
    })
  end,
}
