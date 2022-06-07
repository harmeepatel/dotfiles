vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- startup time
    use 'dstein64/vim-startuptime'

    -- theme
    use 'RRethy/nvim-base16'

    -- show hex colors
    use 'norcalli/nvim-colorizer.lua'

    -- commenting
    use 'numToStr/Comment.nvim'

    -- box outline for comments
    use("LudoPinelli/comment-box.nvim")

    -- multiple cursors
    use 'mg979/vim-visual-multi'

    -- indent guides
    -- use 'lukas-reineke/indent-blankline.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- devicons
    use 'kyazdani42/nvim-web-devicons'

    -- dufferline
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

    -- vim airline
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- nvim-tree
    use 'kyazdani42/nvim-tree.lua'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- git signs
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release
    }

    -- coc
    use {
        'neoclide/coc.nvim',
        run = 'yarn install --frozen-lockfile'
    }

    -- toggleterm
    use { "akinsho/toggleterm.nvim", tag = 'v1.*' }

    -- lsp
    -- use {
    --     "williamboman/nvim-lsp-installer",
    --     "neovim/nvim-lspconfig",
    -- }
    -- use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-cmdline'
    --
    -- -- " For vsnip users.
    -- use 'hrsh7th/cmp-vsnip'
    -- use 'hrsh7th/vim-vsnip'
    --
    -- -- For luasnip users.
    -- use 'L3MON4D3/LuaSnip'
    -- use 'saadparwaiz1/cmp_luasnip'
    --
    -- use 'onsails/lspkind.nvim'
    --
    -- use 'jose-elias-alvarez/nvim-lsp-ts-utils'

end)
