-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	-- import/override with your plugins folder
	{ import = "astrocommunity.game.leetcode-nvim" },
	{ import = "astrocommunity.motion.marks-nvim" },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
	{ import = "astrocommunity.indent.mini-indentscope" },
	-- { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	-- { import = "astrocommunity.pack.nvchad-ui" },
}
