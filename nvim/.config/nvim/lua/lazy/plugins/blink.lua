-- TODO! check
return {
	"saghen/blink.cmp",
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = 'default' },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono',
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
				}
			},
		},
		signature = { enabled = true },
	},

	opts_extended = { "sources.default" }
}
