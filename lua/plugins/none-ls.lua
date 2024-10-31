-- Customize None-ls sources
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Prettier (for JavaScript, TypeScript, JSON, CSS, SCSS, HTML, Vue, etc.)
      null_ls.builtins.formatting.prettier.with {
        extra_args = {
          "--print-width",
          "80",
          "--prose-wrap",
          "always",
        },
      },
      -- Python
      null_ls.builtins.formatting.black.with {
        extra_args = { "--line-length", "80" },
      },
      -- Lua
      null_ls.builtins.formatting.stylua.with {
        extra_args = {
          "--column-width",
          "80",
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      },
      -- Rust
      -- null_ls.builtins.formatting.rustfmt.with {
      --   extra_args = { "--config", "max_width=80" },
      -- },
      -- Go
      null_ls.builtins.formatting.gofmt.with {
        extra_args = { "-w", "80" },
      },
      -- C/C++
      null_ls.builtins.formatting.clang_format.with {
        extra_args = { "--style={ColumnLimit: 80}" },
      },
      -- Java
      null_ls.builtins.formatting.google_java_format.with {
        extra_args = { "--aosp" }, -- Android style uses 80 columns
      },
    })
  end,
}
