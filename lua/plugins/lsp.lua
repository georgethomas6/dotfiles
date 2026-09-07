return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {},
		},
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
	},

	config = function()
		-- LSP servers use Neovim's configuration names.
		local servers = {
			clangd = {},
			pyright = {},
			ts_ls = {},
			texlab = {},
			checkmake = {},

			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
						format = {
							enable = false,
						},
					},
				},
			},
		}

		-- Mason uses its own package names, which are not always
		-- identical to the Neovim LSP server names above.
		require("mason-tool-installer").setup({
			ensure_installed = {
				"clangd",
				"pyright",
				"typescript-language-server",
				"texlab",
				"checkmake",
				"lua-language-server",
			},
		})

		-- Configure and enable the LSP servers.
		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		-- LSP keymaps and features.
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf, silent = true }

				vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, opts)

				-- Highlight references under the cursor.
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd("CursorMoved", {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end

				-- Enable inlay hints when supported.
				if client and client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, {
						bufnr = event.buf,
					})
				end
			end,
		})

		-- Diagnostics.
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = {
				severity = {
					min = vim.diagnostic.severity.ERROR,
				},
			},
			severity_sort = true,
			float = {
				border = "rounded",
				source = "if_many",
			},
		})

		-- Show diagnostics on the current line with K.
		vim.keymap.set("n", "K", function()
			local diagnostics = vim.diagnostic.get(0, {
				lnum = vim.fn.line(".") - 1,
			})

			if #diagnostics > 0 then
				vim.diagnostic.open_float()
			else
				vim.lsp.buf.hover()
			end
		end, { silent = true })
	end,
}
