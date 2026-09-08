--[[-- ------------------------------------------------------------------
File              : keymaps.lua
Author            : lu5her <lu5her@mail>
Date              : Tue Jan, 23 2024, 14:03 023
Last Modified Date: Wed Dec, 04 2024, 11:28 339
Last Modified By  : lu5her <lu5her@mail>
--]] --------------------------------------------------------------------
--
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ---------------------------------------------------------------------------
-- General
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<F2>", ":e<cr>")
vim.keymap.set("n", "<c-l>", ":noh <cr>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>fd", ":TodoTelescope<cr>", { desc = "Todo Telescope" })
vim.keymap.set("n", "<leader>dj", ":!djlint % --reformat<CR>", { desc = "Reformat with djlint" })

-- ---------------------------------------------------------------------------
-- Git (gitui instead of lazygit)
-- ---------------------------------------------------------------------------
if vim.fn.executable("gitui") == 1 then
  vim.keymap.set("n", "<leader>gg", function()
    require("lazyvim.util").float_term({ "gitui" })
  end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function()
    require("lazyvim.util").float_term({ "gitui" }, { cwd = require("lazyvim.util").get_root() })
  end, { desc = "gitui (root dir)" })
end

-- ---------------------------------------------------------------------------
-- System monitor
-- ---------------------------------------------------------------------------
if vim.fn.executable("btop") == 1 then
  vim.keymap.set("n", "<leader>xb", function()
    require("lazyvim.util").float_term({ "btop" })
  end, { desc = "btop" })
end

-- ---------------------------------------------------------------------------
-- Trouble
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { desc = "Open Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { desc = "Open Quickfix List (Trouble)" })

-- ---------------------------------------------------------------------------
-- Neogen (annotations)
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<Leader>nf", function()
  require("neogen").generate()
end, { desc = "Generate annotations" })

-- ---------------------------------------------------------------------------
-- BufferLine
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- ---------------------------------------------------------------------------
-- Insert-mode quick movements (ported from autoclose.vim)
-- ---------------------------------------------------------------------------
vim.keymap.set({ "i", "c" }, "\\h", "<Left>", { desc = "Move left" })
vim.keymap.set({ "i", "c" }, "\\j", "<Down>", { desc = "Move down" })
vim.keymap.set({ "i", "c" }, "\\k", "<Up>", { desc = "Move up" })
vim.keymap.set({ "i", "c" }, "\\l", "<Right>", { desc = "Move right" })
vim.keymap.set({ "i", "c" }, "\\A", "<Esc>A", { desc = "Append at end of line" })
vim.keymap.set({ "i", "c" }, "\\a", "<Esc>a", { desc = "Append after cursor" })
vim.keymap.set({ "i", "c" }, "\\O", "<Esc>O", { desc = "New line above" })
vim.keymap.set({ "i", "c" }, "\\o", "<Esc>o", { desc = "New line below" })

-- ---------------------------------------------------------------------------
-- Telescope
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<leader>ti", "<cmd>Telescope import<cr>", { desc = "Telescope import" })

-- ---------------------------------------------------------------------------
-- Codeium
-- ---------------------------------------------------------------------------
vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Accept Codeium suggestion" })

-- ---------------------------------------------------------------------------
-- CodeCompanion
-- ---------------------------------------------------------------------------
vim.keymap.set("n", "<LocalLeader>[", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion Chat" })
vim.keymap.set("v", "<LocalLeader>[", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion Chat" })

-- ---------------------------------------------------------------------------
-- Clipboard
-- ---------------------------------------------------------------------------
vim.keymap.set("v", "<C-S-c>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<C-S-v>", '"+p', { desc = "Paste from system clipboard" })

-- ---------------------------------------------------------------------------
-- Silicon (code screenshots)
-- ---------------------------------------------------------------------------
local wk = require("which-key")
wk.add({
  mode = { "v", "n" },
  { "<leader>c", group = "Silicon" },
  {
    "<leader>cxb",
    function()
      require("nvim-silicon").clip()
    end,
    desc = "Copy code screenshot to clipboard",
  },
  {
    "<leader>cxf",
    function()
      require("nvim-silicon").file()
    end,
    desc = "Save code screenshot as file",
  },
  {
    "<leader>cxc",
    function()
      require("nvim-silicon").shoot()
    end,
    desc = "Create code screenshot",
  },
})