" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore certain files and folders when globing
set wildignorecase  " ignore file and dir name cases in cmd-completion
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,*_build/*
set wildignore+=**/.git/*
set wildignore+=**/node_modules/*
set wildignore+=**/coverage/*
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv


" requires
lua << EOF
    require 'user.general'
    require 'user.colorscheme'
    require 'user.keymaps'
    require 'user.comment'
    require 'user.plugins'
    require 'user.colorizer'
    require 'user.web-devicons'
    require 'user.nvim-tree'
    require 'user.treesitter'
    require 'user.gitsigns'
    require 'user.indent-blankline'
    require 'user.telescope'

EOF

" coc servers
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-css',
    \ 'coc-tailwindcss',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-sumneko-lua',
    \ 'coc-markdownlint',
    \ 'coc-pyright',
    \ 'coc-lua',
    \ 'coc-pairs',
    \ 'coc-grammarly',
    \ 'coc-db',
    \ 'coc-highlight',
    \ 'coc-snippets',
    \ 'coc-ultisnips',
    \ 'coc-emoji',
    \ 'coc-dictionary',
    \ 'coc-word',
    \ 'coc-yank',
    \ ]

source ~/.config/nvim/lua/coc.vim
