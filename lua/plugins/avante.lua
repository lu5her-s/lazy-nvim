return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
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
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
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
      provider = "openai",
      auto_suggestions_provider = "openai",
      -- gemini = {
      --   -- model = "gemini-1.5-flash-latest",
      --   model = "gemini-2.0-flash",
      -- },

      openai = {
        -- api_key = "secret",
        -- endpoint = "http://localhost:1337/v1",
        endpoint = "https://6fc7-103-151-252-78.ngrok-free.app/v1",
        model = "gpt-4o",
        -- model = "o1",
      },
      web_search_engine = {
        provider = "google",
      },
      -- provider = "deepseek",
      -- auto_suggestions_provider = "deepseek",
      -- vendors = {
      --   deepseek = {
      --     -- __inherited_from = "openai",
      --     -- api_key_name = "secret",
      --     endpoint = "http://localhost:1337/v1",
      --     model = "deepseek-v3",
      --   },
      -- },
      -- provider = "deepseek",
      -- vendors = {
      --   deepseek = {
      --     __inherited_from = "openai",
      --     api_key_name = "DEEPSEEK_API_KEY",
      --     -- api_key = "secret",
      --     endpoint = "http://localhost:1337/v1",
      --     model = "gpt-4o",
      --   },
      -- },
    })
  end,
}
