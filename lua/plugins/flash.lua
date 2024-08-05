return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {
			autojump = true,
		},
		modes = {
			char = {
				jump_labels = false,
				multi_line = false,
				highlight = {
					backdrop = false,
					matches = function(matches)
						return vim.tbl_filter(function(match)
							return match.pos[1] == vim.fn.line(".")
						end, matches)
					end,
				},
			},
		},
		-- Add custom highlight groups
		highlight = {
			groups = {
				match = "CustomFlashMatch",
				current = "CustomFlashCurrent",
				backdrop = "CustomFlashBackdrop",
				label = "CustomFlashLabel",
			},
		},
	},
	config = function(_, opts)
		require("flash").setup(opts)

		-- Define custom highlight groups
		vim.api.nvim_set_hl(0, "CustomFlashMatch", { fg = "#AEB8F7" })
		vim.api.nvim_set_hl(0, "CustomFlashCurrent", { fg = "#FAB388" })
		vim.api.nvim_set_hl(0, "CustomFlashBackdrop", { fg = "#636DA6" })
		vim.api.nvim_set_hl(0, "CustomFlashLabel", { fg = "#A6E3A2", bold = true })

		-- Custom function to wrap flash.jump() with marking behavior
		local function flash_jump_with_marks()
			vim.cmd("normal! mf")
			require("flash").jump()
			vim.defer_fn(function()
				vim.cmd("normal! mg")
			end, 10)
		end

		vim.keymap.set({ "n", "x", "o" }, "s", flash_jump_with_marks, { desc = "Flash with marks" })
	end,
	keys = {
		{
			"vS",
			mode = { "n" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}
