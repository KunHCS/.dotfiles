local plugin = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}

plugin.config = function()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "bash", "json", "yaml", "lua", "vim", "vimdoc", "query", "comment" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
  }

end

return plugin
