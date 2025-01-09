require("lsp_signature").setup({
	floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
		local pumheight = vim.o.pumheight
		local winline = vim.fn.winline() -- line number in the window
		local winheight = vim.fn.winheight(0)

		-- window top
		if winline - 1 < pumheight then
			return pumheight
		end

		-- window bottom
		if winheight - winline < pumheight then
			return -pumheight - 1
		end

		return pumheight
	end,
})
