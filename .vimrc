" Pathogen - Plugin manager - https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

" Monokai skin - https://github.com/sickill/vim-monokai
colorscheme monokai

" Save and restore sessions - https://github.com/xolox/vim-session and https://github.com/xolox/vim-misc
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" Save and restore screen position and size (for each Vim instance too) - http://vim.wikia.com/wiki/Restore_screen_size_and_position
source ~/.vimfs
let g:screen_size_restore_pos = 1
let g:screen_size_by_vim_instance = 1

" Show line numbers.
set number

" Automatically remove trailing whitespace before write
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()

" Make searching highlighted, incremental, and case insensitive if search pattern doesn't contain uppercase chars
set hlsearch
set incsearch
set ignorecase
set smartcase

" Which tags to match and how long to jump to each
set matchpairs=(:),{:},[:],<:>
set showmatch
set matchtime=3

" Copy autoindent from current line
set autoindent

" Status bar
set statusline=%M%h%y\ %t\ %F\ %p%%\ %l/%L\ %=[%{&ff},%{&ft}]\ [a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]

" Autoreload files on content changes
set autoread

" Status line
set laststatus=2

set statusline=%y\                              "filetype
set statusline+=%t\                             "tail of the filename
set statusline+=[
set statusline+=%{FileSize()},\                 " file size
set statusline+=%{strlen(&fenc)?&fenc:'none'},\ "file encoding
set statusline+=%{&ff}]                         "line ending
set statusline+=%m                              "modified flag
set statusline+=%r                              "read only flag
set statusline+=%=                              "left/right separator
set statusline+=column\ %c\ \|\                 "cursor column
set statusline+=line\ %l/%L\                    "cursor line/total lines
set statusline+=\(%p\%%\)                       "percent through file