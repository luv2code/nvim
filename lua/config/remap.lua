vim.g.mapleader = " "
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y") -- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p") -- paste from clipboard
--vim.keymap.set({"n", "v"}, "<leader>ep", vim.cmd.Ex) -- explorer project
vim.keymap.set({"n", "v"}, "<leader>n", ":NvimTreeToggle<cr>")

-- move current highlighted line(s) up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<leader>qq", ":ccl<cr>") -- quickfix keymaps
vim.keymap.set({"n", "v"}, "<leader>qn", ":cn<cr>")
vim.keymap.set({"n", "v"}, "<leader>qp", ":cp<cr>")

--Window navigation
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n", "v"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w>l")
vim.keymap.set({"n", "v"}, "<C-h>", "<C-w>h")

-- Buffer navigation
vim.keymap.set({"n", "v"}, "<leader>k", ":bnext<cr>")
vim.keymap.set({"n", "v"}, "<leader>j", ":bprevious<cr>")
vim.keymap.set({"n", "v"}, "<leader>d", ":bdelete<cr>")
vim.keymap.set({"n", "v"}, "<leader>;", ":b#<cr>")

-- setting indentation
local function smallTabStop()
    -- tab small
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
end
local function largeTabStop()
    -- tab large
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
end
vim.keymap.set("n", "<leader>ts", smallTabStop)
vim.keymap.set("n", "<leader>tl", largeTabStop)

-- Alt-Enter puts a semicolon at the end of the current line and starts a new line.
vim.keymap.set("i", "<A-cr>", "<Esc>A;<cr>")
