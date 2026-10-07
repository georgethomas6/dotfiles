return {
	"RRethy/base16-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local colors = require("colors.palette")

		require("base16-colorscheme").setup(colors)
		vim.opt.termguicolors = true

		vim.api.nvim_create_user_command("ReloadColors", function()
			package.loaded["colors.palette"] = nil

			local colors = require("colors.palette")
			require("base16-colorscheme").setup(colors)
		end, {})
	end,
}
