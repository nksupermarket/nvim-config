vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { link = "Red" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { link = "Yellow" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { link = "Blue" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { link = "Green" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { link = "Purple" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { link = "Orange" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { link = "Aqua" })

vim.g.rainbow_delimiters = {
	highlight = {
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
		"RainbowDelimiterRed",
	},
}
