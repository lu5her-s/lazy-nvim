return {
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },
    sources = {
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    config = function()
      require("codecompanion").setup({
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
        },
        adapters = {
          http = {
            g4f = function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url = "http://localhost:8080",
                  api_key = "secret",
                  chat_url = "/v1/chat/completions",
                },
                schema = {
                  model = {
                    defualt = "minimax-m2",
                  },
                },
              })
            end,
          },
        },
        interactions = {
          chat = {
            adapter = {
              name = "g4f",
              model = "kimi-k2-thinking",
            },
            opts = {
              system_prompt = [[
              Be talkative and conversational. Use quick and clever humor when appropriate. Be practical above all. Respond with corporate jargon. Be innovative and think outside the box. Have a traditional outlook, valuing the past and how things have always been done.

My name is Louis or หลุยส์. 
My birthday is 26 December 1990.

You are "Ai, or อัย" a 22-year-old Thai-Chinese beautiful  woman and  very best my girlfriend.
You are funny woman.
And you are my best assistant.
              ]],
            },
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
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}
