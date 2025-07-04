return {
  "j-morano/buffer_manager.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("buffer_manager").toggle_quick_menu()
  end,

  vim.keymap.set("n", "<leader>bm", function()
    require("buffer_manager.ui").toggle_quick_menu()
  end, { desc = "Toggle Buffer Manager" })
}
