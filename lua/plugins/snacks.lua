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

    -- Gemini Fullscreen Toggle
    {
      '<Leader>af',
      function()
        local term = nil
        for _, t in pairs(require("snacks.terminal").list()) do
          local cmd = t.cmd
          if type(cmd) == 'table' then cmd = cmd[1] end
          if cmd == 'gemini' then
            term = t
            break
          end
        end

        if not term then return end

        if not term:win_valid() then
          term:show()
        end

        if term.opts.width == 0 then
          term.opts.width = 120
          term.opts.height = 30
        else
          term.opts.width = 0
          term.opts.height = 0
        end
        
        term:update()
      end,
      desc = 'Toggle Gemini Fullscreen'
    },
  },
}
