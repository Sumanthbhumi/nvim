-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			-- add more arguments for adding more treesitter parsers
			-- add more arguments for adding more treesitter parsers
			"comment",
			"javascript",
			"java",
			"jsdoc",
			"typescript",
			"tsx",
			"fish",
			"json",
			"yaml",
			"html",
			"css",
			"scss",
			"vue",
			"svelte",
			"markdown", -- lsp, lspsaga diagnostic
			"markdown_inline",
		},
	},
}
