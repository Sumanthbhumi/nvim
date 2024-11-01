-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" }, -- adds a bunch of lua utilities
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" }, -- indent highlight
  { import = "astrocommunity.colorscheme" },
}
