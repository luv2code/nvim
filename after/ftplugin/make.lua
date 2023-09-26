local setlocal = vim.opt_local
-- Tabs and spaces
setlocal.expandtab = false
setlocal.smartindent = false
setlocal.tabstop = 4
setlocal.shiftwidth = 4
setlocal.softtabstop = 4

local ko = { buffer = true }
vim.keymap.set({"n", "v"}, "<leader>p", "ihello<Esc>", ko)
