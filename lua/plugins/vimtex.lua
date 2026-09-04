return {
	"lervag/vimtex",
	lazy = false,

	init = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1

		-- Don't let VimTeX automatically compile.
		vim.g.vimtex_compiler_auto_compile = 0
	end,

	config = function()
		vim.keymap.set("n", "<leader>v", "<cmd>VimtexView<CR>", { silent = true })
	end,
}
--[[
return {
  "lervag/vimtex",
  lazy = false,

  init = function()
    vim.g.vimtex_compiler_enabled = false
    vim.g.vimtex_view_method = "skim"
  end,

  config = function()
    vim.keymap.set("n", "<leader>v", function()
      vim.fn.jobstart({
        "open",
        "-a",
        "Skim",
        vim.fn.expand("%:p:r") .. ".pdf",
      }, { detach = true })
    end, { silent = true })
  end,
}
--]]
