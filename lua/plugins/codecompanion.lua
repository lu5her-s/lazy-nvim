local aiy_prompt = require("config.aiy_prompt")
local env = require("config.env")

return {
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
      "franco-ruggeri/codecompanion-spinner.nvim",
      "ravitemer/codecompanion-history.nvim",
    },
    config = function()
      require("codecompanion").setup({
        display = {
          chat = {
            window = {
              width = 0.4,
            },
          },
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
          spinner = {},
          history = {
            enabled = true,
            opts = {
              keymap = "gh",
              save_chat_keymap = "sc",
              auto_save = true,
              expiration_days = 0,
              picker = "telescope",
              chat_filter = nil,
              picker_keymaps = {
                rename = { n = "r", i = "<M-r>" },
                delete = { n = "d", i = "<M-d>" },
                duplicate = { n = "<C-y>", i = "<C-y>" },
              },
              auto_generate_title = true,
              title_generation_opts = {
                adapter = nil,
                model = nil,
                refresh_every_n_prompts = 0,
                max_refreshes = 3,
                format_title = function(original_title)
                  return original_title
                end,
              },
              continue_last_chat = false,
              delete_on_clearing_chat = false,
              dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
              enable_logging = false,

              summary = {
                create_summary_keymap = "gcs",
                browse_summaries_keymap = "gbs",

                generation_opts = {
                  adapter = nil,
                  model = nil,
                  context_size = 90000,
                  include_references = true,
                  include_tool_outputs = true,
                  system_prompt = nil,
                  format_summary = nil,
                },
              },

              memory = {
                auto_create_memories_on_summary_generation = true,
                vectorcode_exe = "vectorcode",
                tool_opts = {
                  default_num = 10,
                },
                notify = true,
                index_on_startup = false,
              },
            },
          },
        },
        adapters = {
          http = {
            aiy = function()
              return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                  url = "http://localhost:20128",
                  api_key = env.omniroute_api_key,
                  chat_url = "/v1/chat/completions",
                },
                schema = {
                  model = {
                    default = "ollama/gpt-oss:120b",
                  },
                },
              })
            end,
          },
        },
        interactions = {
          chat = {
            adapter = {
              name = "aiy",
              model = "auto",
            },
            opts = {
              system_prompt = aiy_prompt,
            },
          },
          inline = {
            adapter = {
              name = "aiy",
              model = "auto",
            },
          },
          cmd = {
            adapter = "aiy",
            model = "auto",
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
    "HakonHarnes/img-clip.nvim",
    opts = {
      -- recommended settings (moved from the removed avante config)
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
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
