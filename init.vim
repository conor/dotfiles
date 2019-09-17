"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Conor Wade
"       http://conorwade.com
"
" Version:
"       0.4
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Package management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-signify'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'othree/yajs.vim', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx', {'for': ['javascript.jsx', 'javascript', 'typescript']}
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript.jsx', 'javascript', 'typescript'] }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set vim to run in bash as fugitive has issues with performance
" TODO: Look at this. It might need another look
" set shell=/usr/local/bin/bash
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

filetype plugin indent on                          " Load filetype-specific indent files

let mapleader= "\<Space>"                          " Leader is space
let g:closetag_filenames = '*.html,*.js'           " Configure self closing tags in html files

set encoding=utf8                                  " Set utf8 and en_US as standard encoding and language
set history=700                                    " Sets how many lines of history VIM has to remember
set number                                         " Show line numbers
set numberwidth=4                                  " Set number line gutter to 4 spaces
set relativenumber                                 " Use relative number
set ruler
set laststatus=2                                   " Show statusline
set cmdheight=1                                    " Set height of command line
set so=10                                          " Set 10 lines to the cursor - when moving vertically using j/k
set showcmd                                        " Show command in bottom bar
set cursorline                                     " Highlight current line
set wildmenu                                       " Visual autocomplete for command menu
set lazyredraw                                     " Redraw only when we need to
set showmatch                                      " Highlight matching [{()}]
set autoread                                       " Automatically update file when changed elsewhere
set vb t_vb=                                       " No errors sounds or blinking
set tm=500                                         " Set Timeout
set viminfo^=%                                     " Remember info about open buffers on close
set guioptions=                                    " Hide scrollbars
set splitbelow                                     " Set more natural horizontal split
set splitright                                     " Set more natural vertical split
set backspace=eol,start,indent                     " Configure backspace so it acts as it should
set fixeol                                         " Fix end of line on files that have none
set wildignore=*.o,*~,*.pyc,*/.git/*,*/tmp/*,*.swp " Ignore files types
set hidden                                         " A buffer becomes hidden when it is abandoned
set ffs=unix,dos,mac                               " Use unix as the standard file type
set nobackup                                       " No need for backup with version control
set nowb                                           " No need for backup with version control
set noswapfile                                     " No need for backup with version control
set nowritebackup                                  " Probably not needed on unix machines
set autowrite                                      " Automatically write before running commands
set title                                          " Set the title of the iterm tab
set list listchars=tab:»·,trail:·                  " Display extra whitespace
set statusline=%<\ [%f]\ %=[%{FugitiveHead()}]     " Super simple statusline

try
  set switchbuf=useopen
catch
endtry

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup configgroup
  " Clears all of the autocmd's for the current group
  autocmd!
  autocmd BufWritePre * :call DeleteTrailingWS()
  " Remember cursor position between sessions
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  " Center buffer around cursor when opening files
  autocmd BufRead * normal zz
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" Theme
syntax enable
set background=dark
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces And Tabs, and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2       " Number of visual spaces per tab
set shiftwidth=2    " Number of visual spaces per tab
set softtabstop=2   " Number of spaces in tab when editing
set expandtab       " Tabs are spaces
set smarttab        " Tabs that are smarter than your average
set ai              " Auto indent
set si              " Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches
set ignorecase          " Ignore case when searching (required for smartcase to work)
set smartcase           " Smarter case sensitivity when searching
set magic               " For regular expressions turn magic on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " Enable folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " Fold based on indent level

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jk is escape
inoremap jk <esc>
" Edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Highlight last inserted text
nnoremap gV `[v`]
" Clear current search
nnoremap <leader><CR> :nohlsearch<CR>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggle maximizing pane
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Disable arrow keys
noremap <right> <Nop>
noremap <left> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

" Weird hack for mapping <Alt+l> and <Alt+j> to split right and down
map ¬ :vsp<cr>
map ∆ :sp<cr>

" Using the weird hack again for <Alt+/> to toggle a comment
nnoremap <C-/> gcc

" More convienent keymappings
noremap H ^
noremap L g_
noremap K gg
noremap J G

" Allows you to continue using indent/outdent repeatedly
vmap < <gv
vmap > >gv

" More natural command for returning to normal mode in the terminal
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " ripgrep is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_cmd = 'CtrlP'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive config
noremap <leader>gs :Gstatus<cr>
noremap <leader>gb :Gblame<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gp :Git push<cr>

" Always use vertical diffs
set diffopt+=vertical

let g:signify_vcs_list              = [ 'git' ]
let g:signify_sign_add               = '|'
let g:signify_sign_delete            = '|'
let g:signify_sign_delete_first_line = '|'
let g:signify_sign_change            = '|'
let g:signify_sign_changedelete      = g:signify_sign_change

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.md PrettierAsync
let g:polyglot_disabled = ['javascript']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-complete Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elixir Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mix_format_on_save = 1
