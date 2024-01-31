return {
	"andythigpen/nvim-coverage",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		require("coverage").setup({
			auto_reload = true,
			lang = {
				go = {
					coverage_file = "coverage/coverage.out",
				},
			},
		})
	end,
	keys = {
		{
			"<leader>tc",
			desc = "Coverage",
		},
		{
			"<leader>tcr",
			function()
				io.popen("mkdir " .. vim.loop.cwd() .. "/coverage")
				require("neotest").run.run({
					extra_args = { "-coverprofile=" .. vim.loop.cwd() .. "/coverage/coverage.out" },
				})
			end,
			desc = "Run Nearest",
		},
		{
			"<leader>tct",
			function()
				io.popen("mkdir " .. vim.loop.cwd() .. "/coverage")
				require("neotest").run.run({
					vim.fn.expand("%"),
					extra_args = { "-coverprofile=" .. vim.loop.cwd() .. "/coverage/coverage.out" },
				})
			end,
			desc = "Run File",
		},
		{
			"<leader>tcT",
			function()
				io.popen("mkdir " .. vim.loop.cwd() .. "/coverage")
				require("neotest").run.run({
					vim.loop.cwd(),
					extra_args = { "-coverprofile=" .. vim.loop.cwd() .. "/coverage/coverage.out" },
				})
			end,
			desc = "Run All Test Files",
		},
		{
			"<leader>tcl",
			function()
				require("coverage").load()
				require("coverage").show()
			end,
			desc = "Load",
		},
		{
			"<leader>tcs",
			function()
				require("coverage").summary()
			end,
			desc = "Summary",
		},
	},
}
