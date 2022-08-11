vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- startup time
    use 'dstein64/vim-startuptime'

    -- theme
    use 'RRethy/nvim-base16'
    use 'Mofiqul/vscode.nvim'

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

    -- statusline
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'
    use 'windwp/windline.nvim'

    -- nvim-tree
    use 'kyazdani42/nvim-tree.lua'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- coc
    -- use {
    --     'neoclide/coc.nvim',
    --     run = 'yarn install --frozen-lockfile'
    -- }

    use {
        'rodrigore/coc-tailwind-intellisense',
        run = 'npm install'
    }

    -- toggleterm
    use { "akinsho/toggleterm.nvim", tag = 'v1.*' }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'



    -- vimwiki
    use 'vimwiki/vimwiki'

end)
