return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			lua = { "luacheck" },
		}

		local luacheck = lint.linters.luacheck
		luacheck.args = {
			"--globals",
			"vim",
			"lvim",
			"reload",
			"--",
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
