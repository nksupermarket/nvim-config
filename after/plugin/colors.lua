function ColorMyPencils(color)
	-- everforest config
	color = color or "everforest"
	vim.cmd("set background=dark")
	vim.g.everforest_background = "hard"
	vim.g.everforest_ui_contast = "high"

	--gruvbox config
	vim.g.gruvbox_material_foreground = "original"
	vim.g.gruvbox_material_background = "medium"

	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "LineNr", { link = "Grey" })
end

ColorMyPencils()
