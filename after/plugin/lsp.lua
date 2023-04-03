local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'gopls',
  'tailwindcss',
  'html',
  'clangd',
  'cssls',
})
lsp.nvim_workspace()

lsp.on_attach(function(client)
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider.legend = {
      tokenModifiers = { "static" },
      tokenTypes = { "comment", "excluded", "identifier", "keyword", "keyword", "number", "operator", "operator", "preprocessor", "string", "whitespace", "text", "static", "preprocessor", "punctuation", "string", "string", "class", "delegate", "enum", "interface", "module", "struct", "typeParameter", "field", "enumMember", "constant", "local", "parameter", "method", "method", "property", "event", "namespace", "label", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "xml", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp", "regexp" }
    }
  end
end)

lsp.setup()
