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
