return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
  },
  config = function()
    require("go").setup({
			icons = {breakpoint = '🛑', currentpos = ''},
			lsp_gofumpt = true,
		})

		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
			  vim.lsp.buf.format()
			end,
			group = format_sync_grp,
		})

		vim.cmd(
			[[command! GoLintEx        :setl makeprg=golangci-lint\ run\ --print-issued-lines=false\ --exclude-use-default=true\ --out-format=line-number | :GoMake]]
		)

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.templ" },
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local cmd = "templ fmt " .. vim.fn.shellescape(filename)

				vim.fn.jobstart(cmd, {
						on_exit = function()
								-- Reload the buffer only if it's still the current buffer
								if vim.api.nvim_get_current_buf() == bufnr then
										vim.cmd('e!')
								end
						end,
				})
			end,
			group = format_sync_grp,
		})
  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
