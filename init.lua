require("luv2code")

function UpdateEverything()
    -- Update Mason plugins
    vim.cmd('MasonUpdate')

    -- Update Neovim Plugins
    vim.cmd('PackerSync')

    -- Update Go Tool
    vim.cmd('GoUpdateBinaries')

    -- Update TreeSitter plugins
    vim.cmd('TSUpdate')
end

function Restart()
    -- Restart NeoVim to make sure all the updates take effect
    vim.cmd('silent exec "!kill -s HUP $PPID"')
end

vim.cmd([[
  command! UpdateAll lua UpdateEverything()
]])

vim.cmd([[
  command! Restart lua Restart()
]])
