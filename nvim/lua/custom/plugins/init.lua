-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require 'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          }
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true,
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
          }
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
          }
        },
      }
    end
  },
  {
    "theprimeagen/harpoon",
    config = function()
      vim.keymap.set("n", "<C-a>", require("harpoon.mark").add_file,
        { desc = 'Harpoon - Add file' })
      vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu, { desc = 'Harpoon - Menu' })

      vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end,
        { desc = 'Harpoon Navigation 1' })
      vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(2) end,
        { desc = 'Harpoon Navigation 2' })
      vim.keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_file(3) end,
        { desc = 'Harpoon Navigation 3' })
      vim.keymap.set("n", "<C-s>", function() require("harpoon.ui").nav_file(4) end,
        { desc = 'Harpoon Navigation 4' })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  {
    'nanozuki/tabby.nvim',
    config = function()
      local function lsp_diag(buf)
        local diagnostics = vim.diagnostic.get(buf)
        local count = { 0, 0, 0, 0 }

        for _, diagnostic in ipairs(diagnostics) do
          count[diagnostic.severity] = count[diagnostic.severity] + 1
        end
        if count[1] > 0 then
          return vim.bo[buf].modified and "" or ""
        elseif count[2] > 0 then
          return vim.bo[buf].modified and "" or ""
        end
        return vim.bo[buf].modified and "" or ""
      end
      local theme = {
        fill = 'TabLineFill',
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = 'TabLine',
        current_tab = 'TabLineSel',
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine',
      }
      require('tabby.tabline').set(function(line)
        return {
          {
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep('', hl, theme.fill),
              tab.is_current() and '' or '󰆣',
              tab.number(),
              tab.name(),
              tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep('', theme.win, theme.fill),
              win.is_current() and '' or '',
              win.buf_name(),
              line.sep('', theme.win, theme.fill),
              lsp_diag(win.buf().id),
              line.sep('', theme.win, theme.fill),
              margin = ' ',
            }
          end),
          {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)
      vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true, desc = 'Open New Tab' })
      vim.keymap.set("n", "<leader>tx", "<:tabclose<CR>", { silent = true, desc = 'Close Current Tab' })
      vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { silent = true, desc = 'Go To Next Tab' })
      vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { silent = true, desc = ' Go To Previous Tab' })
    end
  },
  {
    "folke/trouble.nvim",
    config = function()
      vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>",
        { silent = true, noremap = true, desc = 'Toggle Trouble' })
      vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>",
        { silent = true, noremap = true, desc = 'Workspace Diagnostics' })
      vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>",
        { silent = true, noremap = true, desc = 'Document Diagnostics' })
      vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>",
        { silent = true, noremap = true, desc = 'QuickFix Suggestions' })
      vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>",
        { silent = true, noremap = true, desc = 'LocList' })
      vim.keymap.set("n", "gR", ":TroubleToggle lsp_references<CR>",
        { silent = true, noremap = true, desc = 'LSP References' })
    end
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup {
        render = "compact",
        stages = 'fade',
        background_colour = 'FloatShadow',
        timeout = 3000,
      }
      vim.notify = require('notify')
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require('noice').setup({
        presets = {
          -- you can enable a preset by setting it to true, or a table that will override the preset config
          -- you can also add custom presets that you can enable/disable with enabled=true
          bottom_search = false,         -- use a classic bottom cmdline for search
          command_palette = false,       -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false,            -- enables an input dialog for inc-rename.nvim
        },
        views = {
          cmdline_popup = {
            position = {
              row = 9,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 12,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "DiagnosticInfo"
              },
            },
          },
        }
      })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
      vim.keymap.set('n', '<leader>pv', ":NvimTreeToggle<CR>", { silent = true, desc = '[P]roject [V]iew}' })
      vim.keymap.set('n', '<leader>pf', ":NvimTreeFocus<CR>", { silent = true, desc = '[P]roject [F]ocus' })
    end,
    requires = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
      { "SmiteshP/nvim-navic" },
    },
    config = function()
      require('breadcrumbs').setup({
        enabled = true,

        show_file_path = true,
        show_symbols = true,

        colors = {
          path = '', -- You can customize colors like #c946fd
          file_name = '',
          symbols = '',
        },

        icons = require("custom.utils.icons").kind,
        exclude_filetype = {
          'help',
          'startify',
          'dashboard',
          'packer',
          'neogitstatus',
          'NvimTree',
          'Trouble',
          'alpha',
          'lir',
          'Outline',
          'spectre_panel',
          'toggleterm',
          'qf',
        }
      })
    end
  },
  -- Themes Installed
  {
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {}
    },
    "rebelot/kanagawa.nvim",

  },
  {
    -- Theme Manager
    'zaldih/themery.nvim',
    config = function()
      vim.cmd.colorscheme "tokyonight"
      require("themery").setup({
        themes = { "tokyonight", "tokyonight-night", "tokyonight-storm", "tokyonight-day", "tokyonight-moon",
          "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus" }, -- Your list of installed colorschemes
        livePreview = true,                                       -- Apply theme while browsing. Default to true.
      })
    end
  }
}
