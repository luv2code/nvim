local format_sync_grp = vim.api.nvim_create_augroup("TsJsFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.js" },
	callback = function()
		vim.lsp.buf.format()
	end,
	group = format_sync_grp,
})
