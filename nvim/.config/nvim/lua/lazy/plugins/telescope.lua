return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({})
    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fd', builtin.git_files, { desc = 'Telescope find git files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    -- LSP keymaps
    vim.api.nvim_create_augroup("CustomTelescopeAutocmds", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = "CustomTelescopeAutocmds",
      callback = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'Lsp references' })
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Lsp goto definiton' })
        vim.keymap.set('n', 'gtd', builtin.lsp_type_definitions, { desc = 'Lsp goto type definitions' })
        vim.keymap.set('n', 'gri', builtin.lsp_implementations, { desc = 'Lsp goto implementation' })
        vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { desc = 'Lsp open document symbols of current buffer' })
        vim.keymap.set('n', 'ggO', builtin.lsp_dynamic_workspace_symbols,
          { desc = 'Lsp open workspace("global") symbols of current buffer' })
        -- vim.keymap.set('n', 'gD', builtin.diagnostics,
        --   { desc = 'open diagnostics' })
      end,
    })
  end
}
