" Basic ------------------------------------ "
set nocompatible
set number
set history=1000
set laststatus=2
set encoding=utf-8
set showcmd
set autoread
set hidden
set visualbell
set title
set scrolloff=3
set cmdheight=2

" Resize splits when the window is resized
au VimResized * :wincmd =

" Colorcolumn
set cc=80

" <leader> ------------------------------------ "
let mapleader = ","

" Whitespace ------------------------------------ "
set nowrap                      " don't wrap lines
set tabstop=2 
set shiftwidth=2     
set softtabstop=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting

" Wildmode ------------------------------------ "
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Search ------------------------------------ "
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" ,<space> clears search
nnoremap <leader><space> :noh<cr> 

" Mappings ------------------------------------ "
command! W :w
:nmap ; :

" Yank to OS X pasteboard.
noremap <leader>y "*y
" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Navigation ------------------------------------ "
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" easier split (, + w)
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Line return ------------------------------------ "
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Files ------------------------------------ "
au BufNewFile,BufRead *.ejs set filetype=html.js
au BufNewFile,BufRead *.jst set filetype=html.js
au BufNewFile,BufRead *.handlebars set filetype=html.js
au BufNewFile,BufRead *.hbs set filetype=html.js
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.clj,*cljs set filetype=clojure

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

" Plugins ------------------------------------ "

filetype plugin indent on " load file type plugins + indentation

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" add local plugins for hacking
call pathogen#runtime_prepend_subdirectories('/Users/hojberg/code/vim/')

" Ack
" nnoremap <leader>a :Ack
set grepprg=ack
nnoremap <leader>a :Ack<space>
let g:ackhighlight=1
let g:ackprg="ack -H --type-set jade=.jade --type-set stylus=.styl --type-set coffee=.coffee --nocolor --nogroup --column --ignore-dir=node_modules -G '^((?!min\.).)*$'"

" powerline config
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" nerdtree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nnoremap <Leader>n :NERDTreeToggle<CR>

" Ctrl-P
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>.'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
nnoremap <leader>. :CtrlPTag<cr>

" ZoomWin configuration
nnoremap <leader><leader> :ZoomWin<cr>

" Vest
let g:vest_runners = { 
  \ '_spec.rb':   'bundle exec rspec %', 
  \ '.feature':   'bundle exec cucumber %',
  \ '_spec.js':   'grunt jasmine'
  \ }
nnoremap <leader>t :Vest<cr>

" VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Rename file with ,rn ---------------------------- "
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>rn :call RenameFile()<cr>

" Highlight end of line whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Color ------------------------------------ "
syntax on
colorscheme mustang

" set background=dark
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black

" gui vim ------------------------------------- "
if has("gui_running")
  set guioptions=egmrt "" hides toolbar
  set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h18
  set guioptions-=L
  set guioptions-=r
else
  " set proper colors for terminal vim
  set t_Co=256
endif

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/
