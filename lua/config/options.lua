vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = false -- Set realtive numbered lines
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
vim.o.wrap = false -- Display lines as one long line
vim.o.linebreak = true -- Don't split words
vim.o.autoindent = true -- Copy indent from current line when starting new line
vim.o.ignorecase = true -- Case-insensitive searching unless capital in search
vim.o.smartcase = true -- Smart Case
vim.o.shiftwidth = 2 -- The number of spaces inserted for each indent
vim.o.tabstop = 2 -- Insert n spaces for a tab
vim.o.softtabstop = 2 -- Number of spaces that a tab counts for
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.scrolloff = 15 -- Number of lines between the end of screen and cursor line
vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
vim.o.cursorline = true -- Highlight the current line
vim.o.hlsearch = false -- Set highlight on search
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
vim.o.whichwrap = "bs<>[]hl" -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.swapfile = false -- Creates a swapfile
vim.o.smartindent = true -- Make indenting smarter again
vim.o.showtabline = 0 -- Always show tabs
vim.o.backspace = "indent,eol,start" -- Allow backspace on
vim.o.pumheight = 10 -- Pop up menu height
vim.wo.signcolumn = "yes" -- Keep signcolumn on by default
vim.o.fileencoding = "utf-8" -- The encoding written to a file
vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages
vim.o.breakindent = true -- Enable break indent
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 1000 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.o.backup = false -- Creates a backup file
vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.undofile = true -- Save undo history
vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience (default: 'menu,preview')
vim.opt.shortmess:append("c") -- Don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.splitright = true

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})
