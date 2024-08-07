return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local custom_theme = require'lualine.themes.base16'

		-- Change the background of lualine_c section for normal mode
		--custom_tomorrow.normal.c.bg = '#112233'

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = custom_theme,
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {{'filename', path = 1}},
				lualine_x = {'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {'location'},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {
				lualine_a = {'buffers'},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {'tabs'}
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}

		for bufnum=1,9 do
			vim.keymap.set({"n", "v"}, "<C-" .. bufnum .. ">", ":LualineBuffersJump! " .. bufnum .. "<cr>")
		end
	end,
}
