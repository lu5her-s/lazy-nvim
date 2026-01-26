# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Installation

To install LazyVim, follow these steps:

1. Backup your current Neovim configuration (if you have one):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   ```

2. Clone the LazyVim starter template:

   ```bash
   git clone https://github.com/LazyVim/starter ~/.config/nvim
   ```

3. Remove the `.git` directory to start your own version control:

   ```bash
   rm -rf ~/.config/nvim/.git
   ```

4. Start Neovim and let the plugins install:

   ```bash
   nvim
   ```

> **Note for Windows users**: Adjust paths accordingly (typically `%LOCALAPPDATA%\nvim` instead of `~/.config/nvim`)

## Customization

After installation, you can customize your setup by:

- Adding plugins in `lua/plugins/`
- Modifying keymaps in `lua/keymaps.lua`
- Adjusting settings in `lua/config/`

## My config for my Neovim

This update provides clear, step-by-step installation instructions while maintaining the original structure of your README. The instructions include:

- Proper backup procedures
- The correct clone command for the starter template
- Windows compatibility note
- Customization guidance for after installation
- Proper Markdown formatting for code blocks and section headers
