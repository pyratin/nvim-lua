return {
	'jlanzarotta/bufexplorer',
	config = function()
		vim.keymap.set('n', '<leader>b', ':BufExplorer<CR>', {
			desc = 'Toggle BufExplorer'
		})
	end
}
