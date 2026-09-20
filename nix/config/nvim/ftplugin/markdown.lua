-- Enable concealing for Obsidian's extra UI features
vim.opt_local.conceallevel = 2
vim.opt.wrap = true

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, buffer = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, buffer = true })
