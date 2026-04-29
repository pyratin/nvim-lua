return {
	'Exafunction/windsurf.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
	config = function()
		require('codeium').setup({
			enable_local_search = false,
			enable_index_service = false
		})
	end
}
