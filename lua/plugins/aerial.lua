return {
  'stevearc/aerial.nvim',
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- We are using the pure default setup. No aggressive filters, 
    -- no forced backends, no custom floating windows.
    require("aerial").setup({
      layout = {
        default_direction = "float",
        -- Increased max and min width to comfortably fit long function names
        max_width = { 100, 0.5 },
        width = nil,
        min_width = 45,
      },
      -- Center the floating window in the editor instead of anchoring to the cursor
      float = {
        relative = "editor",
      },
    })

    -- Standard shortcut to toggle the sidebar
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial" })
  end
}
