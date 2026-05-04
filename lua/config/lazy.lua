-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("config.options")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = {},
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- MAKES FZFLUA save the theme

local theme_cache = vim.fn.stdpath("data") .. "/last_theme.txt"
-- Function to load the saved theme
local function load_theme()
	local f = io.open(theme_cache, "r")
	if f then
		local theme = f:read("*all"):gsub("%s+", "")
		f:close()
		if theme ~= "" then
			pcall(vim.cmd.colorscheme, theme)
		end
	end
end

-- Create an autocommand to save the theme whenever it changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function(args)
		-- args.match is the name of the colorscheme being applied
		local f = io.open(theme_cache, "w")
		if f then
			f:write(args.match)
			f:close()
		end
	end,
})

load_theme()
require("config.keymaps")
