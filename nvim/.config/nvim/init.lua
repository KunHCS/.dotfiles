require("core.keymaps")
require("core.options")
require("core.lazy")

-- colorscheme --
vim.cmd([[colorscheme tokyonight]])
-- work around for closing error --
-- https://github.com/neovim/neovim/issues/21856#issuecomment-1514723887 --
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 10m")
  end,
})
