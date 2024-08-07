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
			{ "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "[O]bsidian [O]pen" },
			{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "[O]bsidian [B]acklinks" },
			{ "<leader>otd", "<cmd>ObsidianToday<cr>", desc = "[O]bsidian [T]o[d]ay" },
			{ "<leader>otm", "<cmd>ObsidianTomorrow<cr>", desc = "[O]bsidian [T]o[m]orrow" },
			{ "<leader>oyd", "<cmd>ObsidianYesterday<cr>", desc = "[O]bsidian [Y]ester[d]ay" },
			{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian [S]earch" },
		},
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
			ui = {
				enable = true, -- set to false to disable all additional syntax features
				update_debounce = 200, -- update delay after a text change (in milliseconds)
				max_file_length = 5000, -- disable UI features for files with more than this many lines
				-- Define how various check-boxes are displayed
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					["!"] = { char = "", hl_group = "ObsidianImportant" },
					-- Replace the above with this if you don't have a patched font:
					-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
					-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

					-- You can also add more custom ones...
				},
			}
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
