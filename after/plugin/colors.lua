function ColorMyPencils(color)
	color = color or "everforest"
    vim.g.everforest_background = 'medium'
    vim.g.everforest_ui_conrtast = 'high'
    vim.g.everforest_transparent_background = '1'
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
