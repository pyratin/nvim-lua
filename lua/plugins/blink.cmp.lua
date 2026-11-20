return {
	'saghen/blink.cmp',
	dependencies = { 'milanglacier/minuet-ai.nvim' },
	version = '1.*',
	opts = {
		keymap = {
			preset = 'enter',
			['<A-y>'] = { function(cmp)
				cmp.show({
					providers = { 'minuet' }
				})
			end }
		},
		appearance = { nerd_font_variant = 'mono' },
		completion = {
			menu = { border = 'rounded' },
			documentation = {
				auto_show = false,
				window = { border = 'rounded' }
			},
			accept = {
				auto_brackets = { enabled = false }
			},
			trigger = { show_on_trigger_character = false }
		},
		sources = {
			default = { 'lsp', 'path', 'buffer' },
			per_filetype = {
				oil = {}
			},
			providers = {
				lsp = {
					timeout_ms = 5000,
					score_offset = 100
				},
				minuet = {
					name = 'minuet',
					module = 'minuet.blink',
					score_offset = 100,
					timeout_ms = 15000
				}
			}
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' }
	},
	opts_extend = { 'sources.default' }
}
