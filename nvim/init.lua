-- Bootstrap lazy.nvim
---@diagnostic disable: missing-fields
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
--[[OPTIONS]] --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
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
vim.opt.cursorlineopt = "both"
vim.o.backspace = "indent,eol,start" -- split windows
vim.o.splitright = true
vim.o.splitbelow = true              -- spell checking
vim.o.spelllang = 'en_us'
vim.o.spell = false
--[[KEYMAPS]] --
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<leader>=", ":Format<CR>", { desc = 'Format', silent = true })
vim.keymap.set("n", "<leader>st", ":Themery<CR>", { desc = '[S]elect [T]heme' })
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = 'Increase by 1' })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = 'Decrease by 1' })
vim.keymap.set("n", "cs", ":noh<CR>", { silent = true, desc = '[C]lear [S]earch' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move Selected Text Up' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move Selected Text Down' })
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Delete at end of line' })
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Escape Remap' })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>xo", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make file runnnable bash' })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>", { desc = 'Go To Plugin Manager File' });
-- Bufferline indent setup
vim.keymap.set('n', '<Tab>', ">>", { desc = 'Move line forward by Tabsize' })
vim.keymap.set('n', '<S-Tab>', "<<", { desc = 'Move line backwards by Tabsize' })
vim.keymap.set('v', '<Tab>', ">gv", { desc = 'Move block forward by Tabsize' })
vim.keymap.set('v', '<S-Tab>', "<gv", { desc = 'Move block backwards by Tabsize' })
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        --[[KEYMAP HINTS]] --
        { 'folke/which-key.nvim' },
        --[[COLORSCHEME]]  --
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd [[colorscheme tokyonight-night]]
            end
        },
        --[[GIT]] --
        {
            -- Adds git related signs to the gutter, as well as utilities for managing changes
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup {
                    signs        = {
                        add          = { text = " ▌" },
                        change       = { text = " ▌" },
                        delete       = { text = " ▌" },
                        topdelete    = { text = " ▌" },
                        changedelete = { text = " ▌" },
                        untracked    = { text = " ▌" },
                    },
                    signs_staged = {
                        add          = { text = " ▌" },
                        change       = { text = " ▌" },
                        delete       = { text = " ▌" },
                        topdelete    = { text = " ▌" },
                        changedelete = { text = " ▌" },
                        untracked    = { text = " ▌" },
                    },
                    on_attach    = function(bufnr)
                        vim.keymap.set('n', '<leader>gn', require('gitsigns').nav_hunk,
                            { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                        vim.keymap.set('n', '<leader>gk', require('gitsigns').preview_hunk,
                            { buffer = bufnr, desc = 'Git Preview Hunk' })
                        vim.keymap.set('n', '<leader>gK', require('gitsigns').preview_hunk_inline,
                            { buffer = bufnr, desc = 'Git Preview Hunk Inline' })
                        vim.keymap.set('n', '<leader>gs', require('gitsigns').stage_hunk, { desc = "Git Stage Hunk" })
                        vim.keymap.set('n', '<leader>gS', require('gitsigns').stage_buffer, { desc = "Git Stage Buffer" })
                        vim.keymap.set('n', '<leader>gu', require('gitsigns').undo_stage_hunk,
                            { desc = "Git Undo Stage Hunk" })
                        vim.keymap.set('n', '<leader>gr', require('gitsigns').reset_hunk, { desc = "Git Reset Hunk" })
                        vim.keymap.set('n', '<leader>gR', require('gitsigns').reset_buffer, { desc = "Git Reset Buffer" })
                    end,
                }
            end,
        },
        --[[AUTOCOMPLETE]] --
        -- Autocompletion
        {
            "hrsh7th/nvim-cmp",
            event = { "BufReadPost", "BufNewFile" },
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                {
                    "L3MON4D3/LuaSnip",
                    version = "v2.3",
                },
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
                "onsails/lspkind.nvim",
                "windwp/nvim-ts-autotag",
                "windwp/nvim-autopairs",
            },
            config = function()
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                local cmp = require("cmp")
                local luasnip = require("luasnip")
                local lspkind = require("lspkind")

                local diagnostics = {
                    Error = " ",
                    Warning = " ",
                    Warn = " ",
                    Information = " ",
                    Question = " ",
                    Hint = "󰌶 ",
                    Debug = " ",
                    Trace = "✎",
                }
                for type, icon in pairs(diagnostics) do
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


                require("nvim-autopairs").setup()

                -- Integrate nvim-autopairs with cmp
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

                -- Load snippets
                require("luasnip.loaders.from_vscode").lazy_load()

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    completion = { completeopt = "menu,menuone,noinsert" },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, { "i", "s" }),
                        ["<C-u>"] = cmp.mapping.scroll_docs(-4),           -- scroll up preview
                        ["<C-d>"] = cmp.mapping.scroll_docs(4),            -- scroll down preview
                        ["<C-Space>"] = cmp.mapping.complete({}),          -- show completion suggestions
                        ["<C-c>"] = cmp.mapping.abort(),                   -- close completion window
                        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
                    }),
                    -- sources for autocompletion
                    sources = cmp.config.sources({
                        { name = "nvim_lsp",               group_index = 1 },                     -- lsp
                        { name = "buffer",                 max_item_count = 5, group_index = 2 }, -- text within current buffer
                        { name = "path",                   max_item_count = 3, group_index = 3 }, -- file system paths
                        { name = "luasnip",                max_item_count = 3, group_index = 5 }, -- snippets
                        { name = "nvim-lsp-signature-help" },
                    }),
                    -- Enable pictogram icons for lsp/autocompletion
                    formatting = {
                        expandable_indicator = true,
                        format = lspkind.cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                            ellipsis_char = "...",
                            menu = {
                                nvim_lsp = "[LSP]",
                                buffer = "[Buffer]",
                                path = "[PATH]",
                                luasnip = "[LuaSnip]",
                            },
                        }),
                    },
                    experimental = {
                        ghost_text = true,
                    },
                })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            event = { "BufReadPost" },
            cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
            dependencies = {
                -- Plugin(s) and UI to automatically install LSPs to stdpath
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",

                -- Install lsp autocompletions
                "hrsh7th/cmp-nvim-lsp",

                -- Progress/Status update for LSP
                { "j-hui/fidget.nvim", opts = {} },
            },
            config = function()
                -- Default handlers for LSP
                local default_handlers = {
                    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                    ["textDocument/show_line_diagnostics"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                    ["textDocument/diagnostic"] = vim.lsp.with(vim.diagnostic.open_float, { border = "rounded" }),
                    ["textDocument/diagnostics"] = vim.lsp.with(vim.lsp.diagnostic.hover, { border = "rounded" }),
                    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
                }

                local ts_ls_inlay_hints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                }

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

                -- Function to run when neovim connects to a Lsp client
                ---@diagnostic disable-next-line: unused-local
                local on_attach = function(client, bufnr)
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
                    nmap('gt', function()
                        vim.cmd('vsplit')
                        vim.lsp.buf.definition()
                    end, '[G]oto Definition in new [T]ab')
                    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
                        '[W]orkspace [S]ymbols')

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
                -- LSP servers and clients are able to communicate to each other what features they support.
                --  By default, Neovim doesn't support everything that is in the LSP Specification.
                --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
                --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

                -- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
                --  Add any additional override configuration in the following tables. Available keys are:
                --  - cmd (table): Override the default command used to start the server
                --  - filetypes (table): Override the default list of associated filetypes for the server
                --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
                --  - settings (table): Override the default settings passed when initializing the server.
                --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
                local servers = {
                    -- LSP Servers
                    bashls = {},
                    biome = {},
                    cssls = {},
                    gleam = {
                        settings = {
                            inlayHints = true,
                        },
                    },
                    eslint = {
                        autostart = false,
                        cmd = { "vscode-eslint-language-server", "--stdio", "--max-old-space-size=12288" },
                        settings = {
                            format = false,
                        },
                    },
                    html = {},
                    jsonls = {},
                    lua_ls = {
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                workspace = {
                                    checkThirdParty = false,
                                    -- Tells lua_ls where to find all the Lua files that you have loaded
                                    -- for your neovim configuration.
                                    library = {
                                        "${3rd}/luv/library",
                                        unpack(vim.api.nvim_get_runtime_file("", true)),
                                    },
                                },
                                telemetry = { enabled = false },
                            },
                        },
                    },
                    marksman = {},
                    ocamllsp = {
                        manual_install = true,
                        cmd = { "dune", "exec", "ocamllsp" },
                        settings = {
                            codelens = { enable = true },
                            inlayHints = { enable = true },
                            syntaxDocumentation = { enable = true },
                        },
                    },
                    nil_ls = {},
                    pyright = {},
                    gopls = {},
                    sqlls = {},
                    tailwindcss = {
                        filetypes = {
                            "typescriptreact",
                            "javascriptreact",
                            "html",
                            "svelte",
                        },
                    },
                    ts_ls = {
                        settings = {
                            maxTsServerMemory = 12288,
                            typescript = {
                                inlayHints = ts_ls_inlay_hints,
                            },
                            javascript = {
                                inlayHints = ts_ls_inlay_hints,
                            },
                        },
                    },
                    yamlls = {},
                    svelte = {},
                    rust_analyzer = {
                        check = {
                            command = "clippy",
                            features = "all",
                        },
                    },
                }

                local formatters = {
                    prettierd = {},
                    stylua = {},
                }

                local manually_installed_servers = { "ocamllsp", "gleam", "rust_analyzer" }

                local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))

                local ensure_installed = vim.tbl_filter(function(name)
                    return not vim.tbl_contains(manually_installed_servers, name)
                end, mason_tools_to_install)

                require("mason-tool-installer").setup({
                    auto_update = true,
                    run_on_start = true,
                    start_delay = 3000,
                    debounce_hours = 12,
                    ensure_installed = ensure_installed,
                })

                -- Iterate over our servers and set them up
                for name, config in pairs(servers) do
                    require("lspconfig")[name].setup({
                        autostart = config.autostart,
                        cmd = config.cmd,
                        capabilities = capabilities,
                        filetypes = config.filetypes,
                        handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
                        on_attach = on_attach,
                        settings = config.settings,
                        root_dir = config.root_dir,
                    })
                end

                -- Setup mason so it can manage 3rd party LSP servers
                require("mason").setup({
                    ui = {
                        border = "rounded",
                    },
                })

                require("mason-lspconfig").setup()

                -- Configure borderd for LspInfo ui
                require("lspconfig.ui.windows").default_options.border = "rounded"

                -- Configure diagnostics border
                vim.diagnostic.config({
                    float = { border = "rounded" },
                    severity_sort = true,
                    virtual_text = false,
                    -- virtual_text = {
                    --     prefix = '●', -- Could be '●', '▎', 'x'
                    -- },
                })
            end,
        },
        {
            "stevearc/conform.nvim",
            event = { "BufWritePre" },
            cmd = { "ConformInfo" },
            opts = {
                notify_on_error = false,
                default_format_opts = {
                    async = true,
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
                format_after_save = {
                    async = true,
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
                formatters_by_ft = {
                    javascript = { "biome" },
                    typescript = { "biome" },
                    typescriptreact = { "biome" },
                    svelte = { "prettierd", "prettier " },
                    lua = { "stylua" },
                },
            },
        },
        --[[PRETTIFY]] --
        -- Add indentation guides even on blank lines
        {
            'lukas-reineke/indent-blankline.nvim',
            -- See `:help indent_blankline.txt`
            main = "ibl",
        },
        {
            'nvim-tree/nvim-web-devicons'
        },
        -- "gc" to comment visual regions/lines
        { 'numToStr/Comment.nvim', opts = {} },
        --[[NAVIGATION]] --
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
            config = function()
                local open_with_trouble = require("trouble.sources.telescope").open
                require('telescope').setup {
                    defaults = {
                        mappings = {
                            i = {
                                ['<C-u>'] = false,
                                ['<C-d>'] = false,
                                ["<c-t>"] = open_with_trouble
                            },
                            n = { ["<c-t>"] = open_with_trouble },
                        },
                    },
                }

                -- Enable telescope fzf native, if installed
                pcall(require('telescope').load_extension, 'fzf')

                -- See `:help telescope.builtin`
                vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
                    { desc = '[?] Find recently opened files' })
                vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
                    { desc = '[ ] Find existing buffers' })
                vim.keymap.set('n', '<leader>/', function()
                    -- You can pass additional configuration to telescope to change theme, layout, etc.
                    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                        -- winblend = 10,
                        previewer = true,
                    })
                end, { desc = '[/] Fuzzily search in current buffer' })

                vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files,
                    { desc = 'Search [G]it [F]iles' })
                vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
                vim.keymap.set('n', '<leader>hh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
                vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
                    { desc = '[S]earch current [W]ord' })
                vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
                vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
                    { desc = '[S]earch [D]iagnostics' })
            end
        },
        {
            -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            dependencies = {
                'nvim-treesitter/nvim-treesitter-textobjects',
            },
            build = ':TSUpdate',
            config = function()
                require('nvim-treesitter.configs').setup {
                    -- Add languages to be installed here that you want installed for treesitter
                    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },
                    modules          = {},
                    sync_install     = true,
                    ignore_install   = { '' },
                    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
                    auto_install     = false,
                }
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
                vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
            end
        },
        {
            "theprimeagen/harpoon",
            config = function()
                vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file,
                    { desc = 'Harpoon - Add file' })
                vim.keymap.set("n", "<leader>he", require("harpoon.ui").toggle_quick_menu, { desc = 'Harpoon - Menu' })

                vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end,
                    { desc = 'Harpoon Navigation Next' })
                vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end,
                    { desc = 'Harpoon Navigation Prev' })
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
                    "                                             ",
                    "         ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆              ",
                    "          ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦           ",
                    "                ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄         ",
                    "                 ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄        ",
                    "                ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀       ",
                    "         ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄      ",
                    "        ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄       ",
                    "       ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄      ",
                    "       ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄     ",
                    "            ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆         ",
                    "             ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃         ",
                    "                                             ",
                    "  ██╗  ██╗ ██████╗ ██╗  ██╗ ██████╗ ███████╗ ",
                    "  ██║ ██╔╝██╔═████╗██║ ██╔╝██╔═████╗██╔════╝ ",
                    "  █████╔╝ ██║██╔██║█████╔╝ ██║██╔██║███████╗ ",
                    "  ██╔═██╗ ████╔╝██║██╔═██╗ ████╔╝██║╚════██║ ",
                    "  ██║  ██╗╚██████╔╝██║  ██╗╚██████╔╝███████║ ",
                    "  ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ",
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
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        },
        {
            "SmiteshP/nvim-navic",
            requires = "neovim/nvim-lspconfig"
        },
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
                        hl = { bold = true, underline = false },
                    }
                }
            end
        },
        {
            "utilyre/barbecue.nvim",
            name = "barbecue",
            version = "*",
            dependencies = {
                "SmiteshP/nvim-navic",
                "nvim-tree/nvim-web-devicons", -- optional dependency
            },
            opts = {
                -- configurations go here
            },
        },
        --[[LUALINE]] --
        {
            "nvim-lualine/lualine.nvim",
            event = "VeryLazy",
            opts = function()
                vim.o.laststatus = vim.g.lualine_laststatus
                local opts = {
                    options = {
                        theme = "auto",
                        component_separators = { left = '╏', right = '╏' },
                        section_separators = { left = ' ', right = ' ' },
                        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
                    },
                    sections = {
                        lualine_a = { "mode" },
                        lualine_b = {
                            { "branch" },
                        },
                        lualine_c = {
                            {
                                'diff',
                                colored = true,
                                symbols = { added = ' ', modified = " ", removed = ' ' }, -- Changes the symbols used by the diff.
                            },
                            {
                                "diagnostics",
                                symbols = {
                                    error = " ",
                                    warn = " ",
                                    info = " ",
                                    hint = "󰌶 ",
                                },
                            },
                        },
                        lualine_x = { "filename", 'encoding', 'fileformat', 'filetype' },
                        lualine_y = {
                            { "progress", separator = " ", padding = { left = 1, right = 0 } },
                        },
                        lualine_z = {
                            { "location", padding = { left = 0, right = 1 } },
                        },
                    },
                    extensions = { "neo-tree", "lazy" },
                }

                -- do not add trouble symbols if aerial is enabled
                -- And allow it to be overriden for some buffer types (see autocmds)
                if vim.g.trouble_lualine then
                    local trouble = require("trouble")
                    local symbols = trouble.statusline({
                        mode = "symbols",
                        groups = {},
                        title = false,
                        filter = { range = true },
                        format = "{kind_icon}{symbol.name:Normal}",
                        hl_group = "lualine_c_normal",
                    })
                    table.insert(opts.sections.lualine_c, {
                        symbols and symbols.get,
                        cond = function()
                            return vim.b.trouble_lualine ~= false and symbols.has()
                        end,
                    })
                end

                return opts
            end,
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
        --[[FOLKE]] -- Yes, because folke needs its own section
        {
            "folke/trouble.nvim",
            opts = {
                focus = true
            }, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
            keys = {
                {
                    "<leader>xw",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Workspace Diagnostics (Trouble)",
                },
                {
                    "<leader>xd",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
                {
                    "<leader>xs",
                    "<cmd>Trouble symbols toggle<cr>",
                    desc = "Symbols (Trouble)",
                },
                {
                    "<leader>xl",
                    "<cmd>Trouble lsp toggle<cr>",
                    desc = "LSP Definitions / references / ... (Trouble)",
                },
                {
                    "<leader>xL",
                    "<cmd>Trouble loclist toggle<cr>",
                    desc = "Location List (Trouble)",
                },
                {
                    "<leader>xQ",
                    "<cmd>Trouble qflist toggle<cr>",
                    desc = "Quickfix List (Trouble)",
                },
            },
        },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false,        -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            },
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        },
        {
            "folke/snacks.nvim",
            priority = 1000,
            lazy = false,
            ---@type snacks.Config
            opts = {
                bigfile = { enabled = true },
                dashboard = { enabled = false },
                notifier = {
                    enabled = true,
                    timeout = 3000,
                },
                quickfile = { enabled = true },
                statuscolumn = { enabled = true },
                words = { enabled = true },
                styles = {
                    notification = {
                        wo = { wrap = true } -- Wrap notifications
                    }
                }
            },
            keys = {
                { "<leader>.",  function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer" },
                { "<leader>S",  function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer" },
                { "<leader>n",  function() Snacks.notifier.show_history() end,   desc = "Notification History" },
                { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
                { "<leader>cR", function() Snacks.rename.rename_file() end,      desc = "Rename File" },
                { "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse" },
                { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
                { "<leader>lg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
                { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
                { "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
                { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
                { "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
                { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",           mode = { "n", "t" } },
                { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",           mode = { "n", "t" } },
                {
                    "<leader>N",
                    desc = "Neovim News",
                    function()
                        Snacks.win({
                            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                            width = 0.6,
                            height = 0.6,
                            wo = {
                                spell = false,
                                wrap = false,
                                signcolumn = "yes",
                                statuscolumn = " ",
                                conceallevel = 3,
                            },
                        })
                    end,
                }
            },
        },
        {
            "folke/zen-mode.nvim",
            dependencies = { "folke/twilight.nvim" }
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
