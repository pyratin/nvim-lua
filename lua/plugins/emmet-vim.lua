return {
	'mattn/emmet-vim',
	init = function()
		vim.g.user_emmet_settings = {
			ejs = { extends = 'html' }
		}
	end
}
