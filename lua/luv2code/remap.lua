vim.g.mapleader = " "
vim.keymap.set("n", "<leader>yy", "\"+y")
vim.keymap.set("n", "<leader>yp", "\"+p")
vim.keymap.set("n", "<leader>ep", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ts", function () 
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
end)
vim.keymap.set("n", "<leader>tl", function () 
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
end)
