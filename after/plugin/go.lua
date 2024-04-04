require('go').setup({
  disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
  icons = {breakpoint = '●', currentpos = '▶'},  -- setup to `false` to disable icons setup
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
