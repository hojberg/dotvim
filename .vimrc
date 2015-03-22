" Basic ------------------------------------ "
set nocompatible
set number
set history=1000
set laststatus=2
set encoding=utf-8
scriptencoding utf-8
set showcmd
set autoread
set hidden
set visualbell
set title
set scrolloff=3
set cmdheight=1

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" disable Ex mode
nnoremap Q <nop>

" Colorcolumn
set cc=80

" don't show things like -- INSERT --
set noshowmode

" <leader> ------------------------------------ "
let g:mapleader = ","

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
nnoremap <Leader>n :Explore<CR>

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
autocmd BufNewFile,BufRead *.ejs set filetype=html.js
autocmd BufNewFile,BufRead *.jst set filetype=html.js
autocmd BufNewFile,BufRead *.handlebars set filetype=html.js
autocmd BufNewFile,BufRead *.hbs set filetype=html.js
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.clj,*cljs,*.wisp set filetype=clojure

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

" Vundle ------------------------------------ "
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" Plugin ------------------------------------ "

Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-obsession'
Plugin 'VimClojure'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'eraserhd/vim-ios'
Plugin 'ajh17/Spacegray.vim'
Plugin 'ryanss/vim-hackernews'
Plugin 'mtth/scratch.vim'

call vundle#end()

filetype plugin indent on " required!

" Plugin configuration ------------------------------------ "
"
let g:scratch_filetype = 'markdown'

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
let airline_symbols.readonly = '⭤'
" let g:airline_linecolumn_prefix = '⭡'
let g:airline_symbols.linenr = '⭡'
let g:airline_section_y = ''
let g:airline_section_x = ''

" Ag
nnoremap <leader>a :Ag<space>

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
  call VimuxRunCommand('clear; npm run build')
endfunction
nnoremap <Leader>b :call BuildJS()<CR>

augroup ensure_directory_exists
  autocmd!
  autocmd BufNewFile * call s:EnsureDirectoryExists()
augroup END

function! s:EnsureDirectoryExists()
  let required_dir = expand("%:h")

  if !isdirectory(required_dir)
    " Remove this if-clause if you don't need the confirmation
    if !confirm("Directory '" . required_dir . "' doesn't exist. Create it?")
      return
    endif

    try
      call mkdir(required_dir, 'p')
    catch
      echoerr "Can't create '" . required_dir . "'"
    endtry
  endif
endfunction

" Misc ------------------------------------ "

" Red whitespace
autocmd BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" Color ------------------------------------ "
" set proper colors for terminal vim
syntax on
set t_Co=256
colorscheme hojberg
