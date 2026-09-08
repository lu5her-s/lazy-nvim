local user = require("config.user")

return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  -- keys = {
  --   { "<leader>cxc", "<cmd>Silicon<cr>", desc = "Screenshot" },
  --   -- v mode
  --   { "<leader>cxv", "<cmd>Silicon<cr>", mode = "v", desc = "Screenshot" },
  -- },
  opts = {
    -- Configuration here, or leave empty to use defaults
    line_offset = function(args)
      return args.line1
    end,
    font = "Iosevka Nerd Font Mono",
    output = function()
      return user.screenshots_dir .. os.date("!%Y-%m-%d-%H%M%S") .. "_code.png"
    end,
    window_title = function()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
    end,
    theme = "gruvbox-dark",
  },
}
