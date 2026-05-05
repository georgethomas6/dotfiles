return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_compiler_latexmk = {
			continuous = 0,
		}
		vim.api.nvim_set_keymap("n", "<leader>v", ":VimtexView<CR>", { noremap = true, silent = true })
	end,
	keys = {},
}
