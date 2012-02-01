" =GENERAL
" ===========================================================
set nocompatible " choose no compatibility with legacy vi

let mapleader = ","

if has("gui_running")
  set guioptions=egmrt "" hides toolbar
endif

colorscheme mustang
 
set guifont=Droid\ Sans\ Mono:h16
set background=dark

set guioptions-=L
set guioptions-=r
set number
hi LineNr ctermfg=darkcyan ctermbg=black
set history=1000

set laststatus=2
syntax on
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" Set to auto read when a file is changed from the outside
set autoread

"" -----= WHITESPACE =----- ""
set nowrap                      " don't wrap lines
set tabstop=2 
set shiftwidth=2     
set softtabstop=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting


"" -----= TAB COMPLETION =-----
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"" --- Rebinds and helpers
command! W :w
:imap jj <Esc>
:nmap ; :

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

" run yeti on current file
nnoremap <leader>y :! yeti %<cr>

"" --- Status bar
"set cmdheight=2
"hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
"hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
"hi PatchColor ctermfg=255 ctermbg=161 guifg=black guibg=#FF0066

"function! MyStatusLine(mode)
"  let statusline=""

"  if a:mode == 'Enter'
"      let statusline.="%#StatColor#"
"  endif
"  let statusline.="\(%n\)\ %f\ "
"  if a:mode == 'Enter'
"      let statusline.="%*"
"  endif
"  let statusline.="%#Modified#%m"
"  if a:mode == 'Leave'
"      let statusline.="%*%r"
"  elseif a:mode == 'Enter'
"      let statusline.="%r%*"
"  endif
"  let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
"  return statusline
"endfunction

"au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
"au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
"set statusline=%!MyStatusLine('Enter')
 
"function! InsertStatuslineColor(mode)
"  if a:mode == 'i'
"    hi StatColor guibg=orange ctermbg=lightred
"  elseif a:mode == 'r'
"    hi StatColor guibg=#e454ba ctermbg=magenta
"  elseif a:mode == 'v'
"    hi StatColor guibg=#e454ba ctermbg=magenta
"  else
"    hi StatColor guibg=red ctermbg=red
"  endif
"endfunction

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

"" ---Files
au BufNewFile,BufRead *.ejs set filetype=html.js
au BufNewFile,BufRead *.jst set filetype=html.js
au BufNewFile,BufRead *.handlebars set filetype=html.js
au BufNewFile,BufRead *.hbs set filetype=html.js
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
au BufNewFile,BufRead *.json set filetype=javascript

"" backup stuff
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"" misc
set hidden
set visualbell
set ignorecase 
set smartcase
set title
set scrolloff=3
set wildmode=list:longest

"" faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" =PLUGIN_CONFIG (with pathogen(
" ===========================================================

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" powerline config
" let g:Powerline_symbols = 'fancy'

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>
