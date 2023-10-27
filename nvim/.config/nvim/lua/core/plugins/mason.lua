local plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp"
  }
}

plugin.config = function()

  require("mason").setup()
  require("mason-lspconfig").setup{
    ensure_installed = {"lua_ls", "yamlls"}
  }

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lspconfig = require("lspconfig")

  -- yaml --
  lspconfig.yamlls.setup{
    capabilities = capabilities
  }
  -- lua --
  lspconfig.lua_ls.setup{
    capabilities = capabilities,
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
    }
  }
  -- other --

end

return plugin
