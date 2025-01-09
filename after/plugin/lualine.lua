require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "everforest",
		component_separators = { left = "", right = "" },
		section_separators = "",
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { require("auto-session.lib").current_session_name, "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
