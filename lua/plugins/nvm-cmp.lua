-- Custom Snippets for JSX/TSX
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("javascriptreact", {
	s(
		"fcc",
		fmt(
			[[
import './{}.css'

const {} = () => {{
  return (
    <div className="{}">{}</div>
  )
}}

export default {}
  ]],
			{
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:lower()
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:lower()
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
			}
		)
	),

	s(
		"fcs",
		fmt(
			[[
import './{}.scss'

function {}() {{
  return (
    <div className="{}">{}</div>
  )
}}

export default {}
  ]],
			{
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:lower()
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:lower()
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
			}
		)
	),

	s(
		"acs",
		fmt(
			[[
import './{}.scss'

const {} = () => {{
  return (
    <div className="{}">{}</div>
  )
}}

export default {}
  ]],
			{
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:lower()
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:lower()
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
			}
		)
	),

	s(
		"comp",
		fmt(
			[[
const {} = () => {{
  return (
    <div>{}</div>
  )
}}

export default {}
  ]],
			{
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
			}
		)
	),

	s(
		"compt",
		fmt(
			[[
const {} = () => {{
  return (
    <div className="">{}</div>
  )
}}

export default {}
  ]],
			{
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
				f(function(_, snip)
					return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
				end),
			}
		)
	),
})

-- Add the same snippets for TypeScript React (TSX) files
ls.add_snippets("typescriptreact", ls.get_snippets("javascriptreact"))

-- nvim-cmp configuration
return {
	"hrsh7th/nvim-cmp",
	opts = function(_, opts)
		local cmp = require("cmp")
		opts.mapping["<C-J>"] = cmp.config.disable
		opts.mapping["<C-P>"] = cmp.config.disable
	end,
}
-- return { -- override nvim-cmp plugin
-- 	"hrsh7th/nvim-cmp",
-- 	-- override the options table that is used in the `require("cmp").setup()` call
-- 	opts = function(_, opts)
-- 		-- opts parameter is the default options table
-- 		-- the function is lazy loaded so cmp is able to be required
-- 		local cmp = require("cmp")
-- 		-- modify the mapping part of the table
-- 		-- opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
-- 		opts.mapping["<C-J>"] = cmp.config.disable
-- 		opts.mapping["<C-P>"] = cmp.config.disable
-- 		-- cpm.util.keymap.del_map("<C-J>")
-- 	end,
-- }
