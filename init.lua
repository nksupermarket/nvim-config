require("nk_supermarket")
require("config")

vim.cmd([[
set title
]])

vim.cmd([[ autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.skel ]])
