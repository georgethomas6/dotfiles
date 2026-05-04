return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		keymap = {
			fzf = {
				["tab"] = "down", -- move down
				["shift-tab"] = "up", -- move up
				["enter"] = "accept", -- select
			},
		},
	},
	---@diagnostic enable: missing-fields
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [F]iles -- search files in current project directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[F]ind [G]rep -- grep current project directory",
		},
		{
			"<leader>fC",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [C]onfig -- search files in config",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [B]uiltins -- search builtin fuzzy finders",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "[F]ind [H]help -- search help files",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps -- search keymaps",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").colorschemes()
			end,
			desc = "[F]ind [C]olorschemes -- search all installed colorschemes",
		},
	},
}
