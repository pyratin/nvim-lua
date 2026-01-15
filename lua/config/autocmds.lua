vim.o.updatetime = 300

vim.api.nvim_create_autocmd('CursorHold', {
	group = vim.api.nvim_create_augroup('LspDiagnostics', { clear = true }),
	callback = function()
		vim.diagnostic.open_float({
			scope = 'cursor',
			focusable = false,
			close_events = { 'CursorMoved', 'CursorMovedI', 'BufHidden', 'InsertCharPre', 'WinLeave' },
			border = 'rounded'
		})
	end,
	desc = 'Show LSP diagnostics on cursor hold'
})



