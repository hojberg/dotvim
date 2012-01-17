"""""""""""""""""""" GLOBAL
let mapleader=","
""colorscheme molokai
set gfn=terminus
set go= 

syntax on
filetype plugin indent on
set encoding=utf-8
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set mouse=
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2
set ruler

"""""""""""""""""""" KEYBINDINGS

map cc <leader>c<space>
map  # {v}! par 72<CR>
map  & {v}! par 72j<CR>
map  <F6> :setlocal spell! spelllang=en<CR>
map  <F12> :set invhls<CR>
cmap <C-g> <C-u><ESC>
 
"""""""""""""""""""" PLUGINS
call pathogen#infect()
 
"""""""""""""""""""" FILES SPECIFIC
 
au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au bufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
 
autocmd filetype html,xml set listchars-=tab:>.

 """""""""""""""""""" STATUSBAR
 
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
hi PatchColor ctermfg=255 ctermbg=161 guifg=black guibg=#FF0066
 
function! MyStatusLine(mode)
     let statusline=""
 
     if a:mode == 'Enter'
         let statusline.="%#StatColor#"
     endif
     let statusline.="\(%n\)\ %f\ "
     if a:mode == 'Enter'
         let statusline.="%*"
     endif
     let statusline.="%#Modified#%m"
     if a:mode == 'Leave'
         let statusline.="%*%r"
     elseif a:mode == 'Enter'
         let statusline.="%r%*"
     endif
     let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
 endfunction
 
au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')
 
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
