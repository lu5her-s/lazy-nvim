-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Function to apply transparency settings globally
local function set_transparency()
  vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE
hi PmenuSel guibg=NONE ctermbg=NONE
hi NeoTreeNormal guibg=NONE ctermbg=NONE
hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
]])
end

-- Apply transparency settings initially
set_transparency()

-- Reapply transparency on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = set_transparency,
})

-- function Transparent(color)
--   color = color or "tokyonight"
--   vim.cmd.colorscheme(color)
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
-- Transparent()

-- Function to apply transparency settings globally
-- local function set_transparency()
--   vim.cmd([[
-- hi Normal guibg=NONE ctermbg=NONE
-- hi NormalNC guibg=NONE ctermbg=NONE
-- hi SignColumn guibg=NONE ctermbg=NONE
-- hi StatusLine guibg=NONE ctermbg=NONE
-- hi StatusLineNC guibg=NONE ctermbg=NONE
-- hi VertSplit guibg=NONE ctermbg=NONE
-- hi TabLine guibg=NONE ctermbg=NONE
-- hi TabLineFill guibg=NONE ctermbg=NONE
-- hi TabLineSel guibg=NONE ctermbg=NONE
-- hi Pmenu guibg=NONE ctermbg=NONE
-- hi PmenuSel guibg=NONE ctermbg=NONE
-- hi NeoTreeNormal guibg=NONE ctermbg=NONE
-- hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
-- hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
-- ]])
-- end
--
-- -- Apply transparency settings initially
-- set_transparency()
--
-- -- Set up neo-tree with default settings and no custom mappings
-- require("neo-tree").setup({
--   window = {
--     -- Use default settings with no custom mappings
--   },
-- })
--
-- -- Reapply transparency on buffer enter
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = set_transparency,
-- })
