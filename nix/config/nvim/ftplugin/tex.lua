vim.opt.wrap = true

-- Keep raw LaTeX visible in .tex buffers. Math previews (α, fractions, sub/super,
-- etc.) are for Obsidian/markdown via render-markdown.nvim, not here.
vim.opt_local.conceallevel = 0
vim.b.tex_conceal = ""

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, buffer = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, buffer = true })
