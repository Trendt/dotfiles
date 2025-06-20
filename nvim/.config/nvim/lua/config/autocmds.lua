vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	desc = "Format on save",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		vim.diagnostic.config({ virtual_text = true })
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end
	end
})
