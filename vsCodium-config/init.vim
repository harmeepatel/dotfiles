" ---- General -----
set relativenumber
set smartindent

" ----- Classic -----
let mapleader = " "
inoremap kj <Esc>
inoremap jk <Esc>

nnoremap j gj
nnoremap k gk
nnoremap J gj
nnoremap K gk
vnoremap j gj
vnoremap k gk
vnoremap J gj
vnoremap K gk

nnoremap ; :
vnoremap ; :

" ----- tab to indent -----
nnoremap <TAB> V>
nnoremap <S-TAB> V<
vnoremap <TAB> >
vnoremap <S-TAB> <


" ----- pasting in new line -----
nnoremap <leader>p :pu<CR>

" remove trailing white spaces
augroup RemoveWhiteSpaces
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END
