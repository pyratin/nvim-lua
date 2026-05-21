vim.env.PATH = vim.fn.expand('~/.local/bin:') .. vim.env.PATH

require('config.options')

require('config.keymaps')

require('config.autocmds')

require('config.lazy')
