local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.on_attach(function(client)
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider.legend = {
      tokenModifiers = { "static" },
      tokenTypes = { "comment", "excluded", "identifier", "keyword", "keyword", "number", "operator", "operator", "preprocessor", "string", "whitespace", "text", "static", "preprocessor", "punctuation", "string", "string", "class", "delegate", "enum", "interface", "module", "struct", "typeParameter", "field", "enumMember", "constant", "local", "parameter", "method", "method", "property", "event", "namespace", "label", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp" }
    }
  end
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer',
		'gopls',
		'tailwindcss',
		'html',
		'htmx',
		'clangd',
		'cssls',
		'templ',
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		gopls = function ()
			require('lspconfig').gopls.setup(require('go.lsp').config())
		end,
		tailwindcss = function ()
			require('lspconfig').tailwindcss.setup({
					filetypes = { "templ", "javascript", "typescript", "react" },
					init_options = { userLanguages = { templ = "html" } },
			})
		end,
		lua_ls = function ()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	},
})
