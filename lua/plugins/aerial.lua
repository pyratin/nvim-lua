return {
	'stevearc/aerial.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		-- We are using the pure default setup. No aggressive filters,
		-- no forced backends, no custom floating windows.
		require('aerial').setup({
			layout = {
				default_direction = 'float',
				-- Increased max and min width to comfortably fit long function names
				max_width = { 100, 0.5 },
				width = nil,
				min_width = 45
			},
			-- Center the floating window in the editor instead of anchoring to the cursor
			float = { relative = 'editor' },
			filter_kind = false,
			keymaps = {
				['<CR>'] = 'actions.tree_toggle',
				['<C-CR>'] = 'actions.jump',
				o = 'actions.jump' -- Fallback jump key
			},
			close_on_select = true,
			-- Automatically collapse all nodes when symbols are first loaded
			on_first_symbols = function(bufnr)
				require('aerial').tree_set_collapse_level(bufnr, 0)
			end
		})

		-- Standard shortcut to toggle the sidebar
		vim.keymap.set(
			'n',
			'<leader>a',
			function()
				local aerial = require('aerial')
				local is_open = aerial.nav_is_open()
				local bufnr = vim.api.nvim_get_current_buf()
				aerial.toggle()
				if not is_open then
					-- If we just opened it, collapse all nodes so it always starts clean
					aerial.tree_set_collapse_level(bufnr, 0)
				end
			end,
			{ desc = 'Toggle Aerial' }
		)
	end
}
