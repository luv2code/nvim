return {
	"OXY2DEV/markview.nvim",
	config = function()
		require("markview").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
}
