vim.g.mapleader = " "
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y") -- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p") -- paste from clipboard
vim.keymap.set({"n", "v"}, "<leader>ep", vim.cmd.Ex) -- explorer project

vim.keymap.set({"n", "v"}, "<leader>qq", ":ccl<cr>") -- quickfix keymaps
vim.keymap.set({"n", "v"}, "<leader>qn", ":cn<cr>")
vim.keymap.set({"n", "v"}, "<leader>qp", ":cp<cr>")

vim.keymap.set("n", "<leader>ts", function () 
    -- tab small
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
end)
vim.keymap.set("n", "<leader>tl", function () 
    -- tab large
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
end)
