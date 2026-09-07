return {
	"saghen/blink.cmp",
	version = "2.*",
	event = "VimEnter",
	build = function()
		require("blink.cmp").build():pwait()
	end,
	dependencies = {
		{
			"saghen/blink.lib",
		},

		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
	},

	opts = {
		keymap = {
			preset = "none",

			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<C-j>"] = { "select_next" },
			["<C-k>"] = { "select_prev" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 500,
				window = {
					border = "single",
				},
			},

			menu = {
				auto_show = true,
				border = "single",
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
			},
		},

		snippets = {
			preset = "luasnip",
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},

		signature = {
			enabled = true,
			window = {
				border = "single",
			},
		},
	},
}
