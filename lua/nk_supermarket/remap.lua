local function setup_keymap(mode, key, mapping)
	vim.keymap.set(mode, key, mapping, { noremap = true, silent = true })
end

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Neotree source=filesystem reveal=true position=current<CR>")
vim.keymap.set("n", "<leader>pb", ":Neotree source=buffers reveal=true position=left<CR>")
vim.keymap.set("n", "<leader>pc", ":Neotree close<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- delete the new line operator at the end of the line
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- makes find next search match also center the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pastes the word in current register and preserves that word in the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- close quick fix
vim.keymap.set("n", "<leader>q", ":cclose<CR>")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quickly move between options in quickfix menu
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- quickly move between options in location list ie linter errors, compile errors, search results
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- change all instances of word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

setup_keymap("n", "<leader>n", "o<C-c>")
setup_keymap("n", "<leader>N", "O<C-c>")

setup_keymap("i", "<C-s>", "<cmd>update<CR><C-c>")
setup_keymap("n", "<C-s>", ":w<CR>")

-- open a new terminal in vertical split
setup_keymap("n", "<leader><Esc>", ":vsp<CR><C-w><C-w>:term<CR>i")

setup_keymap("n", "<Esc><Esc>", "<C-\\><C-n>:bd!<CR>")

-- terminal mode
setup_keymap("t", "<Esc>", "<C-\\><C-N>")
setup_keymap("t", "<C-h>", "<C-\\><C-N><C-w><C-h>")

--visual mode
-- change all instances of word
setup_keymap("v", "<leader>s", "y:%s/<C-r>0//g<Left><Left>r<Backspace>")
