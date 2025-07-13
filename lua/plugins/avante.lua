return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- lazy = false,
  version = false, -- set this if you want to always pull the latest change
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here

    file_selector = {
      provider = "snacks",
    },
    hints = {
      enabled = false,
    },
  },
  keys = {
    {
      -- add key for img-clip use <leader>aip
      "<leader>aip",
      function()
        return vim.bo.filetype == "AvanteInput" and require("clipboard").paste_image()
          or require("img-clip").paste_image()
      end,
      desc = "Paste image from clipboard",
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    -- "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- "ravitemer/mcphub.nvim",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    require("avante").setup({
      web_search_engine = {
        provider = "google",
      },
      provider = "g4f",
      auto_suggestions_provider = "g4f",
      providers = {
        g4f = {
          __inherited_from = "openai",
          api_key = "secret",
          endpoint = "http://localhost:8080/v1",
          model = "default",
        },
      },
    })
  end,
}
