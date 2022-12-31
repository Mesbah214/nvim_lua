local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- packer.nvim configuration
    local conf = {
        profile = {
            enable = true,
            threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end

    -- Plugins
    local function plugins(use)
        -- Plugin manager
        use { "wbthomason/packer.nvim" }

        -- Color scheme
        use {
            "shaunsingh/nord.nvim",
            config = function()
                vim.g.nord_italic = false
                vim.g.nord_bold = false
                vim.cmd "colorscheme nord"
            end
        }

        -- Dashboard
        use {
            "glepnir/dashboard-nvim",
            config = function()
                require("config.dashboard").setup()
            end
        }

        -- Used by many plugins
        use { "nvim-lua/plenary.nvim" }
        use { "nvim-lua/popup.nvim" }

        -- Icons
        use {
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            config = function()
                require("nvim-web-devicons").setup { default = true }
            end,
            -- event = "BufWinEnter"
        }

        -- File explorer
        use {
            "nvim-tree/nvim-tree.lua",
            config = function()
                require("config.nvim-tree").setup()
            end,
            event = "BufWinEnter"
        }

        -- Status line
        use {
            "nvim-lualine/lualine.nvim",
            config = function()
                require("config.lualine").setup()
            end,
            event = "VimEnter"
        }

        -- Buffer line
        use {
            "akinsho/nvim-bufferline.lua",
            config = function()
                require("config.bufferline").setup()
            end,
            event = "BufReadPre"
        }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            -- opt = true,
            -- run = ":TSUpdate",
            config = function()
                require("config.treesitter").setup()
            end,
            -- event = "BufRead"
        }

        use {"windwp/nvim-ts-autotag"}

        -- Auto pairs
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
            end
        }

        -- Cyclist
        use { "tjdevries/cyclist.vim" }

        -- Comment plugin
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
            after = "nvim-treesitter",
            opt = true,
            config = function()
                require("config.lsp")
            end,
            event = "BufReadPre",
        }

        -- LSP completion plugins
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        -- cmp icons
        use 'onsails/lspkind.nvim'

        --snippet
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

        -- Telescope
        use { 'nvim-telescope/telescope-fzf-native.nvim',
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        }
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            config = function()
                require("telescope").setup()
            end,
            cmd = 'Telescope'
        }

        -- Indentation line
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup()
            end,
            event = "BufReadPre"
        }

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    packer_init()

    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)
end

return M
