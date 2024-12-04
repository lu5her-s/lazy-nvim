--[[--
File              : keymaps.lua
Author            : lu5her <lu5her@mail>
Date              : Tue Jan, 23 2024, 14:03 023
Last Modified Date: Wed Dec, 04 2024, 11:28 339
Last Modified By  : lu5her <lu5her@mail>
--]]
--
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<F2>", ":e<cr>")
vim.keymap.set("n", "zz", "i<c-m><esc>")
vim.keymap.set("n", "<c-l>", ":noh <cr>")
vim.keymap.set("n", "<leader>fd", ":TodoTelescope<cr>", { desc = "Todo Telescope" })

if vim.fn.executable("gitui") == 1 then
  -- gitui instead of lazygit
  vim.keymap.set("n", "<leader>gg", function()
    require("lazyvim.util").float_term({ "gitui" })
  end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function()
    require("lazyvim.util").float_term({ "gitui" }, { cwd = require("lazyvim.util").get_root() })
  end, { desc = "gitui (root dir)" })
end

if vim.fn.executable("btop") == 1 then
  -- btop
  vim.keymap.set("n", "<leader>xb", function()
    require("lazyvim.util").float_term({ "btop" })
  end, { desc = "btop" })
end

vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "Open Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "Open Quickfix List (Trouble)" })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)

-- keymap for external command djlint % --reformat
vim.keymap.set("n", "<leader>dj", ":!djlint % --reformat<CR>")

-- BufferLine
vim.keymap.set(
  "n",
  "<Tab>",
  ":BufferLineCycleNext<CR>",
  { noremap = true, silent = true, remap = true, desc = "BufferLineCycleNext" }
)
-- vim.keymap.set(
--   "n",
--   "<S-Tab>",
--   ":BufferLineCyclePrev<CR>",
--   { noremap = true, silent = true, remap = true, desc = "BufferLineCyclePrev" }
-- )

-- for chatgpt

-- load Which-key
require("which-key").setup()

-- keymap for Telescope import
vim.keymap.set("n", "<leader>ti", "<cmd>Telescope import<cr>", { desc = "Telescope import" })

-- keymap for codeium
vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

-- Generate image of lines in a visual selection
vim.keymap.set("v", "<Leader>cxs", function()
  require("nvim-silicon").shoot()
end, { desc = "Generate code screenshot" })
-- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set("v", "<Leader>cxbs", function()
  require("nvim-silicon").file()
end, { desc = "Generate code screenshot as file" })
-- Generate visible portion of a buffer
vim.keymap.set("n", "<Leader>cxs", function()
  require("nvim-silicon").clip()
end, { desc = "Generate code screenshot to clipboard" })

-- -- Generate image of lines in a visual selection
-- vim.keymap.set("v", "<Leader>cxs", function()
--   silicon.visualise_api()
-- end)
-- -- Generate image of a whole buffer, with lines in a visual selection highlighted
-- vim.keymap.set("v", "<Leader>cxbs", function()
--   silicon.visualise_api({ to_clip = true, show_buf = true })
-- end)
-- -- Generate visible portion of a buffer
-- vim.keymap.set("n", "<Leader>cxs", function()
--   silicon.visualise_api({ to_clip = true, visible = true })
-- end)
-- -- Generate current buffer line in normal mode
-- vim.keymap.set("n", "<Leader>cxs", function()
--   silicon.visualise_api({ to_clip = true })
-- end)

-- set keymap for lorem.nvim in mode n,i if i mode set esc to n mode
-- vim.keymap.set("n", "<Leader>r", ":LoremIpsum ", { desc = "Lorem" })

-- key for codecompanion
vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>[", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>[", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
--
-- -- Expand 'cc' into 'CodeCompanion' in the command line
-- vim.cmd([[cab cc CodeCompanion]])

-- set F5 to :AWStart and F6 to :AWStatus
-- vim.api.nvim_set_keymap("n", "<F5>", ":AWStart<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<F6>", ":AWStatus<cr>", { noremap = true, silent = true })
