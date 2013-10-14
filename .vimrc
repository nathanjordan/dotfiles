set number autoindent hls
colorscheme peaksea
set background=dark
syntax on
set wildmode=longest,list
set wildmenu

set colorcolumn=80

set mouse=nicr
set shiftwidth=2

" au VimLeave * :!clear
" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>
