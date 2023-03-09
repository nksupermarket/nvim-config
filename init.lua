require("nk_supermarket")

vim.cmd([[
set title
]])
require("autoclose").setup()

local db = require("dashboard")
db.setup({
	theme = "hyper",
	project = {
		enable = true,
		limit = 8,
	},
	packages = {
		enable = false,
	},
	footer = {},
})
