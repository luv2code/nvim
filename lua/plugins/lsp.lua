return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LSP
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		-- Completion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"eslint",
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"tailwindcss",
				"html",
				"htmx",
				"clangd",
				"cssls",
				"templ",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,
				gopls = function ()
					require('lspconfig').gopls.setup(require('go.lsp').config())
				end,
				tailwindcss = function ()
					require('lspconfig').tailwindcss.setup({
						filetypes = { "templ", "javascript", "typescript", "react" },
						init_options = { userLanguages = { templ = "html" } },
					})
				end,
			}
		})

		require("luasnip.loaders.from_vscode").lazy_load()

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		local luasnip = require("luasnip")
		local next_cmp = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" })
		local prev_cmp = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" })

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
				["<Tab>"] = next_cmp,
				["<C-n>"] = next_cmp,
				["<S-Tab>"] = prev_cmp,
				["<C-p>"] = prev_cmp,
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

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end
}
