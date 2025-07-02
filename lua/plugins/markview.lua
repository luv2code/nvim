return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	priority = 49,
	config = function()
		require("markview").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
}
