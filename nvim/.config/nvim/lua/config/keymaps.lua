-- centered jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- centered quickfix jumping
vim.keymap.set("n", "[q", function()
  vim.cmd("cprev")
  vim.cmd("normal! zz")
end)
vim.keymap.set("n", "]q", function()
  vim.cmd("cnext")
  vim.cmd("normal! zz")
end)

-- system clipboard interaction
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Yank to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

vim.keymap.set({ "v" }, "<leader><C-p>", '"tygv"0p', { desc = "Paste without yanking underlying text" })


vim.keymap.set({ "n" }, "<C-k>", vim.diagnostic.open_float)
vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition)
