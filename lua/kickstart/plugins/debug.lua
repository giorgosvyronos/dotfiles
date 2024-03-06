-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        {
            "rcarriga/nvim-dap-ui",
            dependencies = "mfussenegger/nvim-dap",
            config = function()
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end
        },
        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',

        -- python related debugging plugins, based on starter.lvim repo
        "ChristianChiarulli/swenv.nvim",
        "stevearc/dressing.nvim",
        {
            "mfussenegger/nvim-dap-python",
            ft = "python",
            dependencies = {
                "mfussenegger/nvim-dap",
                "rcarriga/nvim-dap-ui",
            },
            config = function(_, opts)
                local path = "~/workplace/gvyronos/TestDebuggerFokkerOdin/.bemol/FokkerOdin-1.0/Python/farm/bin/python"
                require("dap-python").setup(path)
            end,
        },
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-python"
    },
    config = function()
        local dap = require 'dap'
        dap.configurations.python = {
            {
                name = "Python Test",
                type = 'python',
                request = 'launch',
                program = '${file}',
                console = 'integratedTerminal',
            },
        }
        local dap_python = require 'dap-python'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,
            automatic_installation = true,
            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {
                function(config)
                    -- all sources with no handler get passed here

                    -- Keep original functionality
                    require('mason-nvim-dap').default_setup(config)
                end,
                python = function(config)
                    config.adapters = {
                        type = "executable",
                        command =
                        "~/workplace/gvyronos/TestDebuggerFokkerOdin/.bemol/FokkerOdin-1.0/Python/farm/bin/python",
                        args = {
                            "-m",
                            "debugpy.adapter",
                        },
                    }
                    require('mason-nvim-dap').default_setup(config) -- don't forget this!
                end,
            },

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'delve',
                -- python related
                'flake8',
                'black',
                'pyright'
            },
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
            { desc = 'Debug: Set Breakpoint' })

        vim.keymap.set('n', '<leader>dpr', dap_python.test_method, { desc = 'Python: Test Method' })
        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                enabled = true,
                element = '',
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        require('dap-go').setup()

        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    -- Extra arguments for nvim-dap configuration
                    -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                    dap = {
                        justMyCode = false,
                        console = "integratedTerminal",
                    },
                    args = { "--log-level", "DEBUG", "--quiet" },
                    runner = "pytest",
                })
            }
        })

        vim.keymap.set("n", "dm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Test Method" })
        vim.keymap.set("n", "dM", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
            { desc = "Test Method DAP" })
        vim.keymap.set("n", "df", "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
            { desc = "Test Class" })
        vim.keymap.set("n", "dF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
            { desc = "Test Class DAP" })
        vim.keymap.set("n", "dS", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Test Summary" })
    end,
}
