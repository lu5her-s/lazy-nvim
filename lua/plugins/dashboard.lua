return {

  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
    dashboard.section.header.opts.hl = "DashboardHeader"

    dashboard.section.buttons.val = {
      -- dashboard.button("e", "New file", "<cmd>ene <CR>"),
      -- dashboard.button("SPC s f", "Find file"),
      -- dashboard.button("SPC s o", "Recently opened files"),
      -- dashboard.button("leader s r", "Resume Telescope", "<cmd>Telescope resume<cr>"),
      -- dashboard.button("leader s g", "Find word", "<cmd>Telescope live_grep<cr>"),
      -- dashboard.button("leader s b", "Open buffers", "<cmd>Telescope buffers<cr>"),
      -- dashboard.button("p", " " .. "Open project", "<cmd>Telescope project display_type=full<cr>"),
      dashboard.button("e", " " .. "New file", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("f", " " .. "Find file", "<cmd>cd $HOME/Projects | Telescope find_files<cr>"),
      dashboard.button("r", " " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
      dashboard.button("s", "勒" .. "Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("c", " " .. "Config", ":e $MYVIMRC | :cd %:p:h | Telescope file_browser<cr>"),
      dashboard.button("l", "鈴" .. "Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("m", " " .. "Mason", "<cmd>Mason<cr>"),
      dashboard.button("q", " " .. "Quit", "<cmd>qa<cr>"),
    }
    _Gopts = {
      position = "center",
      hl = "Type",
      -- wrap = "overflow";
    }

    local function footer()
      return "Make your world with your hands!"
    end

    dashboard.section.footer.val = footer()

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
