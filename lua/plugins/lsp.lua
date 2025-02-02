return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.sourcekit.setup({
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local cmp = require("cmp")
			local compare = cmp.config.compare

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				performance = {
					throttle = 500,
					debounce = 100,
					async_budget = 10,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}),
				sorting = {
					priority_weight = 3.0,
					comparators = {
						compare.locality,
						compare.recently_used,
						compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
						compare.offset,
						compare.order,
					},
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						local col = vim.fn.col(".") - 1

						if cmp.visible() then
							cmp.select_next_item({ behavior = "select" })
						elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
							fallback()
						else
							cmp.complete()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-j>"] = require("cmp").mapping.scroll_docs(-4),
					["<C-k>"] = require("cmp").mapping.scroll_docs(4),
					["<C-Space>"] = require("cmp").mapping.complete(),
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "Lsp Actions",
				callback = function(event)
					local opts = { buffer = event.buf, remap = false }
					vim.diagnostic.config({
						virtual_text = true,

						update_in_insert = true,
						float = {
							show_header = false,
							source = true,
							border = "rounded",
							focus = false,
							width = 120,
						},
					})

					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, opts)
					vim.keymap.set("n", "gD", function()
						vim.lsp.buf.declaration()
					end, opts)
					vim.keymap.set("n", "gi", function()
						vim.lsp.buf.implementation()
					end, opts)
					vim.keymap.set("n", "go", function()
						vim.lsp.buf.type_definition()
					end, opts)

					vim.keymap.set("n", "gr", function()
						vim.lsp.buf.references()
					end, opts)
					vim.keymap.set("n", "gs", function()
						vim.lsp.buf.signature_help()
					end, opts)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover({
							border = "rounded",
							max_width = 90,
							max_height = 20,
						})
					end, opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_prev()
					end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_next()
					end, opts)
					vim.keymap.set("n", "<F4>", function()
						vim.lsp.buf.code_action()
					end, opts)
					vim.keymap.set("n", "<F2>", function()
						vim.lsp.buf.rename()
					end, opts)
					vim.keymap.set("i", "<C-2>", function()
						cmp.mapping.scroll_docs(-4)
					end, opts)
					vim.keymap.set("i", "<C-1>", function()
						cmp.mapping.scroll_docs(4)
					end, opts)
				end,
			})
		end,
		dependencies = {
			"ray-x/lsp_signature.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
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
		},
	},
}
