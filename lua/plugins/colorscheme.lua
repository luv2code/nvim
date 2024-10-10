return {
	{
		"Yazeed1s/minimal.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.minimal_italic_comments = true
			vim.g.minimal_transparent_background = true
			vim.cmd[[colorscheme minimal-base16]]
		end,
	}
}
