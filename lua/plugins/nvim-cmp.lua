-- if true then return {} end
return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
      local ls = require "luasnip"
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local fmt = require("luasnip.extras.fmt").fmt

      -- Only load for specific filetypes
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
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:lower() end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:lower() end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
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
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:lower() end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:lower() end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
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
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:lower() end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:lower() end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
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
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
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
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
              f(function(_, snip) return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper) end),
            }
          )
        ),
      })

      -- Add the same snippets for TypeScript React
      ls.add_snippets("typescriptreact", ls.get_snippets "javascriptreact")
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    -- Optional: More specific loading conditions
    ft = { "javascriptreact", "typescriptreact" },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping["<C-J>"] = cmp.config.disable
      opts.mapping["<C-P>"] = cmp.config.disable
      local colors = require("catppuccin.palettes").get_palette()
      local custom_highlights = {
        CmpItemAbbr = { fg = colors.text },
        CmpItemAbbrMatch = { fg = colors.blue, bold = true },
        CmpItemKind = { fg = colors.teal },
        CmpItemMenu = { fg = "#3e456c" }, -- Changed this to use the menu for namespace
        CmpSel = { bg = colors.green, fg = colors.base, bold = true },
        CmpItemKindText = { fg = colors.teal },
        -- CmpPmenu = { bg = "#A1DC9D" }, -- change the background color of the menu
      }

      for group, properties in pairs(custom_highlights) do
        vim.api.nvim_set_hl(0, group, properties)
      end

      local cmp_kinds = {
        Text = "",
        Method = "",
        Function = "󰊕",
        Constructor = "",
        Field = "󱈢",
        Variable = "󰀫",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      opts.formatting = {
        format = function(entry, vim_item)
          -- Get the completion item details
          local item = entry:get_completion_item()

          -- Save the original abbr
          local word = vim_item.abbr
          -- Extract just the namespace
          if item.detail then
            local namespace = item.detail:match "([%w%.]+)%.%w+$"
            if namespace then
              -- Truncate the namespace if it's too long
              if #namespace > 20 then namespace = namespace:sub(1, 17) .. "..." end
              -- Add namespace with highlighting
              vim_item.abbr = word
              vim_item.menu = namespace
            end
          end

          -- Add the kind at the end
          vim_item.kind = string.format("%s %s", cmp_kinds[vim_item.kind], vim_item.kind)
          return vim_item
        end,
        fields = { "abbr", "menu", "kind" }, -- Specify the order of fields
      }

      opts.window = {
        completion = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
          scrollbar = "║",
          col_offset = 0,
          side_padding = 0,
        },
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder,CursorLine:CmpSel,Search:None",
          scrollbar = "║",
          max_width = 80,
          max_height = 12,
        },
      }

      -- Add size constraints
      opts.view = {
        entries = { name = "custom", selection_order = "near_cursor" },
        docs = {
          auto_open = true,
        },
      }

      -- Add new performance settings
      opts.performance = {
        max_view_entries = 50, -- Maximum number of items to show in the list
      }

      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
        keyword_length = 1,
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      }

      -- auto trigger completion
      local autocomplete_group = vim.api.nvim_create_augroup("AutoComplete", { clear = true })
      vim.api.nvim_create_autocmd("InsertEnter", {
        group = autocomplete_group,
        callback = function() cmp.complete() end,
      })
      --
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      return opts
    end,
  },
}
