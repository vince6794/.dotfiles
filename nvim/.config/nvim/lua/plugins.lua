-- Plugins

require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Git
        use 'tpope/vim-fugitive'

        -- Fuzzy finder
        use 'junegunn/fzf.vim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
        }

        -- navigating the file tree
        use "preservim/nerdtree"

        -- Undo history
        -- use 'mbbill/undotree'

        -- Syntax Tree
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- We recommend updating the parsers on update
        use 'nvim-treesitter/nvim-treesitter-textobjects'

        -- Language Server
        use 'neovim/nvim-lspconfig'
        use 'github/copilot.vim'

        -- LSP Gui
        use {
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim"
        }


        -- Debug
        use 'mfussenegger/nvim-dap'
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

        -- Errors
        use 'folke/trouble.nvim'

        -- -- Successor of use 'hrsh7th/nvim-compe'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'

        -- for vsnip user.
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'

        -- Closing xhtml tags
        use 'alvan/vim-closetag'

        -- Autocommenter
        use 'tpope/vim-commentary'

        -- Themes
        -- Display Indentation
        use 'Yggdroot/indentLine'
        --use 'gruvbox-community/gruvbox'
        use 'sainnhe/gruvbox-material'
        use 'ryanoasis/vim-devicons'
        use 'kyazdani42/nvim-web-devicons'
        --use 'folke/tokyonight.nvim'
        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        -- UI and Emoji
        -- use "stevearc/dressing.nvim"
        use 'onsails/lspkind.nvim'

        require('lspkind').init({
            mode = 'symbol_text',
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            },
        })

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
