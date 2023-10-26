local plugins = {
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "nvim-lua/plenary.nvim",
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- snippets --
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" }
  },
  "rafamadriz/friendly-snippets",
  -- cmp plugins --
  'hrsh7th/nvim-cmp',
  "hrsh7th/cmp-nvim-lsp",
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  -- lsp --
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- blankline (indent lines) --
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts={}
require("lazy").setup(plugins, opts)
