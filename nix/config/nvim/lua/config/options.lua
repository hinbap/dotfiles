vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=bold]])
vim.cmd([[set completeopt+=menuone,noselect,popup]])

vim.g.mapleader = " "
-- Skim is the macOS-native PDF viewer with first-class VimTeX SyncTeX support
-- (forward + reverse search). No D-Bus, no dotool.
vim.g.vimtex_view_method = "skim"

vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999

vim.g.maplocalleader = ","
