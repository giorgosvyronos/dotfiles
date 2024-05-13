--[[

=====================================================================
=================== GIORGOS VYRONOS NVIM CONFIG ====================
Single File Config for Neovim PDE
=====================================================================
--]]

-- [[
-- #################################################################
-- # MISC
-- #################################################################
-- ]]
local icons = {
    kind = {
      Array = " ",
      Boolean = " ",
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = "󰉋 ",
      Function = " ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = " ",
      -- Module = " ",
      Module = " ",
      Namespace = " ",
      Null = "󰟢 ",
      Number = " ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
    git = {
      LineAdded = " ",
      LineModified = " ",
      LineRemoved = " ",
      FileDeleted = " ",
      FileIgnored = "◌",
      FileRenamed = " ",
      FileStaged = "S",
      FileUnmerged = "",
      FileUnstaged = "",
      FileUntracked = "U",
      Diff = " ",
      Repo = " ",
      Octoface = " ",
      Copilot = " ",
      Branch = "",
    },
    ui = {
      ArrowCircleDown = "",
      ArrowCircleLeft = "",
      ArrowCircleRight = "",
      ArrowCircleUp = "",
      BoldArrowDown = "",
      BoldArrowLeft = "",
      BoldArrowRight = "",
      BoldArrowUp = "",
      BoldClose = "",
      BoldDividerLeft = "",
      BoldDividerRight = "",
      BoldLineLeft = "▎",
      BoldLineMiddle = "┃",
      BoldLineDashedMiddle = "┋",
      BookMark = "",
      BoxChecked = " ",
      Bug = " ",
      Stacks = "",
      Scopes = "",
      Watches = "󰂥",
      DebugConsole = " ",
      Calendar = " ",
      Check = "",
      ChevronRight = "",
      ChevronShortDown = "",
      ChevronShortLeft = "",
      ChevronShortRight = "",
      ChevronShortUp = "",
      Circle = " ",
      Close = "󰅖",
      CloudDownload = " ",
      Code = "",
      Comment = "",
      Dashboard = "",
      DividerLeft = "",
      DividerRight = "",
      DoubleChevronRight = "»",
      Ellipsis = "",
      EmptyFolder = " ",
      EmptyFolderOpen = " ",
      File = " ",
      FileSymlink = "",
      Files = " ",
      FindFile = "󰈞",
      FindText = "󰊄",
      Fire = "",
      Folder = "󰉋 ",
      FolderOpen = " ",
      FolderSymlink = " ",
      Forward = " ",
      Gear = " ",
      History = " ",
      Lightbulb = " ",
      LineLeft = "▏",
      LineMiddle = "│",
      List = " ",
      Lock = " ",
      NewFile = " ",
      Note = " ",
      Package = " ",
      Pencil = "󰏫 ",
      Plus = " ",
      Project = " ",
      Search = " ",
      SignIn = " ",
      SignOut = " ",
      Tab = "󰌒 ",
      Table = " ",
      Target = "󰀘 ",
      Telescope = " ",
      Text = " ",
      Tree = "",
      Triangle = "󰐊",
      TriangleShortArrowDown = "",
      TriangleShortArrowLeft = "",
      TriangleShortArrowRight = "",
      TriangleShortArrowUp = "",
    },
    diagnostics = {
      BoldError = "",
      Error = "",
      BoldWarning = "",
      Warning = "",
      BoldInformation = "",
      Information = "",
      BoldQuestion = "",
      Question = "",
      BoldHint = "",
      Hint = "󰌶",
      Debug = "",
      Trace = "✎",
    },
    misc = {
      Robot = "󰚩 ",
      Squirrel = " ",
      Tag = " ",
      Watch = "",
      Smiley = " ",
      Package = " ",
      CircuitBoard = " ",
    },
  }
  -- [[
  -- #################################################################
  -- # OPTIONS
  -- #################################################################
  -- ]]
  vim.g.mapleader = ' '           -- Set <space> as the leader key
  vim.g.maplocalleader = ' '      -- See `:help mapleader`
  vim.o.number = true             -- Make line numbers default
  vim.o.mouse = 'a'               -- Enable mouse mode
  vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
  vim.o.expandtab = true          -- tab & indentation
  vim.o.tabstop = 4
  vim.o.softtabstop = 4
  vim.o.shiftwidth = 4
  vim.o.autoindent = true
  vim.o.smartindent = true
  vim.o.showtabline = 1
  vim.o.breakindent = false -- Enable break indent
  vim.o.ignorecase = true   -- Case-insensitive searching UNLESS \C or capital in search
  vim.o.smartcase = true
  vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
  vim.o.updatetime = 50     -- Decrease update time
  vim.o.timeoutlen = 300    -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menuone,noselect'
  vim.o.scrolloff = 8
  vim.o.termguicolors = true
  vim.o.relativenumber = false
  vim.o.colorcolumn = "120"
  vim.o.swapfile = false
  vim.o.backup = false
  vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
  vim.o.undofile = true                -- search settings
  vim.o.hlsearch = false
  vim.o.incsearch = true               -- cursor line
  vim.o.cursorline = true              -- backspace
  vim.o.backspace = "indent,eol,start" -- split windows
  vim.o.splitright = true
  vim.o.splitbelow = true              -- spell checking
  vim.o.spelllang = 'en_us'
  vim.o.spell = true
  
  -- [[
  -- #################################################################
  -- # KEYMAPS
  -- #################################################################
  -- ]]
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
  vim.keymap.set("n", "<leader>=", ":Format<CR>", { desc = 'Format' })
  vim.keymap.set("n", "<leader>st", ":Themery<CR>", { desc = '[S]elect [T]heme' })
  vim.keymap.set("i", "jk", "<ESC>")
  vim.keymap.set("n", "x", '"_x')
  vim.keymap.set("x", "p", [["_dP]])
  vim.keymap.set("n", "<leader>+", "<C-a>", { desc = 'Increase by 1' })
  vim.keymap.set("n", "<leader>-", "<C-x>", { desc = 'Decrease by 1' })
  vim.keymap.set("n", "<leader>cs", ":noh<CR>", { silent = true, desc = '[C]lear [S]earch' })
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move Selected Text Up' })
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move Selected Text Down' })
  vim.keymap.set("n", "J", "mzJ`z", { desc = 'Delete at end of line' })
  -- This is going to get me cancelled
  vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Escape Remap' })
  vim.keymap.set("n", "Q", "<nop>")
  vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
  vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Find and Replace' })
  vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make file runnnable bash' })
  vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>", { desc = 'Go To Plugin Manager File' });
  -- Windows
  vim.keymap.set("n", "<leader>sv", "<C-w>v", { silent = true, desc = '[S]plit Window [V]ertically' })
  vim.keymap.set("n", "<leader>sh", "<C-w>s", { silent = true, desc = '[S]plit Window [H]orizontally' })
  vim.keymap.set("n", "<leader>se", "<C-w>=", { silent = true, desc = '[S]plit Windows [E]qual Width' })
  vim.keymap.set("n", "<leader>sx", ":close<CR>", { silent = true, desc = '[S]plit Window [C]lose' })
  -- Bufferline indent setup
  vim.keymap.set('n', '<Tab>', ">>", { desc = 'Move line forward by Tabsize' })
  vim.keymap.set('n', '<S-Tab>', "<<", { desc = 'Move line backwards by Tabsize' })
  vim.keymap.set('v', '<Tab>', ">gv", { desc = 'Move block forward by Tabsize' })
  vim.keymap.set('v', '<S-Tab>', "<gv", { desc = 'Move block backwards by Tabsize' })
  
  -- [[
  -- #################################################################
  -- # PACKAGE MANAGER
  -- #################################################################
  -- ]]
  -- Package manager https://github.com/folke/lazy.nvim
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
  require('lazy').setup({
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
  
    'tpope/vim-sleuth',
  
    -- See `:help vim.o`
    -- Make line numbers default
    {
      -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true,  opts = { ensure_installed = { "black", "pyright" } } },
        'williamboman/mason-lspconfig.nvim',
  
        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
  
        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
      },
    },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },
    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
  
        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
  
        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
      },
    },
  
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },
    {
      -- Adds git related signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add = { hl = "GitSignsAdd", text = " ▌", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = " ▌", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = " ▌", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = " ▌", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = { hl = "GitSignsChange", text = " ▌", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        },
        current_line_blame = true,
        on_attach = function(bufnr)
          vim.keymap.set('n', 'gp', require('gitsigns').prev_hunk,
            { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
          vim.keymap.set('n', 'gn', require('gitsigns').next_hunk,
            { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
          vim.keymap.set('n', 'gk', require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = 'Git Preview Hunk' })
          vim.keymap.set('n', 'gK', require('gitsigns').preview_hunk_inline,
            { buffer = bufnr, desc = 'Git Preview Hunk Inline' })
          vim.keymap.set('n', 'gs', vim.cmd.Git, { desc = "Git Interface" })
        end,
      },
    },
    {
      -- Add indentation guides even on blank lines
      'lukas-reineke/indent-blankline.nvim',
      -- Enable `lukas-reineke/indent-blankline.nvim`
      -- See `:help indent_blankline.txt`
      main = "ibl",
    },
  
    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
  
    -- Fuzzy Finder (files, lsp, etc)
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
          cond = function()
            return vim.fn.executable 'make' == 1
          end,
        },
      },
    },
  
    {
      -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
    },
  
    -- autoformat.lua
    --
    -- Use your language server to automatically format your code on save.
    -- Adds additional commands as well to manage the behavior
  
    {
      'neovim/nvim-lspconfig',
      config = function()
        -- Switch for controlling whether you want autoformatting.
        --  Use :KickstartFormatToggle to toggle autoformatting on or off
        local format_is_enabled = true
        vim.api.nvim_create_user_command('KickstartFormatToggle', function()
          format_is_enabled = not format_is_enabled
          print('Setting autoformatting to: ' .. tostring(format_is_enabled))
        end, {})
  
        -- Create an augroup that is used for managing our formatting autocmds.
        --      We need one augroup per client to make sure that multiple clients
        --      can attach to the same buffer without interfering with each other.
        local _augroups = {}
        local get_augroup = function(client)
          if not _augroups[client.id] then
            local group_name = 'kickstart-lsp-format-' .. client.name
            local id = vim.api.nvim_create_augroup(group_name, { clear = true })
            _augroups[client.id] = id
          end
  
          return _augroups[client.id]
        end
  
        -- Whenever an LSP attaches to a buffer, we will run this function.
        --
        -- See `:help LspAttach` for more information about this autocmd event.
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
          -- This is where we attach the autoformatting for reasonable clients
          callback = function(args)
            local client_id = args.data.client_id
            local client = vim.lsp.get_client_by_id(client_id)
            local bufnr = args.buf
  
            -- Only attach to clients that support document formatting
            if not client.server_capabilities.documentFormattingProvider then
              return
            end
  
            -- Tsserver usually works poorly. Sorry you work with bad languages
            -- You can remove this line if you know what you're doing :)
            if client.name == 'tsserver' then
              return
            end
  
            -- Create an autocmd that will run *before* we save the buffer.
            --  Run the formatting command for the LSP that has just attached.
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = get_augroup(client),
              buffer = bufnr,
              callback = function()
                if not format_is_enabled then
                  return
                end
  
                vim.lsp.buf.format {
                  async = false,
                  filter = function(c)
                    return c.id == client.id
                  end,
                }
              end,
            })
          end,
        })
      end,
    },
    --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
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
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Local File History' })
      end,
    },
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local theta = require("alpha.themes.theta")
  
        theta.header.val = {
          "  ██╗  ██╗ ██████╗ ██╗  ██╗ ██████╗ ███████╗ ",
          "  ██║ ██╔╝██╔═████╗██║ ██╔╝██╔═████╗██╔════╝ ",
          "  █████╔╝ ██║██╔██║█████╔╝ ██║██╔██║███████╗ ",
          "  ██╔═██╗ ████╔╝██║██╔═██╗ ████╔╝██║╚════██║ ",
          "  ██║  ██╗╚██████╔╝██║  ██╗╚██████╔╝███████║ ",
          "  ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ",
          "                                             ",
        }
        theta.buttons.val = {
          { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
          { type = "padding", val = 1 },
          dashboard.button("e", "  New file", "<cmd>ene<CR>"),
          dashboard.button("SPC s f", "󰈞  [S]earch [F]ile"),
          dashboard.button("SPC s g", "󰊄  [S]earch [G]rep"),
          dashboard.button("c", "  Configuration", "<cmd>cd ~/.config/nvim/ <CR>"),
          dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
          dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        }
        alpha.setup(theta.config)
      end
    },
    {
      'nanozuki/tabby.nvim',
      event = 'VimEnter',
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function()
        local theme = {
          -- fill = 'TabLineFill',
          fill = { bg = '#26282A', style = 'italic' },
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
                line.sep('', hl, theme.fill),
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
                hl = theme.win,
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
      end,
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
        require("notify").setup({
          render = "compact",
          stages = 'static',
          background_colour = 'FloatShadow',
          timeout = 3000,
        })
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
          disable_netrw = true,
          hijack_netrw = true,
          respect_buf_cwd = true,
          sync_root_with_cwd = true,
          view = {
            relativenumber = true,
            float = {
              enable = true,
              open_win_config = function()
                local HEIGHT_RATIO = 0.8 -- You can change this
                local WIDTH_RATIO = 0.5
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                    - vim.opt.cmdheight:get()
                return {
                  border = "rounded",
                  relative = "editor",
                  row = center_y,
                  col = center_x,
                  width = window_w_int,
                  height = window_h_int,
                }
              end,
            },
            width = function()
              local WIDTH_RATIO = 0.5
              return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end,
          },
        })
        vim.keymap.set('n', '<leader>pv', ":NvimTreeToggle<CR>",
          { silent = true, desc = '[P]roject [V]iew}' })
      end,
      requires = { "nvim-tree/nvim-web-devicons" }
    },
    {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    },
    {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    },
    -- {
    --     "LunarVim/breadcrumbs.nvim",
    --     dependencies = {
    --         { "SmiteshP/nvim-navic" },
    --     },
    --     config = function()
    --         require('breadcrumbs').setup()
    --     end
    -- },
    -- {
    --     'Bekaboo/dropbar.nvim',
    --     requires = {
    --         'nvim-telescope/telescope-fzf-native.nvim'
    --     },
    -- },
    {
      "echasnovski/mini.indentscope",
      version = false, -- wait till new 0.7.0 release to put it back on semver
      opts = {
        symbol = "▏",
        -- symbol = "│",
        options = { try_as_border = true },
      },
      init = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })
      end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require('todo-comments').setup {
          vim.keymap.set("n", "<leader>xf", ":TodoTelescope<CR>", { silent = true, desc = "TodoQuickFix" })
        }
      end,
      opts = {
        signs = true,      -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE",         -- The gui style to use for the fg highlight group.
          bg = "BOLD",         -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true,                -- enable multine todo comments
          multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
          before = "",                     -- "fg" or "bg" or empty
          keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg",                    -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true,            -- uses treesitter to match keywords in comments only
          max_line_len = 400,              -- ignore lines longer than this
          exclude = {},                    -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      }
    },
    {
      "yamatsum/nvim-cursorline",
      config = function()
        require('nvim-cursorline').setup {
          cursorline = {
            enable = true,
            timeout = 1000,
            number = false,
          },
          cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
          }
        }
      end
    },
    {
      "aznhe21/actions-preview.nvim",
      config = function()
        vim.keymap.set({ "v", "n" }, "ca", require("actions-preview").code_actions)
        require("actions-preview").setup {
          diff = {
            algorithm = "patience",
            ignore_whitespace = true,
          },
          telescope = require("telescope.themes").get_dropdown { winblend = 10 },
        }
      end,
    },
    {
      "lunarvim/darkplus.nvim",
      event = VeryLazy,
      config = function()
        require('darkplus').setup {
          options = {
            transparency = true
          }
        }
        vim.cmd("colorscheme darkplus")
      end
    },
    {
      "freddiehaddad/feline.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        local present, feline = pcall(require, "feline")
        if not present then return end
  
        -- Customizations {{{
        local theme = {
          aqua = "#7AB0DF",
          bg = "#1C212A",
          blue = "#5FB0FC",
          cyan = "#70C0BA",
          darkred = "#FB7373",
          fg = "#C7C7CA",
          gray = "#222730",
          green = "#79DCAA",
          lime = "#54CED6",
          orange = "#FFD064",
          pink = "#D997C8",
          purple = "#C397D8",
          red = "#F87070",
          yellow = "#FFE59E"
        }
  
        local mode_theme = {
          ["NORMAL"] = theme.green,
          ["OP"] = theme.cyan,
          ["INSERT"] = theme.aqua,
          ["VISUAL"] = theme.yellow,
          ["LINES"] = theme.darkred,
          ["BLOCK"] = theme.orange,
          ["REPLACE"] = theme.purple,
          ["V-REPLACE"] = theme.pink,
          ["ENTER"] = theme.pink,
          ["MORE"] = theme.pink,
          ["SELECT"] = theme.darkred,
          ["SHELL"] = theme.cyan,
          ["TERM"] = theme.lime,
          ["NONE"] = theme.gray,
          ["COMMAND"] = theme.blue,
        }
  
        local modes = setmetatable({
          ["n"] = "N",
          ["no"] = "N",
          ["v"] = "V",
          ["V"] = "VL",
          [""] = "VB",
          ["s"] = "S",
          ["S"] = "SL",
          [""] = "SB",
          ["i"] = "I",
          ["ic"] = "I",
          ["R"] = "R",
          ["Rv"] = "VR",
          ["c"] = "C",
          ["cv"] = "EX",
          ["ce"] = "X",
          ["r"] = "P",
          ["rm"] = "M",
          ["r?"] = "C",
          ["!"] = "SH",
          ["t"] = "T",
        }, { __index = function() return "-" end })
        -- }}}
  
        -- Components {{{
        local navic = require("nvim-navic")
        local component = {}
        local winbar_support = {
          provider = function()
            return navic.get_location()
          end,
          enabled = function()
            return navic.is_available()
          end,
          hl = {
            fg = theme.aqua,
            bg = "bg",
            style = "bold",
          },
          left_sep = "",
          right_sep = "right_filled",
        }
        component.vim_mode = {
          -- provider = function() return modes[vim.api.nvim_get_mode().mode] end,
          provider = {
            name = "vi_mode",
            opts = {
              show_mode_name = true,
              -- padding = "center", -- Uncomment for extra padding.
            }
          },
  
          hl = function()
            return {
              fg = "bg",
              bg = require("feline.providers.vi_mode").get_mode_color(),
              style = "bold",
              name = "NeovimModeHLColor",
            }
          end,
          left_sep = "block",
          right_sep = "block",
        }
  
        component.git_branch = {
          provider = "git_branch",
          hl = {
            fg = "fg",
            bg = "bg",
            style = "bold",
          },
          left_sep = "block",
          right_sep = "",
        }
  
        component.git_add = {
          provider = "git_diff_added",
          hl = {
            fg = "green",
            bg = "bg",
          },
          left_sep = "",
          right_sep = "",
        }
  
        component.git_delete = {
          provider = "git_diff_removed",
          hl = {
            fg = "red",
            bg = "bg",
          },
          left_sep = "",
          right_sep = "",
        }
  
        component.git_change = {
          provider = "git_diff_changed",
          hl = {
            fg = "purple",
            bg = "bg",
          },
          left_sep = "",
          right_sep = "",
        }
  
        component.separator = {
          provider = "",
          hl = {
            fg = "bg",
            bg = "bg",
          },
        }
  
        component.diagnostic_errors = {
          provider = "diagnostic_errors",
          hl = {
            fg = "red",
          },
        }
  
        component.diagnostic_warnings = {
          provider = "diagnostic_warnings",
          hl = {
            fg = "yellow",
          },
        }
  
        component.diagnostic_hints = {
          provider = "diagnostic_hints",
          hl = {
            fg = "aqua",
          },
          right_sep = "block"
        }
  
        component.diagnostic_info = {
          provider = "diagnostic_info",
        }
  
        component.lsp = {
          provider = "lsp_client_names",
          hl = function()
            local progress = vim.lsp.util.get_progress_messages()[1]
            return {
              fg = progress and "yellow" or "green",
              bg = "gray",
              style = "bold",
            }
          end,
          left_sep = "",
          right_sep = "block",
        }
  
        component.file_type = {
          provider = {
            name = "file_type",
            opts = {
              filetype_icon = true,
            },
          },
          hl = {
            fg = "fg",
            bg = "gray",
          },
          left_sep = "block",
          right_sep = "block",
        }
  
  
        component.fileinfo = {
          provider = {
            name = "file_info",
            opts = {
              type = "short",
            },
          },
          hl = {
            style = "bold",
          },
          left_sep = "block",
          right_sep = "block",
        }
  
        component.scroll_bar = {
          provider = function()
            local chars = setmetatable({
              " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
              " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
            }, { __index = function() return " " end })
            local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
            local position = math.floor(line_ratio * 100)
  
            local icon = chars[math.floor(line_ratio * #chars)] .. position
            if position <= 5 then
              icon = " TOP"
            elseif position >= 95 then
              icon = " BOT"
            end
            return icon
          end,
          hl = function()
            local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
            local fg
            local style
  
            if position <= 5 then
              fg = "aqua"
              style = "bold"
            elseif position >= 95 then
              fg = "red"
              style = "bold"
            else
              fg = "purple"
              style = nil
            end
            return {
              fg = fg,
              style = style,
              bg = "bg",
            }
          end,
          left_sep = "block",
          right_sep = "block",
        }
        -- }}}
  
        -- Arrangements -- {{{
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#101317", fg = "#7AB0DF" })
        feline.setup({
          components = {
            active = {
              {
                component.vim_mode,
                component.git_branch,
                component.git_add,
                component.git_delete,
                component.git_change,
                component.separator,
              },
              {
                component.fileinfo,
                winbar_support,
              },
              {
                component.diagnostic_errors,
                component.diagnostic_warnings,
                component.diagnostic_info,
                component.diagnostic_hints,
                component.separator,
                component.separator,
                component.lsp,
                component.file_type,
                component.scroll_bar,
              },
            },
          },
          theme = theme,
          vi_mode_colors = mode_theme,
        })
      end
    }
  }, {})
  
  -- [[Options]]
  local signs = icons.diagnostics
  
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
  -- [[ Keymaps ]]
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })
  
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  }
  
  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')
  
  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = true,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
  
  vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
  vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>hh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  
  -- [[ Configure Treesitter ]]
  -- See `:help nvim-treesitter`
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed      = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },
    modules               = {},
    sync_install          = true,
    ignore_install        = { '' },
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install          = false,
  
    highlight             = { enable = true },
    indent                = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects           = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
  
  -- Diagnostic keymaps
  vim.diagnostic.config {
    float = { border = "rounded" },
  }
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  
  
  -- [[ Configure Bemol for Amazon Brazil Workspace LSP Support]]
  
  -- Bemol is a CLI tool able to analyze packages in a Brazil workspace, so that your favorite IDE can make sense of it and "just works".
  
  -- Running bemol from within a Brazil workspace directory will generate the LSP configuration for all the packages listed in the packageInfo file (other packages present in the workspace but not listed in packageInfo will be ignored).
  
  -- By default, Bemol will try to auto-detect the language(s) used in the packages as well as some additional properties, then it will generate LSP files. Some of this behavior can be configured, see the configuration documentation for more details.
  
  -- For the complete list of options, run bemol --help.
  
  function Bemol()
    local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
      local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
      if file then
        for line in file:lines() do
          table.insert(ws_folders_lsp, line)
        end
        file:close()
      end
    end
  
    for _, line in ipairs(ws_folders_lsp) do
      vim.lsp.buf.add_workspace_folder(line)
    end
  end
  
  -- [[ Configure LSP ]]
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(client, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local navic = require("nvim-navic")
    -- navic
    navic.setup {
      lsp = {
        auto_attach = false,
        preference = nil,
      },
      highlight = false,
      separator = " ➜  ",
      depth_limit = 4,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = true,
      click = true,
      format_text = function(text)
        return text
      end
    }
  
  
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
  
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
  
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  
    -- See `:help K` for why this keymap
    nmap('<leader>K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  
    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
  
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    vim.api.nvim_buf_create_user_command(bufnr, 'Bemol', function(_)
      Bemol()
    end, { desc = 'Run Bemol' })
  
    Bemol()
  end
  
  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  --
  --  If you want to override the default filetypes that your language server will attach to you can
  --  define the property 'filetypes' to the map in question.
  local servers = {
    clangd = {},
    gopls = {},
    pyright = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      single_file_support = true,
      line_length = 120,
      pyright = {
        disableLanguageServices = false,
        disableOrganizeImports = false
      },
      python = {
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly", -- openFilesOnly, workspace
          typeCheckingMode = "off",         -- off, basic, strict
          useLibraryCodeForTypes = true,
        }
      },
    },
    rust_analyzer = {},
    -- tsserver = {},
    -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }
  
  -- Setup neovim lua configuration
  require('neodev').setup()
  
  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  
  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/show_line_diagnostics"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/diagnostic"] = vim.lsp.with(vim.diagnostic.open_float, { border = "rounded" }),
    ["textDocument/diagnostics"] = vim.lsp.with(vim.lsp.diagnostic.hover, { border = "rounded" }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
  }
  
  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'
  
  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }
  
  
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = servers['pyright'],
    filetypes = (servers['pyright'] or {}).filetypes,
    handlers = handlers
  }
  
  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
        handlers = handlers
      }
    end
  }
  
  
  -- [[ Configure nvim-cmp ]]
  -- See `:help cmp`
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  require('luasnip.loaders.from_vscode').lazy_load()
  local icon = icons.kind
  luasnip.config.setup {}
  
  cmp.setup {
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
      fields = { 'abbr', 'menu', 'kind' },
      format = function(_, vim_item)
        vim_item.kind = (icon[vim_item.kind] or "") .. " " .. vim_item.kind
        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete {},
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
  
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }
  
  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et