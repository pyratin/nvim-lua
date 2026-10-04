return {
	'nvimdev/lspsaga.nvim',
	config = function()
		require('lspsaga').setup({
			lightbulb = { enable = false },
			symbol_in_winbar = { enable = false },
			diagnostic = {
				keys = {
					quit = { 'q', '<ESC>' }
				}
			}
		})
	end
}
