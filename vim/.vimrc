set nocompatible
set encoding=utf-8
set noerrorbells
set relativenumber number
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set incsearch
set hlsearch
set scrolloff=8
set showcmd
set showmode
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set viminfo=

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Keybinds
inoremap jj <ESC>
nnoremap <C-c> :nohl<CR>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd InsertEnter,InsertLeave * set cursorline!

syntax on
filetype plugin indent on

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
