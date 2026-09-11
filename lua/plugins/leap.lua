return {
	'leap.nvim',
	url = 'https://git.disroot.org/andyg/leap.nvim.git',
	pin = true,
	config = function()
		-- Set up default keymaps explicitly
		vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
		vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
		vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
	end
}
