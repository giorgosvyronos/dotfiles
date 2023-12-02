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
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Local File History' })
        end,
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local alpha = require("alpha")
            local startify = require("alpha.themes.startify")

            startify.section.header.val = {
                "  ██╗  ██╗ ██████╗ ██╗  ██╗ ██████╗ ███████╗ ",
                "  ██║ ██╔╝██╔═████╗██║ ██╔╝██╔═████╗██╔════╝ ",
                "  █████╔╝ ██║██╔██║█████╔╝ ██║██╔██║███████╗ ",
                "  ██╔═██╗ ████╔╝██║██╔═██╗ ████╔╝██║╚════██║ ",
                "  ██║  ██╗╚██████╔╝██║  ██╗╚██████╔╝███████║ ",
                "  ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ",
                "                                             ",
            }
            alpha.setup(startify.opts)
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
                return vim.bo[buf].modified and "'" or ""
            end
            local theme = {
                fill = { fg = '#f2e9de', bg = '#907aa9', style = 'italic' },
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
        "LunarVim/breadcrumbs.nvim",
        dependencies = {
            { "SmiteshP/nvim-navic" },
        },
        config = function()
            require('breadcrumbs').setup()
        end
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
    }
}
