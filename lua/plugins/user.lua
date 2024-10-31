-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    -- hint as you type
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        -- " █████  ███████ ████████ ██████   ██████",
        -- "██   ██ ██         ██    ██   ██ ██    ██",
        -- "███████ ███████    ██    ██████  ██    ██",
        -- "██   ██      ██    ██    ██   ██ ██    ██",
        -- "██   ██ ███████    ██    ██   ██  ██████",
        -- " ",
        -- "    ███    ██ ██    ██ ██ ███    ███",
        -- "    ████   ██ ██    ██ ██ ████  ████",
        -- "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        -- "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        -- "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      local ls = require "luasnip"

      -- Extend JavaScript snippets to React files
      ls.filetype_extend("javascriptreact", { "javascript" })
      ls.filetype_extend("typescriptreact", { "typescript" })
      ls.filetype_extend("javascriptreact", { "html" })
      ls.filetype_extend("javascript", { "html", "css", "javascriptreact" })
      ls.filetype_extend("typescript", { "typescriptreact" })

      -- Load snippets from your new package
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Set up keybindings
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, true, true),
            "n"
          )
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        else
          vim.fn.feedkeys(
            vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true),
            "n"
          )
        end
      end, { silent = true })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(
              cond.not_after_regex "%%"
            )
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(
              cond.none()
            )
            -- don't delete if the next character is xx
            :with_del(
              cond.not_after_regex "xx"
            )
            -- disable adding a newline when you press <cr>
            :with_cr(
              cond.none()
            ),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    -- surround the word with brackets and also changes them
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    -- for indentation
    "bullets-vim/bullets.vim",
    ft = { "markdown" },
  },

  {
    -- for creation of files
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", mode = "n" },
      { "<leader>-", mode = "n" },
    },
    cmd = "Oil",
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      }
      -- Open parent directory in current window
      vim.keymap.set(
        "n",
        "-",
        "<CMD>Oil<CR>",
        { desc = "Open parent directory" }
      )
      -- Open parent directory in floating window
      vim.keymap.set(
        "n",
        "<leader>-",
        require("oil").toggle_float,
        { desc = "Open parent directory in floating window" }
      )
    end,
  },

  {
    -- copilot
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-i>",
            accept_word = "<M-n>",
            accept_line = "<M-o>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = true,
          help = false,
          -- gitcommit = false,
          -- gitrebase = false,
          -- hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      }
    end,
  },

  {
    -- move lines and blocks of text up and down, like in vscode
    "matze/vim-move",
    event = "InsertEnter",
  },
  {
    -- vim motions in cmd
    "smilhey/ed-cmd.nvim",
    event = "CmdlineEnter",
    config = function()
      require("ed-cmd").setup {
        -- Those are the default options, you can just call setup({}) if you don't want to change the defaults
        cmdline = {
          keymaps = {
            edit = "<C-J>",
            execute = "<CR>",
            close = { "<C-C>", "q" },
          },
        },
        -- You enter normal mode in the cmdline with edit, execute a
        -- command from normal mode with execute and close the cmdline in
        -- normal mode with close

        -- The keymaps fields also accept list of keymaps
        -- cmdline = { keymaps = { close = { "<C-C>" , "q" } } },
        pumenu = { max_items = 100 },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = { timeout = 1000 },
  },

  {
    -- for colored brackets
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
  },

  {
    "nvim-java/nvim-java",
    ft = { "java" },
    event = "InsertEnter",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      -- "3rd/image.nvim",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
  },
}
