-- Must happen before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("config")

if vim.g.neovide then
  vim.o.guifont = "Brosevka Nerd Font:h16"
  vim.g.neovide_padding_bottom = 16
  vim.g.neovide_padding_top = 16
  vim.g.neovide_padding_right = 16
  vim.g.neovide_padding_left = 16
end
