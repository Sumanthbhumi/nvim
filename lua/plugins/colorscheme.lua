if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- or your preferred flavor
        background = {
          light = "latte",
          dark = "mocha",
        },
        -- transparent_background = true,
        -- 	show_end_of_buffer = false,
        -- 	term_colors = false,
        -- dim_inactive = {
        -- 	enabled = false,
        -- 	shade = "dark",
        -- 	percentage = 0.15,
        -- },
        -- 	no_italic = false,
        -- 	no_bold = false,
        -- 	no_underline = false,
        styles = {
          comments = { "italic" },
          functions = { "italic", "bold" },
          -- keywords = { "italic" },
          -- operators = { "bold" },
          conditionals = {},
          -- loops = {},
          -- booleans = {},
          numbers = {},
          types = {},
          strings = {},
          variables = {},
          properties = {},
        },
        -- 	color_overrides = {
        -- 		mocha = {
        -- 			-- base = "#1e1e2e",
        -- 			-- mantle = "#1e1e2e",
        -- 			-- crust = "#1e1e2e",
        -- 		},
        -- 	},
        -- 	custom_highlights = function(colors)
        -- 		return {
        -- 			TabLine = { bg = colors.base },
        -- 			TabLineFill = { bg = colors.base },
        -- 			TabLineSel = { bg = colors.base },
        -- 			StatusLine = { bg = colors.base },
        -- 			StatusLineNC = { bg = colors.base },
        -- 			-- WinBar = { bg = colors.base },
        -- 			-- WinBarNC = { bg = colors.base },
        -- 			-- WinSeparator = { fg = colors.base, bg = colors.base },
        -- 			-- NormalFloat = { bg = colors.base },
        -- 			-- FloatBorder = { fg = colors.base, bg = colors.base },
        -- 			-- ["@variable"] = { fg = "#589ED7" }, -- Variables
        -- 			["@type.builtin"] = { fg = "#5497CE" },
        -- 			["@function"] = { fg = "#F6A3E5" }, -- Functions
        -- 			["@keyword"] = { fg = "#F6A3E5" }, -- Keywords
        -- 			["@type"] = { fg = "#65BCFF" }, -- Types
        -- 			["@string"] = { fg = "#C3E88D" }, -- Strings
        -- 			["@number"] = { fg = "#FF966C" }, -- Numbers
        -- 			["@boolean"] = { fg = "#FF966C" }, -- Booleans
        -- 			["@operator"] = { fg = "#89DDFF" }, -- Operators
        -- 			["@property"] = { fg = "#4FD6BE" }, -- Properties
        -- 			["@condition"] = { fg = "#4FD6BE" },
        -- 			["@keyword.return"] = { fg = "#F6A3E5" },
        -- 			["@keyword.main"] = { fg = "#F6A3E5" },
        -- 			["@keyword.class"] = { fg = "#F6A3E5" },
        -- 			-- ["@storageclass"] = { fg = "#9D7CD8", italic = true },
        -- 			--
        -- 			-- Change punctuation color (semicolons and colons)
        -- 			["@punctuation.delimiter"] = { fg = "#89DDFF" },
        -- 			--
        -- 			-- -- Change indent guide color
        -- 			-- IndentBlanklineChar = { fg = "#3B4261" },
        -- 	}
        -- end,
        -- 	integrations = {
        -- 		cmp = true,
        -- 		gitsigns = true,
        -- 		nvimtree = true,
        -- 		treesitter = true,
        -- 		notify = false,
        -- 		mini = {
        -- 			enabled = true,
        -- 			indentscope_color = "",
        -- 		},
        -- 	},
      }
      vim.api.nvim_set_hl(
        0,
        "CursorLineNr",
        { fg = "#959DD4", bg = "NONE", bold = true }
      )
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })
      -- Set the background to be transparent
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    -- {
    -- 	"folke/tokyonight.nvim",
    -- 	lazy = false,
    -- 	priority = 1000,
    -- 	opts = {
    -- 		style = "moon",  -- This will use the default night style
    -- 		transparent = false, -- If you want transparency
    -- 		styles = {
    -- 			comments = { italic = true },
    -- 			keywords = { italic = true },
    -- 			functions = { bold = true },
    -- 			variables = {},
    -- 		},
    -- 		on_highlights = function(hl, c)
    -- 			hl.CursorLineNr = { fg = "#959DD4", bg = "NONE", bold = true }
    -- 			-- Add any other custom highlights here
    -- 		end,
    -- 	},
    -- 	config = function()
    -- 		-- Load the colorscheme
    -- 		-- vim.cmd([[colorscheme tokyonight]])
    --
    -- 		-- Set the background to be transparent
    -- 		-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    -- 		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    -- 	end,
    -- },
  },
}
