local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<Enter>"] = function(fallback)
      -- Don't block <CR> if signature help is active
      -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
      if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
        fallback()
      else
        cmp.confirm({
          -- Replace word if completing in the middle of a word
          -- https://github.com/hrsh7th/nvim-cmp/issues/664
          behavior = cmp.ConfirmBehavior.Replace,
          -- Don't select first item on CR if nothing was selected
          select = false,
        })
      end
    end,
		["<C-o>"] = cmp.mapping({
			i = function()
				if cmp.visible() then
					cmp.abort()
				else
					cmp.complete()
				end
			end,
			c = function()
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		}),
  },

	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmdline" },
	},
})
