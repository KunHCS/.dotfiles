local plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
}

-- keymaps --
local on_attach = function(_, bufnr)
  local keymap = vim.keymap -- for conciseness
  local opts = { noremap = true, silent = true }
  opts.buffer = bufnr

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
end

plugin.config = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "yamlls" },
  })
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lspconfig = require("lspconfig")

  -- yaml --
  lspconfig.yamlls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
  -- lua --
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })
  -- other --
end

return plugin
