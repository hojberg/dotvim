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

" https://gist.github.com/chrishunt/6042695
set clipboard=unnamed

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1

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
" nnoremap <Leader>n :Explore<CR>

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
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

autocmd BufNewFile,BufRead *.elm set tabstop=4
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Prettier (js formatter) ------------------- "
" autocmd FileType javascript set formatprg=prettier\ --stdin --trailing-comma --single-quote

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

" vim-plug package manager ------------------- "
call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'rakr/vim-one'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
"Plug 'elliottt/vim-haskell'
Plug 'neovimhaskell/haskell-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
"Plug 'jszakmeister/vim-togglecursor'
Plug 'tpope/vim-rsi'
Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'ElmCast/elm-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'moll/vim-node'
Plug 'VimClojure'
Plug 'ryanss/vim-hackernews'
Plug 'tpope/vim-surround'

call plug#end()

" Plugin configuration ------------------------------------ "

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" elm-haskell
let g:hs_highlight_boolean = 1
let g:hs_highlight_debug = 1
let g:hs_highlight_types = 1
let g:hs_highlight_delimiters = 1
let g:hs_highlight_more_types = 1

" elm-vim
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

au FileType elm nmap <leader>m <Plug>(elm-make)
au FileType elm nmap <leader>M <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>D <Plug>(elm-browse-docs)

" vimfiler
nnoremap <Leader>n :VimFilerExplorer<CR>
let g:vimfiler_as_default_explorer = 1

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-gitgutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" limelight
nmap <silent> gl :Limelight!!<CR>
xmap gl <Plug>(Limelight)

" Goyo
nnoremap <leader>g :Goyo<CR>

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:Powerline_symbols = 'fancy'

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
"let g:airline_theme='one'

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

" YouCompleteMe
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

" Small functions ----------------------------- "

nnoremap <leader>j :%!python -m json.tool<cr>

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

function! RunTests()
  if match(expand("%"), '\(.js\)$') != -1
    call RunJSTests()
  else if match(expand("%"), '\(.elm\)$') != -1
    call ElmTest()
  endif
endfunction

function! RunJSTests()
  let cwd = getcwd()
  let cmd = 'nvm use; npm test'

  if match(expand("%"), '\(._spec.js\|_test.js\)$') != -1
    let t:test_file = expand("%")
  endif

  if exists("t:test_file")
    if filereadable("node_modules/mocha/bin/mocha")
      let cmd = 'nvm use; mocha ' . t:test_file
    endif
  endif

  call VimuxRunCommand(cmd)
endfunction

nnoremap <Leader>t :call RunJSTests()<CR>

function! RunAllJSTests()
  call VimuxRunCommand('nvm use; npm test')
endfunction
nnoremap <Leader>T :call RunAllJSTests()<CR>

function! BuildProject()
  "if match(expand("%"), '\(.elm\)$') != -1
    "call ElmMake()
  "else
    if filereadable("package.json")
      call BuildJS()
    endif
  "endif
endfunction
nnoremap <Leader>b :call BuildProject()<CR>

function! BuildJS()
  let cwd = getcwd()
  call VimuxRunCommand('nvm use; clear; npm run build')
endfunction

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
nmap <leader>p :!thyme -d<cr>

" Red whitespace
autocmd BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" Color ------------------------------------ "
" set proper colors for terminal vim
syntax on
set t_Co=256

colorscheme hojberg
