"===============================================================================
"                                 PLUGGED PLUGINS
"===============================================================================
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', { 'dir': '~/.vim/plugged/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mhinz/vim-grepper'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': [
  \   'css',
  \   'graphql',
  \   'html',
  \   'javascript',
  \   'json',
  \   'scss',
  \   'typescript',
  \   'yaml'
  \   ]
  \ }
Plug 'slim-template/vim-slim'
Plug 'trusktr/seti.vim'
Plug 'zxqfl/tabnine-vim'
call plug#end()

" Set keyboard shortcuts for fuzzy file finder (using fzf)
nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-h> :Buffers<CR>

" Disable fuzzy file finder preview window
let g:fzf_preview_window = ''

" Set git as the default vim-grepper tool
runtime plugin/grepper.vim
let g:grepper.tools = ['git']
let g:grepper.git.grepprg = 'git grep -nGIi --untracked'

let g:prettier#autoformat = 0
autocmd BufWritePre *.css,*.graphql,*.html,*.js,*.json,*.jsx,*.scss,*.ts,*.tsx,*.yaml PrettierAsync


"===============================================================================
"                                     CONFIG
"===============================================================================
if has("gui_running")
  " GUI is running or is about to start.
  winpos 0 0
  set lines=32 columns=140
endif

set guifont=Monospace\ 12

" Show line numbers
set number

" Make sure VIM copy/pastes to system clipboard
set clipboard=unnamedplus

colorscheme seti

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

" Make it so $ doesn't copy the line break
noremap $ g_

" Line swapping shortcuts
nnoremap <silent> <C-j> :m .+1<CR>
nnoremap <silent> <C-k> :m .-2<CR>

" Insert tabs using Shift + Tab
inoremap <S-Tab> <C-V><Tab>

" Save Vim backup/swap files inside .vim folder
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
