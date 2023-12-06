local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "120"
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
vim.wo.number = true

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

require("lazy").setup("plugins")
