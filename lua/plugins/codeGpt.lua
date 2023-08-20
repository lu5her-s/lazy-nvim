return {
  "dpayne/CodeGPT.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("codegpt.config")
  end,
  -- keys = {
  --   {
  --     "<C-c>",
  --     ":Chat",
  --     desc = "CodeGpt",
  --   },
  -- },
  -- opts = {
  --   vim.g["codegpt_openai_api_key"] == "dEXMiu282AKk6PZO5JvJvpGXMjrqflV_YzTQ9yX1DdY",
  --   vim.g["codegpt_chat_completions_url"] == "https://chimeragpt.adventblocks.cc/api/v1/chat/completions",
  -- },
}
