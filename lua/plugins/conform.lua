return {
	"stevearc/conform.nvim",

	opts = {
		formatters_by_ft = {
			-- Lua
			lua = { "stylua" },

			-- C
			-- clangd handles formatting when no dedicated formatter is configured.
			c = { lsp_format = "fallback" },

			-- Python
			python = { "isort", "black" },

			-- JavaScript
			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},

			-- HTML
			html = {
				"prettier",
				stop_after_first = true,
			},

			-- LaTeX
			tex = { "latexindent" },
		},

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
