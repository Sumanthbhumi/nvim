-- if true then
-- 	return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "zz" },
		})
	end,
}
