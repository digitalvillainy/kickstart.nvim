return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    message_template = "<date> • <author> • <sha>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
  },
  config = function(_, opts)
    require("gitblame").setup(opts)
  end,
}
