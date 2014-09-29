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

" don't show things like -- INSERT --
set noshowmode

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
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'benmills/vimux'
Bundle 'scrooloose/nerdtree'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle "airblade/vim-gitgutter"
Bundle 'Yggdroot/indentLine'
Bundle 'moll/vim-node'
Bundle 'VimClojure'

filetype plugin indent on " required!

" Bundle / Plugin configuration ------------------------------------ "

" vim-gitgutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" vim-airline
let g:airline_theme='powerlineish'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_fugitive_prefix = '⭠ '
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_section_y = ''
let g:airline_section_x = ''

" Ag
nnoremap <leader>a :Ag<space>

" nerdtree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nnoremap <Leader>n :NERDTreeToggle<CR>

" Ctrl-P
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_map = '<leader>.'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|_SpecRunner.html'
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_use_caching = 0

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

nnoremap <leader>. :CtrlPTag<cr>

" indentLines
let g:indentLine_char = '┊'
let g:indentLine_color_term = 0

" YouCompleteMe
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 3

" Small functions ----------------------------- "

" Rename file with <leader>rn "
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

function! RunJSTests()
  let cwd = getcwd()
  let cmd = 'npm test'

  if match(expand("%"), '\(._spec.js\|_test.js\)$') != -1
    let t:test_file = expand("%")
  endif

  if exists("t:test_file")
    if filereadable("node_modules/jest-cli/bin/jest.js")
      if match(cwd, '\<partners_ui\>') != -1
        let cmd = 'NODE_PATH=build/cjs jest '. t:test_file
      else
        let cmd = 'jest '. t:test_file
      endif
    endif
  endif

  :call VimuxRunCommand(cmd)
endfunction
nnoremap <Leader>t :call RunJSTests()<CR>

function! RunAllJSTests()
  :call VimuxRunCommand('npm test')
endfunction
nnoremap <Leader>T :call RunAllJSTests()<CR>

function! BuildJS()
  let cwd = getcwd()
  if match(cwd, '\<partners_ui\>') != -1
    call VimuxRunCommand('clear; npm run devbuild')
  else
    call VimuxRunCommand('clear; npm run build')
  endif
endfunction
nnoremap <Leader>b :call BuildJS()<CR>

" Red whitespace
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

function! YuiToEs6()
  normal $%dGggddVG<
  %s/var \([^ ]\+\) = imports\[\'\([^\']\+\).*$/import \1 from '\2';
  w
endfunction

" Color ------------------------------------ "
" set proper colors for terminal vim
syntax on
set t_Co=256
colorscheme hojberg
