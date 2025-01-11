return {

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
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
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			vim.keymap.set("n", "<leader>zz", function()
				require("zen-mode").setup({
					window = {
						width = 90,
						options = {},
					},
				})
				require("zen-mode").toggle()
				vim.wo.wrap = false
				vim.wo.number = true
				vim.wo.rnu = true
				ColorMyPencils()
			end)

			vim.keymap.set("n", "<leader>zZ", function()
				require("zen-mode").setup({
					window = {
						width = 80,
						options = {},
					},
				})
				require("zen-mode").toggle()
				vim.wo.wrap = false
				vim.wo.number = false
				vim.wo.rnu = false
				vim.opt.colorcolumn = "0"
				ColorMyPencils()
			end)
		end,
	},
	"tpope/vim-surround",
	"numToStr/Comment.nvim",
	{
		"m4xshen/autoclose.nvim",
		opts = {
			options = {
				disable_when_touch = true,
			},
		},
	},
}
