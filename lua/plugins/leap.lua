return {
	'leap.nvim',
	url = 'https://git.disroot.org/andyg/leap.nvim.git',
	pin = true,
	config = function()
		-- Disable autojump when there are multiple matches:
		-- This prevents Leap from automatically jumping to the first match,
		-- and instead shows a label (nav) for every match, including the first one.
		require('leap').opts.safe_labels = ''

		-- Set up default keymaps explicitly
		vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
		vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
		vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
	end
}
