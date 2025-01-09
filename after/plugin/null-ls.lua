local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.sql_formatter,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"astro",
			},
		}),
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
				"liquid",
				"sh",
			},
		}),
		null_ls.builtins.formatting.stylua,
	},
})
