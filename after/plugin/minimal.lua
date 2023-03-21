vim.g.minimal_italic_comments = true
vim.g.minimal_transparent_background = true
vim.cmd[[colorscheme minimal-base16]]
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
