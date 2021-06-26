"----------------------------------------------
" Pywlugin management Download vim-plug from the URL below and follow the
" installation instructions: https://github.com/junegunn/vim-plug
" Some plugins need python3 supporte: pip3 install --user pynvim
"
" Other tools to install: fzf, bat,test.txt ctags
"----------------------------------------------
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Language support
Plug 'fatih/vim-go', { 'for': 'go','do': ':GoUpdateBinaries' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Colorschemes
Plug 'ayu-theme/ayu-vim'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set nocompatible                  " no need to be in old vim compatibility
if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set nrformats=                    " treat all numbers as decimals
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set visualbell
set hidden
set wildmenu
set wildmode=list:longest
set ruler
set relativenumber
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often
set t_Co=256
set ttyfast
set undofile
set undodir=~/.vim/undo
set undolevels=10000

set nowrap
set colorcolumn=81                " highlight the 80th column as an indicator
set formatoptions=tcroqn1j

set list                          " show trailing whitespace
set listchars=tab:▸\ ,eol:¬

" neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" Enable mouse if possible
if has('mouse')
    set mouse=a
    set mousemodel=popup_setpos
endif

" Allow vim to set a custom font or color for a word
syntax enable

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Set mapleader to <SPACE>
nnoremap <SPACE> <NOP>
let mapleader=" "

"----------------------------------------------
" Search
"----------------------------------------------
" TEXT SEARCH:
"-------------
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" FILE SEARCH:
"-------------
"allows FZF to open by pressing ALT-F
map <M-f> :FZF<CR>

"----------------------------------------------
" Colors
"----------------------------------------------
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

set background=dark

let ayucolor="mirage"
colorscheme ayu

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Use screen movement
nnoremap j gj
nnoremap k gk

" Map ESC to jj
inoremap jj <ESC>

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>b :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

" Move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"----------------------------------------------
" Plugin: preservim/nerdtree
"----------------------------------------------
nnoremap <F2> :NERDTreeToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 &&
            \ isdirectory(argv()[0]) &&
            \ !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] |
            \ endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 &&
            \ winnr('$') == 1 &&
            \ exists('b:NERDTree') &&
            \ b:NERDTree.isTabTree() |
            \ quit |
            \ endif

" Show hidden files by default.
let NERDTreeShowHidden = 1
" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1

"----------------------------------------------
" Plugin: preservim/nerdcommenter
"----------------------------------------------
let g:NERDCreateDefaultMappings = 1

"----------------------------------------------
" Plugin: preservim/tagbar
"----------------------------------------------
nmap <F8> :TagbarToggle<CR>

"----------------------------------------------
" Plugin: Shougo/deoplete
"----------------------------------------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Use tab to autocomplete
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<c-p>" : "\<S-TAB>"

"----------------------------------------------
" Plugin: dense-analysis/ale
"----------------------------------------------
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 0

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Use deoplete
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nnoremap <leader>td :ALEGoToDefinition<CR>
nnoremap <leader>tr :ALEFindReference<CR>
nnoremap <leader>ts :ALESymbolSearch<CR>

nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'rust': ['rustfmt']
            \}

let g:ale_linters = {
            \  'rust': ['analyzer'],
            \  'go': ['go build', 'golangci-lint'],
            \}

let g:ale_go_golangci_lint_options = '--enable-all --disable wsl --disable goimports --disable gofmt --fix'
let g:ale_go_golangci_lint_package = 1
let g:ale_go_gofmt_options = '-s'

let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_cargo_clippy_options = '--fix'

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

" Do not insert bulletpoints automaticalli to prevent wrapping problems
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go set colorcolumn=120

autocmd FileType go nmap <leader>y  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>a <Plug>(go-alternate-edit)
autocmd FileType go nmap <Leader>as <Plug>(go-alternate-split)

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Enable GoMetaLinter on save
let g:go_metalinter_autosave = 0

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Using gopls to find definitions and information.
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

let g:go_def_mapping_enabled = 0

"----------------------------------------------
" Language: Rust
"----------------------------------------------
au FileType rust set expandtab
au FileType rust set shiftwidth=4
au FileType rust set softtabstop=4
au FileType rust set tabstop=4
au FileType rust set colorcolumn=100

autocmd FileType rust nmap <leader>y  :Cbuild<CR>
autocmd FileType rust nmap <leader>r  :Crun<CR>
autocmd FileType rust nmap <leader>t  :Ctest<CR>
let g:rustfmt_autosave = 1

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set wrap
au FileType markdown set textwidth=79
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=4
au FileType typescript set softtabstop=4
au FileType typescript set tabstop=4

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2
