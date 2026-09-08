# nvim — LazyVim config

My personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Requirements

- Neovim **0.11+**
- Git
- A Nerd Font (for icons)
- Optional: a local AI proxy at `http://localhost:20128` for CodeCompanion

## Installation

1. Backup your current config:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   ```

2. Clone into place:

   ```bash
   git clone <repo-url> ~/.config/nvim
   ```

3. Start Neovim — plugins install automatically:

   ```bash
   nvim
   ```

## Configuration structure

| Path | Purpose |
|------|---------|
| `lua/config/options.lua` | Editor options & global settings |
| `lua/config/keymaps.lua` | Keymaps |
| `lua/config/autocmds.lua` | Autocommands |
| `lua/config/lazy.lua` | lazy.nvim bootstrap & LazyVim import |
| `lua/config/user.lua` | **Personal paths & identity — edit this** |
| `lua/config/env.lua` | API keys read from environment variables |
| `lua/plugins/*.lua` | Plugin specs |
| `lua/plugins/lang/*.lua` | Per-language config (treesitter parsers, etc.) |
| `lazyvim.json` | Enabled LazyVim extras |

## Personalization

Edit `lua/config/user.lua` to change:

- `projects_dir` — root scanned by `Telescope project` (default `~/01-Projects/`)
- `screenshots_dir` — where `nvim-silicon` saves code screenshots
- `python3_host` — python3 host program for Neovim
- `author`, `author_email`, `timestamp_format` — used by `vim-header` (`<F4>`)

## AI — CodeCompanion

This config uses [CodeCompanion](https://github.com/olimorris/codecompanion.nvim) as the
sole AI assistant, wired to a local proxy at `http://localhost:20128` through the `aiy` adapter.
The chat system prompt ("อัย") lives in `lua/config/aiy_prompt.lua`.

Extra integrations:

- [mcphub.nvim](https://github.com/ravitemer/mcphub.nvim) — MCP server management
- [codecompanion-history.nvim](https://github.com/ravitemer/codecompanion-history.nvim) — chat history & summaries
- [codecompanion-spinner.nvim](https://github.com/franco-ruggeri/codecompanion-spinner.nvim) — progress spinner

Set the API key in your shell profile (never commit keys):

```bash
export AIY_API_KEY="sk-..."
```

Keymap:

- `<LocalLeader>[` (`\` + `[`) — toggle chat

## Notable keymaps

Leader key is `\`.

| Key | Action |
|-----|--------|
| `<F2>` | Reload current file |
| `<F3>` | Cheatsheet |
| `<F4>` | Add file header (vim-header) |
| `<F6>` | Toggle transparent background |
| `<F8>` | Tagbar toggle |
| `<Tab>` / `<S-Tab>` | Cycle buffers |
| `<leader>fd` | Todo Telescope |
| `<leader>fp` | Find project |
| `<leader>ti` | Telescope import |
| `<leader>cx` | Code screenshots (silicon) |
| `ys<motion>"` | Surround a motion with `"` (e.g. `ysiw"`) |
| `S"` | Surround visual selection (visual mode) |
| `ds"` | Delete surrounding `"` |
| `cs"'` | Change surrounding `"` to `'` |
| `<leader>bd` / `<leader>bD` | Delete buffer / force |
| `<leader>gg` | gitui (floating) |

## Notable plugins

- [alpha-nvim](https://github.com/goolord/alpha-nvim) — dashboard with fortune footer
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + project/undo/dap extensions
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) — file explorer
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) — auto pairs
- [nvim-transparent](https://github.com/xiyaowong/nvim-transparent) — transparency
- [nvim-silicon](https://github.com/michaelrommel/nvim-silicon) — code screenshots
- [markview.nvim](https://github.com/OXY2DEV/markview.nvim) — markdown rendering
- [codeium.vim](https://github.com/Exafunction/codeium.vim) — AI completions (`<C-g>` accept)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) — git diffs
- [nvim-surround](https://github.com/kylechui/nvim-surround) — add/delete/change surrounding delimiters

## Enabled LazyVim extras

Defined in `lazyvim.json`:

- Languages: `lang.python`, `lang.typescript`, `lang.json`, `lang.markdown`, `lang.toml`
- Tooling: `dap.core`, `test.core`, `coding.yanky`, `editor.inc-rename`, `editor.leap`, `util.dot`
- UI: `ui.alpha`, `ui.mini-indentscope`