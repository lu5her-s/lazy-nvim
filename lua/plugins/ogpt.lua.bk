return {
  {
    "huynle/ogpt.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>][",
        "<cmd>OGPT<CR>",
        desc = "Chat",
      },
      {
        "<leader>]]",
        "<cmd>OGPTFocus<CR>",
        desc = "Focus",
      },
      {
        "<leader>]",
        ":'<,'>OGPTRun<CR>",
        desc = "GPT",
        mode = { "n", "v" },
      },
      {
        "<leader>]c",
        "<cmd>OGPTRun edit_code_with_instructions<CR>",
        "Edit code with instruction",
        mode = { "n", "v" },
      },
      {
        "<leader>]e",
        "<cmd>OGPTRun edit_with_instructions<CR>",
        "Edit with instruction",
        mode = { "n", "v" },
      },
      {
        "<leader>]g",
        "<cmd>OGPTRun grammar_correction<CR>",
        "Grammar Correction",
        mode = { "n", "v" },
      },
      {
        "<leader>]r",
        "<cmd>OGPTRun evaluate<CR>",
        "Evaluate",
        mode = { "n", "v" },
      },
      {
        "<leader>]i",
        "<cmd>OGPTRun get_info<CR>",
        "Get Info",
        mode = { "n", "v" },
      },
      { "<leader>]t", "<cmd>OGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      { "<leader>]k", "<cmd>OGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      { "<leader>]d", "<cmd>OGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      { "<leader>]a", "<cmd>OGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      { "<leader>]<leader>", "<cmd>OGPTRun custom_input<CR>", "Custom Input", mode = { "n", "v" } },
      { "g?", "<cmd>OGPTRun quick_question<CR>", "Quick Question", mode = { "n" } },
      { "<leader>]f", "<cmd>OGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      {
        "<leader>]x",
        "<cmd>OGPTRun explain_code<CR>",
        "Explain Code",
        mode = { "n", "v" },
      },
    },
    opts = {
      default_provider = "gemini",
      edgy = true, -- enable this!
      single_window = false, -- set this to true if you want only one OGPT window to appear at a time
      providers = {
        gemini = {
          api_host = os.getenv("GEMINI_API_HOST"),
          api_key = os.getenv("GEMINI_API_KEY"),
          model = "gemini-pro",
          api_params = {
            temperature = 0.5,
            topP = 0.99,
          },
          api_chat_params = {
            temperature = 0.5,
            topP = 0.99,
          },
        },
        openai = {
          api_host = os.getenv("OPENAI_API_HOST"),
          api_key = os.getenv("OPENAI_API_KEY"),
          api_params = {
            model = "gpt-3.5-turbo",
            temperature = 0.8,
            top_p = 0.9,
          },
          api_chat_params = {
            model = "gpt-3.5-turbo",
            frequency_penalty = 0,
            presence_penalty = 0,
            temperature = 0.5,
            top_p = 0.9,
          },
        },
      },
      yank_register = "+",
      edit = {
        edgy = nil, -- use global default, override if defined
        diff = false,
        keymaps = {
          close = "<C-c>",
          accept = "<M-CR>",
          toggle_diff = "<C-d>",
          toggle_parameters = "<C-o>",
          cycle_windows = "<Tab>",
          use_output_as_input = "<C-u>",
        },
      },
      popup = {
        edgy = nil, -- use global default, override if defined
        position = 1,
        size = {
          width = "40%",
          height = 10,
        },
        padding = { 1, 1, 1, 1 },
        enter = true,
        focusable = true,
        zindex = 50,
        border = {
          style = "rounded",
        },
        buf_options = {
          modifiable = false,
          readonly = false,
          filetype = "ogpt-popup",
          syntax = "markdown",
        },
        win_options = {
          wrap = true,
          linebreak = true,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        keymaps = {
          close = { "<C-c>", "q" },
          accept = "<C-CR>",
          append = "a",
          prepend = "p",
          yank_code = "c",
          yank_to_register = "y",
        },
      },
      chat = {
        edgy = nil, -- use global default, override if defined
        welcome_message = WELCOME_MESSAGE,
        loading_text = "Loading, please wait ...",
        question_sign = "", -- 🙂
        answer_sign = "ﮧ", -- 🤖
        border_left_sign = "|",
        border_right_sign = "|",
        max_line_length = 120,
        sessions_window = {
          active_sign = " 󰄵 ",
          inactive_sign = " 󰄱 ",
          current_line_sign = "",
          border = {
            style = "rounded",
            text = {
              top = " Sessions ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        keymaps = {
          close = { "<C-c>" },
          yank_last = "<C-y>",
          yank_last_code = "<C-i>",
          scroll_up = "<C-k>",
          scroll_down = "<C-j>",
          new_session = "<C-n>",
          cycle_windows = "<Tab>",
          cycle_modes = "<C-f>",
          next_message = "J",
          prev_message = "K",
          select_session = "<CR>",
          rename_session = "r",
          delete_session = "d",
          draft_message = "<C-d>",
          edit_message = "e",
          delete_message = "d",
          toggle_parameters = "<C-o>",
          toggle_message_role = "<C-r>",
          toggle_system_role_open = "<C-s>",
          stop_generating = "<C-x>",
        },
      },
      -- {{{input}}} is always available as the selected/highlighted text
      actions = {
        grammar_correction = {
          type = "popup",
          template = "Correct the given text to standard {{{lang}}}:\n\n```{{{input}}}```",
          system = "You are a helpful note writing assistant, given a text input, correct the text only for grammar and spelling error. You are to keep all formatting the same, e.g. markdown bullets, should stay as a markdown bullet in the result, and indents should stay the same. Return ONLY the corrected text.",
          strategy = "replace",
          params = {
            temperature = 0.3,
          },
          args = {
            lang = {
              type = "string",
              optional = "true",
              default = "english",
            },
          },
        },
        translate = {
          type = "popup",
          template = "Translate this into {{{lang}}}:\n\n{{{input}}}",
          strategy = "display",
          params = {
            temperature = 0.3,
          },
          args = {
            lang = {
              type = "string",
              optional = "true",
              default = "vietnamese",
            },
          },
        },
        keywords = {
          type = "popup",
          template = "Extract the main keywords from the following text to be used as document tags.\n\n```{{{input}}}```",
          strategy = "display",
          params = {
            model = "general_model", -- use of model alias, generally, this model alias should be available to all providers in use
            temperature = 0.5,
            frequency_penalty = 0.8,
          },
        },
        do_complete_code = {
          type = "popup",
          template = "Code:\n```{{{filetype}}}\n{{{input}}}\n```\n\nCompleted Code:\n```{{{filetype}}}",
          strategy = "display",
          params = {
            model = "coder",
            stop = {
              "```",
            },
          },
        },

        quick_question = {
          type = "popup",
          args = {
            -- template expansion
            question = {
              type = "string",
              optional = "true",
              default = function()
                return vim.fn.input("question: ")
              end,
            },
          },
          system = "You are a helpful assistant",
          template = "{{{question}}}",
          strategy = "display",
        },

        custom_input = {
          type = "popup",
          args = {
            instruction = {
              type = "string",
              optional = "true",
              default = function()
                return vim.fn.input("instruction: ")
              end,
            },
          },
          system = "You are a helpful assistant",
          template = "Given the follow snippet, {{{instruction}}}.\n\nsnippet:\n```{{{filetype}}}\n{{{input}}}\n```",
          strategy = "display",
        },

        optimize_code = {
          type = "popup",
          system = "You are a helpful coding assistant. Complete the given prompt.",
          template = "Optimize the code below, following these instructions:\n\n{{{instruction}}}.\n\nCode:\n```{{{filetype}}}\n{{{input}}}\n```\n\nOptimized version:\n```{{{filetype}}}",
          strategy = "edit_code",
          params = {
            model = "coder",
            stop = {
              "```",
            },
          },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen" -- or "topline" or "screen"
    end,
    opts = {
      exit_when_last = false,
      animate = {
        enabled = false,
      },
      wo = {
        winbar = true,
        winfixwidth = true,
        winfixheight = false,
        winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
        spell = false,
        signcolumn = "no",
      },
      keys = {
        -- -- close window
        ["q"] = function(win)
          win:close()
        end,
        -- close sidebar
        ["Q"] = function(win)
          win.view.edgebar:close()
        end,
        -- increase width
        ["<S-Right>"] = function(win)
          win:resize("width", 3)
        end,
        -- decrease width
        ["<S-Left>"] = function(win)
          win:resize("width", -3)
        end,
        -- increase height
        ["<S-Up>"] = function(win)
          win:resize("height", 3)
        end,
        -- decrease height
        ["<S-Down>"] = function(win)
          win:resize("height", -3)
        end,
      },
      right = {
        {
          title = "OGPT Popup",
          ft = "ogpt-popup",
          size = { width = 0.2 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT Parameters",
          ft = "ogpt-parameters-window",
          size = { height = 6 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT Template",
          ft = "ogpt-template",
          size = { height = 6 },
        },
        {
          title = "OGPT Sessions",
          ft = "ogpt-sessions",
          size = { height = 6 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT System Input",
          ft = "ogpt-system-window",
          size = { height = 6 },
        },
        {
          title = "OGPT",
          ft = "ogpt-window",
          size = { height = 0.5 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT {{{selection}}}",
          ft = "ogpt-selection",
          size = { width = 80, height = 4 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPt {{{instruction}}}",
          ft = "ogpt-instruction",
          size = { width = 80, height = 4 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT Chat",
          ft = "ogpt-input",
          size = { width = 80, height = 4 },
          wo = {
            wrap = true,
          },
        },
      },
    },
  },
}
