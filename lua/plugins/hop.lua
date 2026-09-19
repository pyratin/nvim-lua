return {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran',
        uppercase_labels = true,
        hint_type = 'inline',
    },
    config = function(_, opts)
        require('hop').setup(opts)
        
        -- Override Hop colors to look exactly like Vimium (Black text on bright yellow box)
        vim.api.nvim_set_hl(0, 'HopNextKey', { fg = '#000000', bg = '#f9e035', bold = true })
        vim.api.nvim_set_hl(0, 'HopNextKey1', { fg = '#000000', bg = '#f9e035', bold = true })
        vim.api.nvim_set_hl(0, 'HopNextKey2', { fg = '#000000', bg = '#f9e035', bold = true })
        
        -- Map 's' to HopChar2 (type 2 chars, then jump anywhere on screen)
        vim.keymap.set('n', 's', "<cmd>HopChar2<CR>", { silent = true, desc = "Hop to 2 chars (whole screen)" })
        vim.keymap.set('x', 's', "<cmd>HopChar2<CR>", { silent = true, desc = "Hop to 2 chars (whole screen)" })
        vim.keymap.set('o', 's', "<cmd>HopChar2<CR>", { silent = true, desc = "Hop to 2 chars (whole screen)" })
    end
}
