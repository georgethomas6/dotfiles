
## Package manager

For the package manager I am using Lazy.nvim.
The code in the `nvim/lua/config/lazy.lua` file is mostly copied from the docs.
The only original code in this file are the autocommand to save the theme picked by the fzflua colorschemes picker, and the setting of the leader key.

## Options

All options are set in the `nvim/lua/config/options.lua` file, this file is well documented.

## Keymaps 

Keymaps that need to be loaded on startup should be put in this file.

## Autocomplete, LSP, and Autoformatting

These are handled by blink-cmp, lsp config and conform.nvim. 
These files are well documented.
Lsp config is used to download and manage LSPs and formatters installed.
Conform handles autosaving, and blink handles autocompletion.
Blink is well documented if it needs to be updated.

## Fzflua

This is our file picker, it is very good.
Type `<leader>fk` to see all the configured keybindings for pickers.

## Project

This plugin helps fzflua find the root directory.

## Snacks 

This plugin makes the ui better for lists.

## Colorschemes

Kanagawa, Rose-pine, and Base16 are the colorschemes installed.

## Lualine

Prettier status line.

## Oil

File searching plugin.
