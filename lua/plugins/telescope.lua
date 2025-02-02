return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			file_ignore_patterns = { "^.git/", "node%_modules/.*" },
			sorting_strategy = "ascending",
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
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
	end,
}
