-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)
    -- packer can manage itself
    use("wbthomason/packer.nvim")

    ---------------------------------------------------
    ------------ START OF PACKER LIBRARIES ------------ 
    ---------------------------------------------------
    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    use('whatyouhide/vim-gotham')

    use("szw/vim-maximizer") -- maximizes and restores current window

    -- essential plugins
    use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
    use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

    -- vs-code like icons
    use("kyazdani42/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- harpoon setup for fast switching between files
    use("theprimeagen/harpoon")

    -- fuzzy finding w/ telescope
    -- required by Telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use("nvim-treesitter/nvim-treesitter-context");

    -- support for local history
    use("mbbill/undotree")
    -- vim git status support
    use("tpope/vim-fugitive")
    -- LSP Support
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    -- Debugging Setup
    use {'mfussenegger/nvim-dap-python'}
    use {'mfussenegger/nvim-dap'}
    use {'leoluz/nvim-dap-go'}
    use {'rcarriga/nvim-dap-ui'}
    use {'theHamsta/nvim-dap-virtual-text'}
    use {'nvim-telescope/telescope-dap.nvim'}

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                shortcut_type = 'number',
                hide = {
                    statusline,    -- hide statusline default is true
                    tabline,       -- hide the tabline
                    winbar,        -- hide winbar
                },
                preview = {
                    command,       -- preview command
                    file_path,     -- preview file path
                    file_height,   -- preview file height
                    file_width,    -- preview file width
                },
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }
    ---------------------------------------------------
    ------------- END OF PACKER LIBRARIES ------------- 
    ---------------------------------------------------
    if packer_bootstrap then
        require("packer").sync()
    end
end)
-- if installations fail because make or clangd not found run: `xcodebuild -runFirstLaunch`
