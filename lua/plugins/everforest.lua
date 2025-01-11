return {
	"sainnhe/everforest",
	name = "everforest",
	priority = 1000,
	lazy = false,
	config = function()
		function ColorMyPencils(color)
			-- everforest config
			vim.cmd("set background=dark")
			vim.g.everforest_background = "hard"
			vim.g.everforest_ui_contast = "high"

			vim.cmd.colorscheme("everforest")
			vim.api.nvim_set_hl(0, "LineNr", { link = "Grey" })
		end

		ColorMyPencils()
	end,
}
