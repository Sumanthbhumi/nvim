return {
  { "nvchad/volt", lazy = true },
  { "nvchad/minty", lazy = true },
  vim.keymap.set("n", "<c-t>", function() require("minty.huefy").open { border = true } end, {}),
}
