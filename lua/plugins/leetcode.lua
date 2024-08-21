return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		lang = "cpp",
		-- You can include other configuration options here as needed
		image_support = true,
	},
}
