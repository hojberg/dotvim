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
set cmdheight=1

" Resize splits when the window is resized
au VimResized * :wincmd =

" disable Ex mode
nnoremap Q <nop>

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
"noremap <leader>y "*y
" Paste from OS X pasteboard without messing up indent.
"noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
"noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>

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

" Files ------------------------------------ "
au BufNewFile,BufRead *.ejs set filetype=html.js
au BufNewFile,BufRead *.jst set filetype=html.js
au BufNewFile,BufRead *.handlebars set filetype=html.js
au BufNewFile,BufRead *.hbs set filetype=html.js
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.clj,*cljs,*.wisp set filetype=clojure

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

" Vundle ------------------------------------ "
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles ------------------------------------ "
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-dispatch'
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'hojberg/vest'
Bundle 'VimClojure'
Bundle 'Yggdroot/indentLine'
Bundle 'airblade/vim-gitgutter'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

filetype plugin indent on " required!

" Bundle / Plugin configuration ------------------------------------ "
"
" Ack
set grepprg=ack
nnoremap <leader>a :Ack<space>
let g:ackhighlight=1
let g:ackprg="ack -H --type-set less=.less --type-set jade=.jade --type-set handlebars=.handlebars --type-set hbs=.hbs --type-set stylus=.styl --type-set coffee=.coffee --nocolor --nogroup --column --ignore-dir=node_modules -G '^((?!min\.).)*$'"

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

" nerdtree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nnoremap <Leader>n :NERDTreeToggle<CR>

" Experimental custom matcher for CTRLP
" Based on https://github.com/burke/matcher
function! BurkeMatcher(items, str, limit, mmode, ispath, crfile, regex)
  let results = []

  " No search string, just return the list we were passed
  if len(a:str) == 0
    let results = a:items[0:(a:limit)]

  " We have a search string
  else
    let match_cmd = g:path_to_matcher . ' --limit ' . a:limit . ' --no-dotfiles ' . a:str
    let results = split(system(match_cmd, join(a:items, "\n")), "\n")
  endif

  " Exclude current file from results when a:ispath == 1
  if a:ispath == 1
    remove(results, index(results, a:crfile))
  endif

  return results
endfunction

" Ctrl-P
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>.'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --other --exclude-standard']
let g:ctrlp_use_caching = 0
let g:ctrlp_match_func = { 'match': 'BurkeMatcher' }

nnoremap <leader>. :CtrlPTag<cr>

" indentLines
let g:indentLine_char = '┊'
let g:indentLine_color_term = 232

" Vest
let g:vest_runners = {
  \ '_spec.rb':   'bundle exec rspec %',
  \ '.feature':   'bundle exec cucumber %',
  \ '.js':        'grunt jasmine'
  \ }
" nnoremap <leader>t :Vest<cr>

" Dispatch
autocmd FileType ruby let b:dispatch = 'bundle exec rspec %'
autocmd FileType cucumber let b:dispatch = 'bundle exec cucumber %'
autocmd FileType javascript let b:dispatch = 'grunt jasmine'
nnoremap <leader>t :Dispatch<cr>

" Airline (using vim-powerline patched font symbols)
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_fugitive_prefix = '⭠ '
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_theme='powerlineish'

" VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" Hardmode
"autocmd VimEnter,BufNewFile,BufReadPost * call HardMode()

" YouCompleteMe
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

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

" Red whitespace
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Color ------------------------------------ "
" set proper colors for terminal vim
syntax on
set t_Co=256
colorscheme hojberg

" Show blue blink(1) on insert mode
function! Blink1On()
  silent !~/blink1-tool -q --blue
endfunction

function! Blink1Off()
  silent !~/blink1-tool -q --off
endfunction

au InsertEnter * call Blink1On()
au InsertLeave * call Blink1Off()
