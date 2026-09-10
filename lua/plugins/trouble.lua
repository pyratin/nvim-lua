return {
  "folke/trouble.nvim",
  opts = {}, -- default options
  cmd = "Trouble",
  keys = {
    {
      "<Leader>q",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Toggle buffer diagnostics (Trouble)",
    },
  },
}
