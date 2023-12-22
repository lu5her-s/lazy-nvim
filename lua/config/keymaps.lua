-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<f5>", ":e<cr>")
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

-- BufferLine
vim.keymap.set(
  "n",
  "<Tab>",
  ":BufferLineCycleNext<CR>",
  { noremap = true, silent = true, remap = true, desc = "BufferLineCycleNext" }
)
vim.keymap.set(
  "n",
  "<S-Tab>",
  ":BufferLineCyclePrev<CR>",
  { noremap = true, silent = true, remap = true, desc = "BufferLineCyclePrev" }
)

-- for chatgpt

-- load Which-key
require("which-key").setup()

-- Define ChatGpt command for Which-key
require("which-key").register({
  t = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  },
}, { prefix = "<leader>" })

-- for gp
-- VISUAL mode mappings
-- s, x, v modes are handled the same way by which_key
require("which-key").register({
  -- ...
  ["<C-x>"] = {
    c = { ":<C-u>'<,'>GpChatNew<cr>", "Visual Chat New" },
    t = { ":<C-u>'<,'>GpChatToggle<cr>", "Visual Popup Chat" },

    r = { ":<C-u>'<,'>GpRewrite<cr>", "Visual Rewrite" },
    a = { ":<C-u>'<,'>GpAppend<cr>", "Visual Append" },
    b = { ":<C-u>'<,'>GpPrepend<cr>", "Visual Prepend" },
    e = { ":<C-u>'<,'>GpEnew<cr>", "Visual Enew" },
    p = { ":<C-u>'<,'>GpPopup<cr>", "Visual Popup" },
    s = { "<cmd>GpStop<cr>", "Stop" },
  },
  -- ...
}, {
  mode = "v", -- VISUAL mode
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- NORMAL mode mappings
require("which-key").register({
  -- ...
  ["<C-x>"] = {
    c = { "<cmd>GpChatNew<cr>", "New Chat" },
    t = { "<cmd>GpChatToggle<cr>", "Toggle Popup Chat" },
    f = { "<cmd>GpChatFinder<cr>", "Chat Finder" },

    r = { "<cmd>GpRewrite<cr>", "Inline Rewrite" },
    a = { "<cmd>GpAppend<cr>", "Append" },
    b = { "<cmd>GpPrepend<cr>", "Prepend" },
    e = { "<cmd>GpEnew<cr>", "Enew" },
    p = { "<cmd>GpPopup<cr>", "Popup" },
    s = { "<cmd>GpStop<cr>", "Stop" },
  },
  -- ...
}, {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- INSERT mode mappings
require("which-key").register({
  -- ...
  ["<C-x>"] = {
    c = { "<cmd>GpChatNew<cr>", "New Chat" },
    t = { "<cmd>GpChatToggle<cr>", "Toggle Popup Chat" },
    f = { "<cmd>GpChatFinder<cr>", "Chat Finder" },

    r = { "<cmd>GpRewrite<cr>", "Inline Rewrite" },
    a = { "<cmd>GpAppend<cr>", "Append" },
    b = { "<cmd>GpPrepend<cr>", "Prepend" },
    e = { "<cmd>GpEnew<cr>", "Enew" },
    p = { "<cmd>GpPopup<cr>", "Popup" },
    s = { "<cmd>GpStop<cr>", "Stop" },
  },
  -- ...
}, {
  mode = "i", -- INSERT mode
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})
