local plugin = {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = {},
}

plugin.config = function()
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      yaml = { "yamlfmt" },
    },
    -- potentially broken without work around on :wq --
    -- https://github.com/neovim/neovim/issues/21856#issuecomment-1514723887 --
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 1000,
      async = false,
      lsp_fallback = true,
    },
  })

  -- manually format (make pretty) --
  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end)
end

return plugin
