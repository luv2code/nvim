vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.fileformat = 'unix'
vim.opt.endofline = true

vim.opt.smartindent = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true


vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- fixes problems with '@' in file names HTTPS://github.com/neovim/neovim/issues/17059

vim.opt.updatetime = 50

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.g.netrw_banner=0 -- default file explorer to tree view
vim.g.netrw_liststyle=3 -- default file explorer to tree view

-- do not overwrite contents of unnamed buffer when pasting over a selection
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })

-- additional file types
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
