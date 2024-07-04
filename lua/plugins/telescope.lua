return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"isak102/telescope-git-file-history.nvim",
	},

	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		telescope.load_extension("git_file_history")

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader><space>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fy', builtin.lsp_document_symbols, {})
		vim.keymap.set('n', '<leader>fw', builtin.diagnostics, {})
		vim.keymap.set('n', '<leader>fm', builtin.marks, {})
		vim.keymap.set('n', '<leader>fs', function ()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set('n', '<leader>fk', telescope.extensions.git_file_history.git_file_history, {})
	end
}
