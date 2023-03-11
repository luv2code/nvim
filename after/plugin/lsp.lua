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
lsp.setup()
