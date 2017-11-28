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

Plugin 'tpope/vim-sensible'  " sensible defaults
Plugin 'tpope/vim-git'  " git syntax highlighting and things
Plugin 'tpope/vim-fugitive'  " git integration
Plugin 'easymotion/vim-easymotion'  " helps moving around
Plugin 'itchyny/lightline.vim'  " status bar
"Plugin 'ctrlpvim/ctrlp.vim'  " easy file opening
Plugin 'junegunn/fzf.vim'  " easy file opening
Plugin 'altercation/vim-colors-solarized'  " solarized themes
Plugin 'nathanaelkane/vim-indent-guides' " indent guides for python
Plugin 'scrooloose/nerdcommenter'  " commenting goodness
Plugin 'scrooloose/syntastic.git'  " syntax checking
Plugin 'airblade/vim-gitgutter'  " git status in the gutter
Plugin 'scrooloose/nerdtree'  " file explorer
"Plugin 'majutsushi/tagbar'  " ctag browsing
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
"Plugin 'Townk/vim-autoclose'  " autoclose parens/quotes/brackets
Plugin 'junegunn/vim-easy-align'  " align things
Plugin 'rust-lang/rust.vim'  " rust
Plugin 'mhinz/vim-startify'  " fancy start screen
"Plugin 'tacahiroy/ctrlp-funky'  " function entries in ctrlp
Plugin 'terryma/vim-expand-region'  " expand/contract text selection
Plugin 'solarnz/thrift.vim'  " thrift support
Plugin 'ntpeters/vim-better-whitespace'  " whitespace hilighting/removing
Plugin 'hynek/vim-python-pep8-indent'  " better python indenting
Plugin 'wakatime/vim-wakatime'  " time management
Plugin 'szw/vim-tags'  " code tags (function names, classes, etc.) browsing
Plugin 'python-rope/ropevim'  " python refactoring/references/completion
Plugin 'dkprice/vim-easygrep'  " Grep across files
"Plugin 'Shougo/vimproc'  " Shell in the VIM!
"Plugin 'Shougo/vimshell.vim'  " Shell in the VIM!
Plugin 'eagletmt/ghcmod-vim'  " haskell goodness?
Plugin 'SirVer/ultisnips' " snippet engine
Plugin 'honza/vim-snippets' " meta snippet thing?
Plugin 'rking/ag.vim' " plugin for search tool ag
Plugin 'alfredodeza/coveragepy.vim' " python coverage tool
Plugin 'othree/eregex.vim' " pcre regex standardizer


" only load these plugins if we're using neovim
if has("nvim")
	Plugin 'jodosha/vim-godebug' " go debugging
	Plugin 'vimlab/split-term.vim' " better terminal keybindings for :terminal
endif

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
"set noesckeys

" ruler
set ruler

" no text wrapping
set nowrap

" turn on line numbers
set number

" backspace fix
set backspace=2

" autoset the CWD to the current directory
"set autochdir  " This was broken in vimshell
autocmd BufEnter * silent! lcd %:p:h

" configure snippets
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsListSnippets="<c-y>"

" theme
set background=dark
colorscheme solarized

" lightline config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'syntastic' ],
      \   ]
      \   },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ }
set noshowmode

" markdown config
let g:vim_markdown_folding_disabled = 1

" use ag at the project root instead of CWD
let g:ag_working_path_mode="r"

" vim-go config
let g:go_info_mode = 'guru'
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:go_metalinter_autosave = 1
if has("nvim")
	exe "sign define gobreakpoint text=@  texthl=ErrorMsg"
end

" ctrlp config
"
" configuring CtrlP to ignore git ignored files
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_reuse_window  = 'startify'
"let g:ctrlp_custom_ignore = {
                "\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\env/$',
                "\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" renmap for ctrlp-funky
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"let g:ctrlp_funky_syntax_highlight = 1


" fzf config
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :Files<CR>
let g:fzf_layout = { 'down': '~30%' }
" customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" strip whitespace on save
autocmd BufWritePre * StripWhitespace

" yaml config
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab noautoindent

" html config
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab noautoindent

" json config
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab noautoindent

" thrift config
autocmd FileType thrift setlocal tabstop=2 shiftwidth=2 expandtab noautoindent

" vimscript config
autocmd FileType vim setlocal tabstop=2 shiftwidth=2 expandtab noautoindent

" ctrlp config
" mappings
let mapleader = ","
nnoremap <Leader>t :NERDTreeToggle<CR>

" colorcolumn
set cc=100

" for wrapping, etc
set textwidth=100

" for VimShell
nnoremap <Leader>vs :VimShell -split<CR>

" turn off arrow keys (old habits die hard)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" visual shifting retain selection
vnoremap > >gv
vnoremap < <gv

" allow visual block mode to exit even outside character space
set virtualedit=block

" save and quit capitals
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" insert UUID after cursor
command! UUID py import uuid, vim; vim.command(":normal a" + str(uuid.uuid4()))
nnoremap <Leader>u :UUID<CR>

" tab configuration
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" color adjustments
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
