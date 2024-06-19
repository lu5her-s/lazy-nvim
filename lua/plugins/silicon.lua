return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  opts = {
    -- Configuration here, or leave empty to use defaults
    line_offset = function(args)
      return args.line1
    end,
    font = "Iosevka Nerd Font Mono",
    output = function()
      -- code
      return "~/Pictures/Code/" .. os.date("!%Year-%m-%d-%H%M%SZ") .. "_code.png"
    end,
    window_title = function()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
    end,
    theme = "gruvbox-dark",
  },
  keys = {
    require("which-key").register({
      ["k"] = {
        name = "Silicon",
        ["s"] = {
          function()
            require("nvim-silicon").shoot()
          end,
          "Create code screenshot",
        },
        ["f"] = {
          function()
            require("nvim-silicon").file()
          end,
          "Save code screenshot as file",
        },
        ["c"] = {
          function()
            require("nvim-silicon").clip()
          end,
          "Copy code screenshot to clipboard",
        },
      },
    }, { prefix = "<leader>", mode = "v" }),
  },
}
