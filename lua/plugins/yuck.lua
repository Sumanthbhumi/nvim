return {
	{
		"elkowar/yuck.vim",
		ft = "yuck",
	},
	{
		"gpanders/nvim-parinfer",
		ft = { "clojure", "scheme", "lisp", "yuck" },
		config = function()
			-- Parinfer configuration
			-- You can add any custom settings here if needed
			-- For example:
			-- vim.g.parinfer_mode = "smart"
			-- vim.g.parinfer_enabled = true
			-- vim.g.parinfer_force_balance = false
		end,
	},
}
