set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" util type stuff, I guess?
Plugin 'Shougo/vimproc.vim'

" search
"Plugin 'mileszs/ack.vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'dkprice/vim-easygrep'
Plugin 'Shougo/unite.vim'

"Plugin 'scrooloose/nerdtree'

" UI stuff
Plugin 'bling/vim-airline'

" syntax and helpful codey junk
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'msanders/snipmate.vim'

" js specific stuff
"Plugin 'Shutnik/jshint2.vim'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'vim-scripts/JavaScript-Indent'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" movement and junk
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'terryma/vim-multiple-cursors'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme molokai

" show line numbers
set number

" needed to show airport bar
set laststatus=2

" make tabs behave as the good lord intended
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" highlight search results as they are typed
set incsearch
set hlsearch

" dont complain about unsaved buffers 
set hidden

"set wildignore+=*/node_modules/*,*.min.js,*.swp

" break junk to new line and junk...
map! <C-J> <CR><Esc>O
" quotes to switch buffer
map " :b 
" jj to exit insert mode
map! jj <Esc>
" ctrl+d to duplicate current line (like ST)
map <C-d> :t. <CR>
" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv
" shift tab to un-indent per ST
imap <S-Tab> <C-o><<

" configure airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#syntastic#enabled = 1

" configure syntastic for jshint
let g:syntastic_javascript_checkers = ['jshint']

" config unite
" ctrl+p to search files
noremap <C-p> :Unite -start-insert file_rec/async<cr>
" space / to grep for files
nnoremap <space>/ :Unite grep:.<cr>
" use ag
if executable('ag')
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts = '-i --noheading --nocolor'
   let g:unite_source_grep_recursive_opt = ''
endif

"call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))

" delete trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
