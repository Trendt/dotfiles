local lsp_list = {
  "lua_ls",
  "tinymist",
  "rust_analyzer",
  "ast_grep",
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            path = "${rd}/luv/library", words = { "vim%.uv" } },
        },
      },
      { "saghen/blink.cmp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "mfussenegger/nvim-jdtls" },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for _, lsp in ipairs(lsp_list) do
        require("lspconfig")[lsp].setup { capabilities = capabilities }
      end
    end
  },
}
