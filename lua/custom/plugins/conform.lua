return {
  "stevearc/conform.nvim",
  opts = function()
    ---@class ConformOpts
    local opts = {
      format = { timeout_ms = 3000, async = false, quiet = false },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        php = { "php-cs-fixer" },
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        rust = { "rustfmt" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        ["php-cs-fixer"] = function(bufnr)
          local util  = require("conform.util")
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local start = vim.fs.dirname(fname)

          local found = vim.fs.find({ ".php-cs-fixer.php", ".php-cs-fixer.dist.php" }, {
            path = start,
            upward = true,
          })[1]

          local local_bin = util.find_executable({
            "vendor/bin/php-cs-fixer",
            "php-cs-fixer",
          }, start)

          local args = { "fix", "$FILENAME" }
          if found then
            table.insert(args, 2, "--config=" .. found)
          else
            table.insert(args, 2, "--rules=@PSR12")
          end

          return {
            command = local_bin or "php-cs-fixer",
            stdin = false,
            args = args,
          }
        end,
      },
    }
    return opts
  end,
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end,
      desc = "Format buffer",
    },
  },
}
