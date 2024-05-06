local ko = { buffer = true }

-- Go Tools
vim.keymap.set({"n", "v"}, "<leader>gl", ":GoLint<cr>", ko)
vim.keymap.set({"n", "v"}, "<leader>gm", ":GoRename<cr>", ko)
vim.keymap.set({"n", "v"}, "<leader>gt", ":GoFmt<cr>", ko)
vim.keymap.set({"n", "v"}, "<leader>gi", ":GoToggleInlay<cr>", ko)
vim.keymap.set({"n", "v"}, "<leader>o", ":GoDoc<cr>", ko)
vim.keymap.set({"n", "v"}, "<leader>t", ":GoTest<cr>", ko)

