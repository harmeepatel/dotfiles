" ---- General -----
set relativenumber
set smartindent

" ----- Key remaps -----
let mapleader = " "
inoremap kj <Esc>
inoremap jk <Esc>

nnoremap ; :
vnoremap ; :

" tab changing
nnoremap <leader>k gt
nnoremap <leader>j gT
vnoremap <leader>k gt
vnoremap <leader>j gT

" remove trailing white spaces
vim.cmd [[
    augroup RemoveWhiteSpaces
        autocmd!
        autocmd BufWritePre * :%s/\s\+$//e
    augroup END
]]
