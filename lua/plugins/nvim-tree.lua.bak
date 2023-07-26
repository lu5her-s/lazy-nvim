return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    {
      "<leader>t",
      ":NvimTreeToggle<cr>",
      desc = "Browse Files",
    },
  },
  config = function()
    require("nvim-tree").setup({
      sort_by = "modification_time",
      diagnostics = {
        enable = false,
        icons = { hint = "", info = "", warning = "", error = "" },
      },
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_netrw = true,
      ignore_ft_on_setup = { "dashboard" },
      -- auto_close = true,
      open_on_tab = false,
      hijack_cursor = true,
      update_cwd = true,
      update_focused_file = { enable = true, update_cwd = false },
      view = {
        adaptive_size = true,
        -- allow_resize = true,
        side = "left",
        --width = 25,
        relativenumber = true,
        number = true,
      },
      renderer = {
        indent_markers = { enable = true },
        root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1003), "?:gs?^??" }),
        highlight_git = true,
        highlight_opened_files = "none",
        add_trailing = false,
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = { file = true, folder = true, folder_arrow = true, git = true },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      git = { enable = true, ignore = true, timeout = 500 },
    })
  end,
}
