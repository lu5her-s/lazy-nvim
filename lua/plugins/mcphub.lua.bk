return {
  "ravitemer/mcphub.nvim",
  event = "VeryLazy",
  -- Dependencies for async operations and UI components (adjust as needed)
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Optional: "nvim-telescope/telescope.nvim" for picker interfaces
  },
  -- Installs the mcp-hub Express server globally via npm
  build = "npm install -g mcp-hub@latest",
  -- build = "bundled_build.lua",
  use_budled_binary = true,
  -- cmd = "MCPHub",
  opts = {
    auto_approve = true,
  },
  config = function()
    -- Basic setup - detailed configuration below
    require("mcphub").setup({
      extensions = {
        avante = {
          make_slash_commands = true,
        },
      },
      port = 3000, -- Port for the mcp-hub Express server
      -- CRITICAL: Must be an absolute path
      config = vim.fn.expand("~/.config/nvim/mcpservers.json"),
      log = {
        level = vim.log.levels.WARN, -- Adjust verbosity (DEBUG, INFO, WARN, ERROR)
        to_file = true, -- Log to ~/.local/state/nvim/mcphub.log
      },
      on_ready = function(hub)
        vim.notify("MCP Hub backend server is initialized and ready.", vim.log.levels.INFO)
      end,
    })
  end,
  -- Optional: lazy = false -- if you want it to load immediately on startup
}
