" ------------------------------------------------------------------------------------------------
" Vundle Config 
" ------------------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ------------------------------------------------------------------------------------------------

Plugin 'tpope/vim-fugitive'  " git integration
Plugin 'easymotion/vim-easymotion'  " helps moving around
Plugin 'vim-airline/vim-airline'  " status bar thing
Plugin 'vim-airline/vim-airline-themes'  " themes for status bar
Plugin 'ctrlpvim/ctrlp.vim'  " easy file opening
Plugin 'altercation/vim-colors-solarized'  " solarized themes
Plugin 'nathanaelkane/vim-indent-guides' " indent guides for python
Plugin 'scrooloose/nerdcommenter'  " commenting goodness
Plugin 'scrooloose/syntastic.git'  " syntax checking
Plugin 'airblade/vim-gitgutter'  " git status in the gutter
Plugin 'scrooloose/nerdtree'  " file explorer
Plugin 'majutsushi/tagbar'  " ctag browsing
Plugin 'Valloric/YouCompleteMe'  " autocompletions
Plugin 'tpope/vim-surround'  " surround text with things
Plugin 'fatih/vim-go'  " go tooling support
Plugin 'pangloss/vim-javascript'  " javascript
Plugin 'tpope/vim-abolish'  " substitutions/refactoring/renaming/silly typos/etc
Plugin 'terryma/vim-multiple-cursors' " multiple cursors!
Plugin 'plasticboy/vim-markdown'  " markdown
Plugin 'othree/html5.vim'  " html
Plugin 'elzr/vim-json'  " json
Plugin 'mxw/vim-jsx'  " react jsx
Plugin 'Townk/vim-autoclose'  " autoclose parens/quotes/brackets
Plugin 'junegunn/vim-easy-align'  " align things
Plugin 'rust-lang/rust.vim'  " rust
Plugin 'mhinz/vim-startify'  " fancy start screen
Plugin 'tacahiroy/ctrlp-funky'  " function entries in ctrlp
Plugin 'terryma/vim-expand-region'  " expand/contract text selection

" ------------------------------------------------------------------------------------------------


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ------------------------------------------------------------------------------------------------
" Custom Config 
" ------------------------------------------------------------------------------------------------

" use osx clipboard
set clipboard=unnamed

" searching
set incsearch
set hlsearch

" enable syntax
syntax enable 

" no escape sequences after ESC is pressed
set noesckeys

" ruler
set ruler

" no text wrapping
set nowrap

" turn on line numbers
set number

" backspace fix
set backspace=2

" renmap for ctrlp-funky 
nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" theme
set background=dark
colorscheme solarized

" airline config
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1


" mappings
let mapleader = ","
nnoremap <Leader>t :NERDTreeToggle<CR>

" colorcolumn
set cc=100

" tab configuration
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" Easy motion config
hi LineNr ctermbg=8 ctermfg=236
hi EasyMotionTarget ctermbg=8 ctermfg=1
hi EasyMotionTarget2First ctermbg=8 ctermfg=7
hi EasyMotionTarget2Second ctermbg=8 ctermfg=7
hi EasyMotionShade ctermbg=8 ctermfg=239
hi VertSplit ctermfg=0 ctermbg=none
hi Split ctermfg=none ctermbg=none
hi SignColumn ctermbg=none
hi SpellBad cterm=underline
hi ColorColumn ctermbg=0
hi GitGutterAdd ctermbg=none ctermfg=2
hi GitGutterChange ctermbg=none ctermfg=3
hi GitGutterDelete ctermbg=none ctermfg=9
hi GitGutterChangeDelete ctermbg=none ctermfg=9
hi NonText ctermfg=0
hi Visual ctermfg=white ctermbg=0
