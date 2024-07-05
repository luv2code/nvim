-- return {
-- 	{
-- 		"folke/trouble.nvim",
-- 		config = function()
-- 			require("trouble").setup({})
--
-- 			vim.keymap.set("n", "<leader>uu", function()
-- 				require("trouble").toggle()
-- 			end)
--
-- 			vim.keymap.set("n", "[u", function()
-- 				require("trouble").next({skip_groups = true, jump = true});
-- 			end)
--
-- 			vim.keymap.set("n", "]u", function()
-- 				require("trouble").previous({skip_groups = true, jump = true});
-- 			end)
--
-- 		end
-- 	},
-- }
return {
  "folke/trouble.nvim",
  opts = {
		modes = {
			symbols = {
				win = {
					position = "right",
					size = 0.3,
				},
			},
		},
	},
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xn",
      "<cmd>Trouble next skip_groups=true jump=true<cr>",
      desc = "Next diagnostics (Trouble)",
    },
    {
      "<leader>xp",
      "<cmd>Trouble prev skip_groups=true jump=true<cr>",
      desc = "Previous diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
