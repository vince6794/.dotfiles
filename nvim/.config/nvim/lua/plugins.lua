-- Plugins

require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Fuzzy finder
        use 'junegunn/fzf.vim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
        }

        -- navigating the file tree
        -- TODO: Replace with something new or native netrw
        use "preservim/nerdtree"
        use 'ThePrimeagen/harpoon'

        -- Undo history
        -- use 'mbbill/undotree'

        -- Syntax Tree
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- We recommend updating the parsers on update
        use 'nvim-treesitter/nvim-treesitter-textobjects'

        -- Language Server
        use 'neovim/nvim-lspconfig'
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                local saga = require("lspsaga")

                saga.init_lsp_saga({
                    diagnostic_header = { "😡", "😥", "😤", "😐" },
                    code_action_lightbulb = {
                        enable = false,
                        sign = true,
                        enable_in_insert = true,
                        sign_priority = 20,
                        virtual_text = false,
                    },
                })
            end,
        })
        use 'github/copilot.vim'

        -- LSP Gui
        use {
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim"
        }

        -- Debug
        use 'mfussenegger/nvim-dap'
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
        use("theHamsta/nvim-dap-virtual-text")

        -- Errors
        use 'folke/trouble.nvim'

        -- -- Successor of use 'hrsh7th/nvim-compe'
        -- Completion
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'


        use {
            'stevearc/aerial.nvim',
            config = function() require('aerial').setup() end
        }

        -- for vsnip user.
        -- use 'hrsh7th/cmp-vsnip'
        -- use 'hrsh7th/vim-vsnip'

        -- Closing html tags
        use 'windwp/nvim-ts-autotag'

        -- Autocommenter
        -- use 'tpope/vim-commentary'
        use "terrortylor/nvim-comment"

        -- Themes
        -- winbar
        -- use { 'fgheng/winbar.nvim' }
        -- Display Indentation
        use 'Yggdroot/indentLine'
        --use 'gruvbox-community/gruvbox'
        use 'sainnhe/gruvbox-material'
        --use 'ryanoasis/vim-devicons'
        use 'kyazdani42/nvim-web-devicons'
        --use 'folke/tokyonight.nvim'
        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        -- Smooth scrolling
        use {
            'declancm/cinnamon.nvim',
            config = function() require('cinnamon').setup(
                    {
                        extra_keymaps = true,
                        extended_keymaps = true,
                        -- OPTIONS:
                        always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
                        centered = true, -- Keep cursor centered in window when using window scrolling.
                        default_delay = 2, -- The default delay (in ms) between each line when scrolling.
                        hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
                        horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
                        max_length = -1, -- Maximum length (in ms) of a command. The line delay will be
                        -- re-calculated. Setting to -1 will disable this option.
                        scroll_limit = 50, -- Max number of lines moved before scrolling is skipped. Setting
                        -- to -1 will disable this option.
                    }
                )
            end
        }

        -- Indentation helper
        use 'Darazaki/indent-o-matic'

        -- Indentation blankline
        use "lukas-reineke/indent-blankline.nvim"


        -- UI and Emoji
        -- use "stevearc/dressing.nvim"
        use 'onsails/lspkind.nvim'
        use 'RRethy/vim-illuminate'

        -- Fixing opening buffers in a quickfix/explorer
        -- use 'stevearc/stickybuf.nvim'

        use 'junegunn/vim-emoji'

        -- Notifications
        use 'rcarriga/nvim-notify'

        -- Languages
        -- Go --
        -- use 'ray-x/go.nvim'
        -- use 'ray-x/guihua.lua'

    end
)

-- Plugin config
require('plug_config')
pluginsConfig.config()
