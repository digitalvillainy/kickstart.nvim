-- mason-null-ls bridges mason and null-ls
return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = { "prettier" },
      automatic_installation = true,
    })
  end,
}
