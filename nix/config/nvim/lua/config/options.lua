vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=bold]])
vim.cmd([[set completeopt+=menuone,noselect,popup]])

vim.g.mapleader = " "
-- Zathura: themed to monoglow via ~/.config/zathura/zathurarc.
-- Don't forward-search on start: --synctex-forward requires a D-Bus session
-- bus, and if the bus is unreachable zathura exits without opening the PDF.
-- The initial open just shows the file; latexmk -pvc (VimtexCompile) updates
-- the PDF on disk and zathura's file monitor auto-reloads it. Explicit
-- forward search (\lv) still uses --synctex-forward and needs D-Bus (provided
-- by the zsh-init snippet in home.nix).
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_forward_search_on_start = 0

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
