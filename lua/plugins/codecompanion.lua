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
    log_level = "TRACE",
  },
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
        op_gemini = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api/v1",
              api_key = "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",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "google/gemini-2.0-flash-exp:free",
              },
            },
          })
        end,
        g4f = function()
          return require("codecompanion.adapters").extend("openai", {
            url = "http://localhost:8080/v1/chat/completions",
            schema = {
              model = {
                default = "gpt-4.1",
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
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "http://localhost:8080",
              api_key = "secret",
              model = "gpt-4.1",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${api_key}",
            },
            parameters = {
              sync = true,
            },
          })
        end,
        my_openai = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://localhost:8080", -- optional: default value is ollama url http://127.0.0.1:11434
              api_key = "secret", -- optional: if your endpoint is authenticated
              chat_url = "/v1/chat/completions", -- optional: default value, override if different
              models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
            },
            schema = {
              model = {
                default = "PollinationsAI", -- define llm model to be used
              },
              temperature = {
                order = 2,
                mapping = "parameters",
                type = "number",
                optional = true,
                default = 0.8,
                desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
                validate = function(n)
                  return n >= 0 and n <= 2, "Must be between 0 and 2"
                end,
              },
              max_completion_tokens = {
                order = 3,
                mapping = "parameters",
                type = "integer",
                optional = true,
                default = nil,
                desc = "An upper bound for the number of tokens that can be generated for a completion.",
                validate = function(n)
                  return n > 0, "Must be greater than 0"
                end,
              },
              stop = {
                order = 4,
                mapping = "parameters",
                type = "string",
                optional = true,
                default = nil,
                desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
                validate = function(s)
                  return s:len() > 0, "Cannot be an empty string"
                end,
              },
              logit_bias = {
                order = 5,
                mapping = "parameters",
                type = "map",
                optional = true,
                default = nil,
                desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
                subtype_key = {
                  type = "integer",
                },
                subtype = {
                  type = "integer",
                  validate = function(n)
                    return n >= -100 and n <= 100, "Must be between -100 and 100"
                  end,
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
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
        -- vectorcode = {
        --   opts = {
        --     add_tool = true,
        --   },
        -- },
      },
    })
  end,
}
