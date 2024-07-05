return {
	"OXY2DEV/markview.nvim",
	config = function()
		require("markview").setup({
			highlight_groups = vim.list_extend(require("markview").configuration.highlight_groups, require ("markview.presets").heading.simple_hls),
			headings = require("markview.presets").heading.simple_better
		})
	end,
	branch = "dev",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
}
