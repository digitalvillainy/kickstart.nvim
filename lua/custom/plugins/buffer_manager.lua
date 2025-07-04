return {
  "j-morano/buffer_manager.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("buffer_manager").setup {
      -- auto_close = true,
      -- auto_close_all = true,
      -- auto_close_all_ignore_pattern = ".*",
      -- auto_close_all_ignore_filetype = ".*",
    }
  end,

  vim.keymap.set("n", "<leader>bm", function()
    require("buffer_manager.ui").toggle_quick_menu()
  end, { desc = "Toggle Buffer Manager" })
}
