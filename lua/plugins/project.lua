return {
	"ahmedkhalf/project.nvim",
	init = function()
		require("project_nvim").setup({
			detection_methods = { "pattern" },
		})
	end,
}
