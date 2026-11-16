return {
	'milanglacier/minuet-ai.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local minuet_config = require('minuet.config')
		local chat_input =
			vim.deepcopy(minuet_config.default_chat_input_prefix_first)

		-- Enrich context with package.json dependencies when available
		chat_input.language = function(before, after, opts)
			local lang_comment = require('minuet.utils').add_language_comment()
			local root = vim.fs.root(0, { 'package.json', '.git' })
			if root then
				local pkg_file = root .. '/package.json'
				if vim.fn.filereadable(pkg_file) == 1 then
					local lines = vim.fn.readfile(pkg_file)
					local ok, parsed =
						pcall(vim.json.decode, table.concat(lines, ''))
					if ok and parsed then
						local deps = {}
						if parsed.dependencies then
							for k in pairs(parsed.dependencies) do
								table.insert(deps, k)
							end
						end
						if parsed.devDependencies then
							for k in pairs(parsed.devDependencies) do
								table.insert(deps, k)
							end
						end
						if #deps > 0 then
							table.sort(deps)
							return lang_comment .. '\n# Project dependencies: ' .. table.concat(
								deps,
								', '
							)
						end
					end
				end
			end
			return lang_comment
		end

		require('minuet').setup({
			provider = 'gemini',
			n_completions = 3,
			context_window = 16000,
			context_ratio = 0.75,
			throttle = 1000,
			debounce = 0,
			request_timeout = 5,
			notify = 'warn',
			add_single_line_entry = true,
			provider_options = {
				gemini = {
					model = 'gemini-3.5-flash-lite',
					api_key = 'GEMINI_API_KEY',
					stream = false,
					chat_input = chat_input,
					optional = {
						generationConfig = {
							maxOutputTokens = 64,
							temperature = 0.1
						}
					}
				}
			},
			virtualtext = {
				auto_trigger_ft = {}
			}
		})
	end
}
