local format_sync_grp = vim.api.nvim_create_augroup("TsJsFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.js" },
	callback = function()
		vim.lsp.buf.format()
	end,
	group = format_sync_grp,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "text"},
    callback = function()
        vim.wo.wrap = true
        vim.wo.textwidth = 100
				vim.wo.formatoptions = vim.wo.formatoptions .. "t"
    end
})
