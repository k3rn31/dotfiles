call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

syntax on
set scrolloff=10
set number
set relativenumber
set showmode
set showcmd
set visualbell
set incsearch
set hlsearch
set ignorecase
set smartcase

let mapleader = " "

if has('macunix')
  set clipboard=unnamed
elseif has('unix')
  set clipboard=unnamedplus
endif


" IdeaVim
if has('ide')
  set commentary
  set clipboard+=ideaput
  set ideajoin
  set idearefactormode=keep
  
  map <leader>f :action Find<CR>
  map <leader>g :action Generate<CR>
  
  set multiple-cursors
  if has('macunix')
    nmap <D-n> <Plug>NextWholeOccurrence
    xmap <D-n> <Plug>NextWholeOccurrence
    nmap <D-x> <Plug>SkipOccurrence
    xmap <D-x> <Plug>SkipOccurrence
    nmap <D-p> <Plug>RemoveOccurrence
    xmap <D-p> <Plug>RemoveOccurrence
  endif
  
  set highlightedyank
else
  if exists('+relativenumber')
    set relativenumber
  endif
  
  filetype plugin indent on
  
  if has('nvim') || has('vim-8.0.1394')
    augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})
    augroup END
  endif
endif

vnoremap > >gv
vnoremap < <gv
