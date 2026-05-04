vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Opens parent directory in oil" })
vim.keymap.set("n", "ca", function()
	vim.diagnostic.open_float()
end, { desc = "Opens diagnostics in flaot" })
