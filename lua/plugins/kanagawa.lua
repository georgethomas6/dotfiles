return {
	"rebelot/kanagawa.nvim",
	Lazy = true,
	priority = 1000,
	-- save opts so we can pass it to theme_switcher
	opts = {
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true }, -- You can still keep this if you want italic comments
		functionStyle = {},
		keywordStyle = {},
		statementStyle = {},
		typeStyle = { italic = false },
		theme = "dragon",
		transparent = true,
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "dragon",
		},
	},
}
