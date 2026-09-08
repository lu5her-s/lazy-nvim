return {

  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                  :                                          ,;              ]],
      [[            i     Ef                    .    .             f#i   j.          ]],
      [[           LE     E#t                   Di   Dt          .E#t    EW,         ]],
      [[          L#E     E#t      :,,,,,,,,,,  E#i  E#i        i#W,     E##j        ]],
      [[         G#W.     E#t      E########D,  E#t  E#t       L#D.      E###D.      ]],
      [[        D#K.      E#t fi   E#K......    E#t  E#t     :K#Wfff;    E#jG#W;     ]],
      [[       E#K.       E#t L#j  E#E          E########f.  i##WLLLLt   E#t t##f    ]],
      [[     .E#E.        E#t L#L  E#Wfffff:    E#j..K#j...   .E#L       E#t  :K#E:  ]],
      [[    .K#E          E#tf#E:  jLLLE##t     E#t  E#t        f#E:     E#KDDDD###i ]],
      [[   .K#D           E###f       ;#K,      E#t  E#t         ,WW;    E#f,t#Wi,,, ]],
      [[  .W#G            E#K,       j#D.       f#t  f#t          .D#;   E#t  ;#W:   ]],
      [[ :W##########Wt   EL        G#f          ii   ii            tt   DWi   ,KK:  ]],
      [[ :,,,,,,,,,,,,,.  :        D#;                                               ]],
      [[                           G:                                                ]],
    }
    dashboard.section.header.opts.hl = "DashboardHeader"

    dashboard.section.buttons.val = {
      dashboard.button("e", " " .. "New file", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("r", " " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
      dashboard.button("s", " " .. "Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("c", " " .. "Config", ":e $MYVIMRC | :cd %:p:h | Telescope file_browser<cr>"),
      dashboard.button("l", " " .. "Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("x", " " .. "LazyExtras", "<cmd>LazyExtras<cr>"),
      dashboard.button("m", " " .. "Mason", "<cmd>Mason<cr>"),
      dashboard.button("q", " " .. "Quit", "<cmd>qa<cr>"),
    }
    dashboard.section.footer.opts = {
      position = "center",
      hl = "Type",
    }

    local function footer()
      local info = {}
      local fortune = require("fortune").get_fortune()
      local footer = vim.list_extend(info, fortune)
      return footer
    end

    dashboard.section.footer.val = footer()

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
