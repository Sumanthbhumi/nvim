local opts = {
	workspaces = {
		{ name = "personal", path = "/home/bobby/Notes/" },
		{
			name = "work",
			path = "~/projects/todo/",
		},
	},

	new_notes_location = "/home/bobby/Notes/",

	note_id_func = function(title)
		return title
	end,

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},

	attachments = {
		img_folder = "assets",
	},

	open_app_foreground = false,

	disable_frontmatter = true,
}

local concept_note_name = "Concept-Notes"
return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		keys = {
			{ "<leader>oo",  "<cmd>ObsidianOpen<cr>",      desc = "[O]bsidian [O]pen" },
			{ "<leader>ob",  "<cmd>ObsidianBacklinks<cr>", desc = "[O]bsidian [B]acklinks" },
			{ "<leader>otd", "<cmd>ObsidianToday<cr>",     desc = "[O]bsidian [T]o[d]ay" },
			{ "<leader>otm", "<cmd>ObsidianTomorrow<cr>",  desc = "[O]bsidian [T]o[m]orrow" },
			{ "<leader>oyd", "<cmd>ObsidianYesterday<cr>", desc = "[O]bsidian [Y]ester[d]ay" },
			{ "<leader>os",  "<cmd>ObsidianSearch<cr>",    desc = "[O]bsidian [S]earch" },
		},
		ui = { enable = false },
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local obsidian = require("obsidian")
			obsidian.setup(opts)
			-- ui = { enable = false }
		end,
	},
	-- {
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	-- 	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- 	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- 	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	-- 	config = function()
	-- 		require("render-markdown").setup({})
	-- 	end,
	-- },
}
