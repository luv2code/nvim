return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"isak102/telescope-git-file-history.nvim",
    "debugloop/telescope-undo.nvim",
	},

	config = function()

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add
		local open_with_trouble = require("trouble.sources.telescope").open

		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = open_with_trouble, ["<c-a>"] = add_to_trouble },
					n = { ["<c-t>"] = open_with_trouble, ["<c-a>"] = add_to_trouble  },
				},
			},
		})
		telescope.load_extension("git_file_history")
    telescope.load_extension("undo")

		local builtin = require('telescope.builtin')
    local function grep()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader><space>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fy', builtin.lsp_document_symbols, {})
		vim.keymap.set('n', '<leader>fw', builtin.diagnostics, {})
		vim.keymap.set('n', '<leader>fm', builtin.marks, {})
		vim.keymap.set('n', '<leader>fs', grep)
		vim.keymap.set('n', '<leader>fk', telescope.extensions.git_file_history.git_file_history, {})
    vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")
	end
}
