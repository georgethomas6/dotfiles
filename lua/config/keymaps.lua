vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Opens parent directory in oil" })
vim.keymap.set("n", "ca", function()
	vim.diagnostic.open_float()
end, { desc = "Opens diagnostics in flaot" })

local function run_make_in_project()
	local project = require("project_nvim.project")
	local root = project.get_project_root()

	if not root then
		vim.notify("No project root found", vim.log.levels.ERROR)
		return
	end

	if vim.fn.filereadable(root .. "/Makefile") == 0 then
		vim.notify("No Makefile found", vim.log.levels.WARN)
		return
	end

	vim.notify("Running make...")

	vim.fn.jobstart("make", {
		cwd = root,
		stdout_buffered = true,
		stderr_buffered = true,

		-- ignore all output completely
		on_stdout = function() end,
		on_stderr = function() end,

		on_exit = function(_, code)
			if code == 0 then
				vim.notify("Build succeeded ✓", vim.log.levels.INFO)
			else
				vim.notify("Build failed x", vim.log.levels.ERROR)
			end
		end,
	})
end

vim.keymap.set(
	"n",
	"<leader>c",
	run_make_in_project,
	{ desc = "Looks for a make file in the root directory of the project and tries to execute it if it exists" }
)
