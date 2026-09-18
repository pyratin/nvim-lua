vim.o.updatetime = 300

vim.api.nvim_create_autocmd(
	{ 'FocusGained', 'BufEnter', 'VimResume', 'CursorHold' },
	{
		group = vim.api.nvim_create_augroup('AutoRead', { clear = true }),
		pattern = '*',
		command = 'checktime',
		desc = 'Check for file changes'
	}
)
