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

" Resize splits when the window is resized
au VimResized * :wincmd =

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

" Tab key ------------------------------------ "
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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
:imap jj <Esc>
:nmap ; :

" Yank to OS X pasteboard.
noremap <leader>y "*y
" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>:put! *<CR>:set nopaste<CR>

" In command-line mode, C-a jumps to beginning (to match C-e).
cnoremap <C-a> <Home>

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
nnoremap j gj
nnoremap k gk
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

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile     " no swap files

" Plugins ------------------------------------ "

filetype plugin indent on       " load file type plugins + indentation

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" add local plugins for hacking
" call pathogen#runtime_prepend_subdirectories('/Users/hojberg/code/vim/')

"" Ack
nnoremap <leader>a :Ack

" powerline config
let g:Powerline_symbols = 'fancy'

" nerdtree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Ctrl-P
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>.'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/" .
    \ ")'"

let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files | " .
    \ ctrlp_filter_greps

let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]

nnoremap <leader>. :CtrlPTag<cr>

" ZoomWin configuration
nnoremap <leader><leader> :ZoomWin<cr>

" Vest
let g:vest_runners = { 
  \ '_spec.rb':   'bundle exec rspec %', 
  \ '.feature':   'bundle exec rake cucumber FEATURE=%',
  \ '_test.html': 'yeti %'
  \ }
nnoremap <leader>t :Vest<cr>

" Rename file with ,n ---------------------------- "
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

" Color ------------------------------------ "
syntax on
colorscheme mustang
hi LineNr ctermfg=darkcyan ctermbg=black

" gui vim ------------------------------------- "
if has("gui_running")
  set guioptions=egmrt "" hides toolbar
  set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h16
  set guioptions-=L
  set guioptions-=r
endif
