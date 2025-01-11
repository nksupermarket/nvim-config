return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 900,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ts_ls",
				"eslint",
				"rust_analyzer",
				"bashls",
				"gopls",
				"lua_ls",
				"sqlls",
				"yamlls",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local opts = {
				ts_ls = {
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
			}
			require("mason-lspconfig").setup_handlers({
				function(server)
					local opt = opts[server] or {}
					lspconfig[server].setup(opt)
				end,
			})
		end,
	},
}
