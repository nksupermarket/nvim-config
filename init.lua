require("nk_supermarket")

vim.cmd([[
set title
]])

vim.cmd([[ autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.skel ]])

local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	desc = "format on save",
	callback = function()
		vim.lsp.buf.format()
	end,
})
