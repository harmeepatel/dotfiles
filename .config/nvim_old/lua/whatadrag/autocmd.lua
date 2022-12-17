-- Transperant background in neovim
vim.cmd [[
    augroup Transperant
        autocmd!
        au ColorScheme * hi Normal ctermbg=none guibg=none
        au BufRead,BufNewFile * hi clear SignColumn
    augroup END
]]

-- Remove trailing white spaces
-- vim.cmd [[
--     augroup RemoveWhiteSpaces
--         autocmd!
--         autocmd BufWritePre * :%s/\s\+$//e
--     augroup END
-- ]]

-- colorscheme for huge js files
vim.cmd [[
    autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
    autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
]]

-- PackerSync on save
-- vim.cmd [[
--     autocmd BufWritePost plugins.lua :PackerSync
-- ]]

-- let g:airline#extensions#tabline#enabled = 1
-- vim.cmd [[
--     let g:airline#extensions#tabline#show_close_button = 1
--     let g:airline#extensions#tabline#tabs_label = ''
--     let g:airline#extensions#tabline#buffers_label = ''
--     let g:airline#extensions#tabline#fnamemod = ':t'
--     let g:airline#extensions#tabline#show_tab_count = 0
--     let g:airline#extensions#tabline#show_buffers = 1
--     let g:airline#extensions#tabline#tab_min_count = 1
--     let g:airline#extensions#tabline#show_splits = 0
--     let g:airline#extensions#tabline#show_tab_nr = 0
--     let g:airline#extensions#tabline#show_tab_type = 0
-- ]]




-- -- Nice menu when typing `:find *.py`
vim.cmd [[set wildmode=longest,list,full]]
vim.cmd [[set wildmenu]]
-- -- Ignore certain files and folders when globing
vim.cmd [[set wildignorecase  " ignore file and dir name cases in cmd-completion]]
vim.cmd [[set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe]]
vim.cmd [[set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,*_build/*]]
vim.cmd [[set wildignore+=**/.git/*]]
vim.cmd [[set wildignore+=**/node_modules/*]]
vim.cmd [[set wildignore+=**/coverage/*]]
vim.cmd [[set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico]]
vim.cmd [[set wildignore+=*.pyc,*.pkl]]
vim.cmd [[set wildignore+=*.DS_Store]]
vim.cmd [[set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv]]
