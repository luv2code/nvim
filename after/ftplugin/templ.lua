local ko = { buffer = true }

vim.keymap.set({"n", "v"}, "<leader>gt", ":!templ fmt %<cr>", ko)
