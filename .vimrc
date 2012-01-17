set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" --- Plugins
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"" --- Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" --- Rebinds and helpers
command! W :w
let mapleader = ","

"" remove arrow keys :trollface:
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"" --- Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"" ack search
nnoremap <leader>a :Ack

"" css sort
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

"" easier split (, + w)
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" --- Status bar
set cmdheight=2

"" ---Files
au BufNewFile,BufRead *.ejs set filetype=html.js
au BufNewFile,BufRead *.jst set filetype=html.js
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead Guardfile set filetype=ruby

"" misc
set hidden
set visualbell
set ignorecase 
set smartcase
set title
set scrolloff=3
set wildmode=list:longest
set title

"" faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"" GUI
if has("gui_running")
  set guioptions=egmrt "" hides toolbar
endif

if &t_Co >= 256 || has("gui_running")
endif

""colorscheme vwilight
colorscheme mustang
 
set guifont=Droid\ Sans\ Mono:h16
set background=dark

set guioptions-=L
set guioptions-=r
set number
hi LineNr ctermfg=darkcyan ctermbg=black
