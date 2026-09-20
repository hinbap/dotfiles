vim.opt.wrap = true

-- Keep raw LaTeX visible in .tex buffers. Math previews (α, fractions, sub/super,
-- etc.) are for Obsidian/markdown via render-markdown.nvim, not here.
vim.opt_local.conceallevel = 0
vim.b.tex_conceal = ""

-- snacks.image auto-attaches to any language with a treesitter `images.scm`
-- query (including latex), rendering math and \includegraphics inline.
-- Setting its own guard flag before it can attach keeps snacks.image active
-- for markdown/Obsidian but off for .tex buffers.
vim.b.snacks_image_attached = true

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, buffer = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, buffer = true })
