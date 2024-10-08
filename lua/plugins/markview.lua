-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/markdown-preview.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/markdown-preview.lua
--
-- Link to github repo
-- https://github.com/iamcco/markdown-preview.nvim

-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	-- keys = {
-- 	-- 	{
-- 	-- 		"<leader>mp",
-- 	-- 		ft = "markdown",
-- 	-- 		"<cmd>MarkdownPreviewToggle<cr>",
-- 	-- 		desc = "Markdown Preview",
-- 	-- 	},
-- 	-- },
-- }
-- if true then
-- 	return {
-- 		-- {
-- 		-- 	"lukas-reineke/headlines.nvim",
-- 		-- 	dependencies = "nvim-treesitter/nvim-treesitter",
-- 		-- 	config = true, -- or `opts = {}`
-- 		-- },
-- 		{
-- 			"OXY2DEV/markview.nvim",
-- 			lazy = false, -- Recommended
-- 			-- ft = "markdown" -- If you decide to lazy-load anyway
--
-- 			dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
-- 			-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
-- 			-- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
-- 			opts = {
-- 				modes = { "n", "i" },
-- 				hybrid_modes = { "i" },
-- 				options = {
-- 					on_enable = {
-- 						conceallevel = 0,
-- 						concealcursor = "",
-- 					},
-- 					on_disable = {
-- 						conceallevel = 0,
-- 						concealcursor = "",
-- 					},
-- 				},
-- 			},
-- 		},
-- 	}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
}
