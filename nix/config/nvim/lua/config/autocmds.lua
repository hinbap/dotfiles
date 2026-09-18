-- format before saving
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		vim.lsp.buf.format({
			bufnr = args.buf,
			timeout_ms = 2000,
		})
	end,
})

-- NOTE: you don't need this is you are on neovim 0.13 (nightly)
-- HACK: to trigger on every ASCII char
local chars = {}
for i = 32, 126 do
	table.insert(chars, string.char(i))
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local buf = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client.name == "obsidian-ls" then
			client.server_capabilities.completionProvider.triggerCharacters = chars -- HACK:
			vim.bo[buf].completeopt = "menuone,noselect,fuzzy,nosort" -- noselect to make sure no accidentally accept and create new notes, others are not strictly necessary, adjust to your taste, see `:h completeopt'
			vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
		end
	end,
})
