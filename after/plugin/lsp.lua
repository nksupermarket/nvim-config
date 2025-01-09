local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"ts_ls",
	"eslint",
	"rust_analyzer",
})
require("lspconfig").ltex.setup({})

require("lspconfig").ts_ls.setup({
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

-- require("lspconfig").jdtls.setup({
--     init_options = {
--         jvm_args = {"-javaagent: /home/alex/.local/share/nvim/mason/share/jdtls/lombok.jar" },
--         workspace = "/home/alex/.cache/jdtls/workspace"
--     }
-- })

local cmp = require("cmp")
cmp.setup({
	performance = {
		throttle = 500,
		debounce = 100,
		async_budget = 10,
	},
})
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-j>"] = cmp.mapping.scroll_docs(-4),
	["<C-k>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-s>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
})

lsp.nvim_workspace()

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("i", "<C-2>", function()
		cmp.mapping.scroll_docs(-4)
	end, opts)
	vim.keymap.set("i", "<C-1>", function()
		cmp.mapping.scroll_docs(4)
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
})
