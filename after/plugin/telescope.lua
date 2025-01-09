require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node%_modules/.*" },
		sorting_strategy = "ascending",
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>po", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>pb", function()
	builtin.buffers({
		sort_mru = true,
	})
end, {})
