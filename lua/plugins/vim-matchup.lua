return {
	'andymass/vim-matchup',
	event = { 'BufReadPost', 'BufNewFile' },
	init = function()
		-- Optional: Enables a popup to show the matching offscreen pair
		vim.g.matchup_matchparen_offscreen = { method = 'popup' }
	end,
}
