return {
	'mason-org/mason-lspconfig.nvim',
	version = '*',
	dependencies = { {
		'mason-org/mason.nvim',
		version = '*',
		opts = {}
	}, {
		'neovim/nvim-lspconfig',
		version = '*'
	}, {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		version = '*'
	}, { 'b0o/schemastore.nvim' } },
	config = function()
		local capabilities = require('blink.cmp').get_lsp_capabilities()

		require('mason-tool-installer').setup({
			ensure_installed = {
				'lua-language-server',
				'eslint-lsp',
				'typescript-language-server',
				'prettier',
				'emmet-language-server',
				'html-lsp',
				'css-lsp',
				'stylelint-lsp',
				'json-lsp'
			}
		})

		require('mason-lspconfig').setup({
			automatic_installation = true,
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup({
						capabilities = capabilities,
					})
				end,
				['lua_ls'] = function()
					require('lspconfig').lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								completion = { callSnippet = 'Replace' },
								diagnostics = { globals = { 'vim', 'Snacks' } },
								workspace = { checkThirdParty = false },
								telemetry = { enable = false },
							},
						},
					})
				end,
				['eslint'] = function()
					require('lspconfig').eslint.setup({
						capabilities = capabilities,
						settings = {
							workingDirectory = { mode = 'auto' },
						},
					})
				end,
				['jsonls'] = function()
					require('lspconfig').jsonls.setup({
						capabilities = capabilities,
						settings = {
							json = {
								schemas = require('schemastore').json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = {
				border = 'rounded',
				source = 'if_many'
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = '󰅚 ',
					[vim.diagnostic.severity.WARN] = '󰀪 ',
					[vim.diagnostic.severity.INFO] = '󰋽 ',
					[vim.diagnostic.severity.HINT] = '󰌶 '
				}
			},
			update_in_insert = true,
			virtual_text = false
		})
	end
}
