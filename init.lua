require("luv2code")

function UpdateEverything()
    -- Update Neovim Plugins
    vim.cmd('PackerSync')

    -- Update Mason plugins
    vim.cmd('MasonUpdate')

    -- Update Go Tool
    vim.cmd('GoUpdateBinaries')

    -- Update TreeSitter plugins
    vim.cmd('TSUpdate')

    -- Restart NeoVim to make sure all the updates take effect
    vim.cmd('silent exec "!kill -s HUP $PPID"')
end

vim.cmd([[
  command! UpdateAll lua UpdateEverything()
]])
