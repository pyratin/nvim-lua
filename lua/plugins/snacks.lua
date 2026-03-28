return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    terminal = {
      win = {
        position = 'float',
        border = 'rounded',
        width = 120,
        height = 30,
      },
    },
  },
  keys = {
    -- General Terminal
    { '<Leader>-', function() Snacks.terminal.toggle() end, desc = 'Toggle Terminal' },
    { '<Leader>-', function() Snacks.terminal.toggle() end, mode = 't', desc = 'Toggle Terminal' },

    -- Gemini Chat
    {
      '<Leader>ag',
      function()
        Snacks.terminal.toggle('gemini', {
          win = { 
            width = 120,
            height = 30,
            keys = {
              q = { 'q', function() Snacks.terminal.toggle('gemini') end, desc = 'Toggle Gemini' },
            }
          }
        })
      end,
      desc = 'Toggle Gemini'
    },

    -- Smart Fullscreen Toggle (works for Gemini or General Terminal)
    {
      '<Leader>af',
      function()
        local term = nil
        local snacks_term = require("snacks.terminal")
        local terms = snacks_term.list()
        
        -- 1. Try to find a visible terminal first
        for _, t in pairs(terms) do
          if t:win_valid() then
            term = t
            break
          end
        end
        
        -- 2. Fallback to Gemini if no terminal is currently visible
        if not term then
          for _, t in pairs(terms) do
            local cmd = t.cmd
            if type(cmd) == 'table' then cmd = cmd[1] end
            if cmd == 'gemini' then
              term = t
              break
            end
          end
        end

        if not term then return end

        -- Ensure it's visible before toggling
        if not term:win_valid() then
          term:show()
        end

        -- Toggle dimensions (0 = Fullscreen, 120x30 = Normal)
        if term.opts.width == 0 then
          term.opts.width = 120
          term.opts.height = 30
        else
          term.opts.width = 0
          term.opts.height = 0
        end
        
        term:update()
      end,
      desc = 'Toggle Fullscreen'
    },
    {
      '<Leader>af',
      function()
        -- In terminal mode, we need to first escape to normal mode behavior
        -- but since we're in Lua, we can just call the function directly.
        -- This allows \af to work directly from terminal mode.
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
        -- After escaping, we wait a bit or just trigger the logic.
        -- Actually, we can just trigger the same function.
        vim.schedule(function()
          local term = nil
          local snacks_term = require("snacks.terminal")
          local terms = snacks_term.list()
          for _, t in pairs(terms) do
            if t:win_valid() then
              term = t
              break
            end
          end
          if not term then return end
          if term.opts.width == 0 then
            term.opts.width = 120
            term.opts.height = 30
          else
            term.opts.width = 0
            term.opts.height = 0
          end
          term:update()
        end)
      end,
      mode = 't',
      desc = 'Toggle Fullscreen'
    },
  },
}
