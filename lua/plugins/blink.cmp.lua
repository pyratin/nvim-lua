return {
	'saghen/blink.cmp',
	lazy = false,
	dependencies = { 'Exafunction/windsurf.nvim' },
	version = '1.*',
	opts = {
		keymap = { preset = 'enter' },
		appearance = { nerd_font_variant = 'mono' },
		completion = {
			menu = { border = 'rounded' },
			documentation = {
				auto_show = false,
				window = { border = 'rounded' }
			},
			trigger = {
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true
			}
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
			providers = {
				lsp = {
					timeout_ms = 5000,
					score_offset = 100
				},
				codeium = {
					name = 'Windsurf',
					module = 'codeium.blink',
					async = true,
					timeout_ms = 5000,
					score_offset = -100
				}
			}
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' }
	},
	opts_extend = { 'sources.default' }
}
