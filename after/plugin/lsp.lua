local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'gopls',
  'csharp_ls',
  'tailwindcss',
  'html',
  'clangd',
  'cssls',
})
lsp.nvim_workspace()
lsp.setup()
