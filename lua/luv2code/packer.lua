-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', branch = 'master', --tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'Yazeed1s/minimal.nvim'
  use 'preservim/nerdcommenter'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'tpope/vim-fugitive'
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use {
    'ray-x/go.nvim',
    requires = {
      { 'mfussenegger/nvim-dap' },
      { 'rcarriga/nvim-dap-ui' },
      { 'theHamsta/nvim-dap-virtual-text' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'ray-x/guihua.lua'}, -- recommended if need floating window support
    }
  }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
				triggers_nowait = {}
      })
    end
  })
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
	-- templ
	use("vrischmann/tree-sitter-templ")
	-- copilot
	use { 
		"zbirenbaum/copilot.lua",
		config = function()
			require('copilot').setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end
	}
	use {
		"zbirenbaum/copilot-cmp",
		config = function()
				require("copilot_cmp").setup()
		end
	}
	use {
			"robitx/gp.nvim",
			config = function()
					require("gp").setup()
			end,
	}
	---- which-key
	--use { 
		 ---- commented out because it effected gd (goto definition)
		 ---- perhaps setting triggers_nowait will fix because the LSP doesn't hook immediately?
		--"folke/which-key.nvim",
		--config = function()
			--vim.o.timeout = true
			--vim.o.timeoutlen = 500
			--require("which-key").setup {
			--}
		--end
	--}
end)
