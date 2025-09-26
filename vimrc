"===============================================================================
"                                 PLUGGED PLUGINS
"===============================================================================
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'cappyzawa/starlark.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'hashivim/vim-terraform'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jjo/vim-cue'
Plug 'junegunn/fzf', { 'dir': '~/.vim/plugged/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'jvirtanen/vim-hcl', {'branch': 'main'}
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': [
  \   'css',
  \   'graphql',
  \   'html',
  \   'javascript',
  \   'javascriptreact',
  \   'json',
  \   'scss',
  \   'typescript',
  \   'typescriptreact',
  \   'yaml'
  \   ]
  \ }
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'
Plug 'slim-template/vim-slim'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-surround'
Plug 'trusktr/seti.vim'
"Plug 'ycm-core/YouCompleteMe'
call plug#end()

" Set keyboard shortcuts for fuzzy file finder (using fzf)
nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-h> :Buffers<CR>

" Disable fuzzy file finder preview window
let g:fzf_preview_window = ''

" Automatical change the working directory to the folder containing the`.git`
" directory
let g:rooter_patterns = ['.git']

" Set git as the default vim-grepper tool
runtime plugin/grepper.vim
let g:grepper.tools = ['git']
let g:grepper.git.grepprg = 'git grep -nGIi --untracked'

let g:prettier#autoformat_require_pragma = 1

"===== NERDTree config =====
" Show hidden files by default
let NERDTreeShowHidden=1


"===== Startify config =====
" Show NERDTree bookmarks
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks | sort")

" Configure a simple header. The default header takes too much precious space.
let g:startify_custom_header = ['   STARTIFY']

" Show at most 5 files in the files list
let g:startify_files_number = 5

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]


" C/C++ autocomplete. For installation instruction see:
" https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide
" let g:ycm_clangd_binary_path = 'clangd'


"===============================================================================
"                                     CONFIG
"===============================================================================

" Load coc.vim config
runtime coc.vim

if has("gui_running")
  " GUI is running or is about to start.
  winpos 0 0
  set lines=39 columns=146
endif

set guifont=Noto\ Mono\ 11

" Show line numbers
set number

" Make sure VIM copy/pastes to system clipboard
set clipboard=unnamedplus

"colorscheme seti
colorscheme codedark

" Show existing tab with 2 spaces width
set tabstop=2

" When indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert spaces
set expandtab

" Change popup menu style
highlight Pmenu guibg=#2F2F2F gui=bold

" Highlight trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/

" Highlight search matches
set hlsearch

" Show the next match while entering a search
set incsearch

" Don't wrap around the end of the file when doing searches
set nowrapscan

" Allow switching buffer even if it's not saved yet
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Set hybrid line numbers (can be disabled with `set number norelativenumber`)
set number relativenumber

" Remove toolbar
set guioptions -=T

" Make it so $ doesn't copy the line break
noremap $ g_

" Line swapping shortcuts
nnoremap <silent> <C-j> :m .+1<CR>
nnoremap <silent> <C-k> :m .-2<CR>

" Save Vim backup/swap files inside .vim folder
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Store deleted text only on register 1 (i.e., don't mess with the unnamed
" register)
nnoremap d "1d
nnoremap D "1D
nnoremap c "1c
nnoremap C "1C
nnoremap x "1x
nnoremap X "1X

vnoremap d "1d
vnoremap D "1D
vnoremap c "1c
vnoremap C "1C
vnoremap x "1x
vnoremap X "1X
