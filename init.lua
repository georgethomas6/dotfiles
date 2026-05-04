require("config.lazy")

-- TO INSTALL PARSERS RUN THE COMMAND :TSInstall <language name>

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype

		-- optionally restrict to known languages
		local enabled = {
			c = true,
			lua = true,
			python = true,
			html = true,
			javascript = true,
		}

		if enabled[ft] then
			vim.treesitter.start(args.buf)
		end
	end,
})
