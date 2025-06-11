return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    -- provider = "g4f",
    -- providers = {
    --   g4f = {
    --     __inherited_from = "openai",
    --     api_key = "secret",
    --     endpoint = "http://localhost:8080/v1",
    --     model = "default",
    --     extra_request_body = {
    --       timeout = 30000, -- in milliseconds
    --       temperature = 0.75,
    --       max_completion_tokens = 8192,
    --     },
    --   },
    -- },
    file_selector = {
      provider = "snacks",
    },
    hints = {
      enabled = false,
    },
    -- -- system_prompt as function ensures LLM always has latest MCP server state
    -- -- This is evaluated for every message, even in existing chats
    -- system_prompt = function()
    --   local hub = require("mcphub").get_hub_instance()
    --   if hub and hub.get_active_servers_prompt then
    --     return hub:get_active_servers_prompt()
    --   else
    --     return "No active MCP servers"
    --   end
    -- end,
    -- system_prompt = function()
    --   local hub = require("mcphub").get_hub_instance()
    --   return hub:get_active_servers_prompt()
    -- end,
    -- -- Using function prevents requiring mcphub before it's loaded
    -- custom_tools = function()
    --   return {
    --     require("mcphub.extensions.avante").mcp_tool(),
    --   }
    -- end,
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
      -- provider = "g4f",
      -- provider = "openrouter",
      -- auto_suggestions_provider = "g4f",
      -- vendors = {
      --   openrouter = {
      --     __inherited_from = "openai",
      --     endpoint = "https://openrouter.ai/api/v1",
      --     api_key_name = os.getenv("OPENROUTER_API_KEY"),
      --     model = "qwen/qwen3-32b:free",
      --   },
      -- },
      -- gemini = {
      --   -- model = "gemini-1.5-flash-latest",
      --   model = "gemini-2.0-flash",
      -- },
      --
      -- openai = {
      --   api_key = "secret",
      --   endpoint = "http://localhost:8080/v1",
      --   -- endpoint = "https://6fc7-103-151-252-78.ngrok-free.app/v1",
      --   model = "default",
      -- },
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

      -- setup for mcphub
      -- other config
      -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
      -- system_prompt = function()
      --   local hub = require("mcphub").get_hub_instance()
      --   return hub:get_active_servers_prompt()
      -- end,
      -- -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      -- custom_tools = function()
      --   return {
      --     require("mcphub.extensions.avante").mcp_tool(),
      --   }
      -- end,
    })
  end,
}
