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
		"Zeioth/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("markview").setup({
				modes = { "n", "i", "no", "c" },
				hybrid_modes = { "i" },

				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].concealcursor = "c" -- Changed from "nc" to "c"
					end,
				},
			})

			-- Automatically enable Markview for all buffers
			-- vim.cmd("Markview enableAll")

			-- Function to update concealment for the current line
			local function update_concealment()
				if vim.bo.filetype == "markdown" then
					local current_line = vim.fn.line(".")
					vim.wo.conceallevel = 2
					vim.wo.concealcursor = "c"
					vim.cmd("syn sync fromstart")
					vim.cmd(
						string.format(
							"syn match Conceal /\\%%>%dl\\zs\\*\\ze\\*\\|\\%%>%dl\\zs_\\ze_\\|\\%%>%dl\\zs`\\ze`/ conceal",
							current_line,
							current_line,
							current_line
						)
					)
				end
			end

			-- Autocmd to unconceal the current line in normal mode
			vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "CursorMoved" }, {
				pattern = { "*.md" },
				callback = update_concealment,
			})
		end,
	},
}
