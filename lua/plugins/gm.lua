return {
  "kiddos/gemini.nvim",
  build = { "pip install -r requirements.txt", ":UpdateRemotePlugins" },
  config = function()
    require("gemini").setup()
  end,
  -- keys = {
  --   {
  --     "<leader>gm",
  --     ":GeminiChat<cr>",
  --     desc = "Gemini Chat",
  --   },
  -- },
}
