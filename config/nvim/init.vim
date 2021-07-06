"----------------------------------------------
" Pywlugin management Download vim-plug from the URL below and follow the
" installation instructions: https://github.com/junegunn/vim-plug
" Some plugins need python3 supporte: pip3 install --user pynvim
"
" Other tools to install: fzf, bat,test.txt ctags
"----------------------------------------------
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'windwp/nvim-autopairs'
Plug 'dense-analysis/ale'
Plug 'nathunsmitty/nvim-ale-diagnostic'

Plug 'Shougo/deoplete-lsp', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'neovim/nvim-lspconfig'

" Language tools
Plug 'simrat39/rust-tools.nvim'

" Colorschemes
Plug 'folke/tokyonight.nvim'

call plug#end()

lua << EOF
-- Language support
require'lspconfig'.bashls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.rust_analyzer.setup{}
EOF

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

set path+=**                      " Search in subfolders

" neovim specific settings
" Set the Python binaries neovim is using. Please note that you will need to
" install the neovim package for these binaries separately like this for
" example:
" pip3.6 install -U neovim
let g:python3_host_prog = '/usr/bin/python3'

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

" MakeTags generates ctags for the current project
command! MakeTags !ctags -R .

"----------------------------------------------
" File Browsing
"----------------------------------------------
let g:netrw_banner=0
let g:netrw_browse_split=4      " open in prior window
let g:netrw_altv=1              " open splits to the right
let g:netrw_liststyle=3         " tree view

"----------------------------------------------
" Search
"----------------------------------------------
" TEXT SEARCH:
"-------------
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
nnoremap <leader><space> :noh<cr>

" FILE SEARCH:
"-------------
"allows FZF to open by pressing ALT-F
map <M-f> :FZF<CR>

"----------------------------------------------
" Plugin: windwp/nvim-autopairs
"----------------------------------------------
lua << EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
npairs.setup()

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
EOF

"----------------------------------------------
" Plugin: nvim-treesitter/nvim-treesitter
"----------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            indent = {
                enable = true,
            },
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
            }
        }
    },
    autopairs = {
        enable = true
    }
}
EOF

"----------------------------------------------
" Colors
"----------------------------------------------
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

set background=dark

colorscheme tokyonight

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
" Plugin: hoob3rt/lualine.nvim
"----------------------------------------------
lua << EOF
require'nvim-web-devicons'.setup{
    default = true;
}
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
EOF

"----------------------------------------------
" Plugin: preservim/tagbar
"----------------------------------------------
nmap <F8> :TagbarToggle<CR>

"----------------------------------------------
" Plugin: Shougo/deoplete
"----------------------------------------------
let g:deoplete#enable_at_startup = 1

" Use tab to autocomplete
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<c-p>" : "\<S-TAB>"

"----------------------------------------------
" Plugin: dense-analysis/ale
"----------------------------------------------

lua << EOF
require("nvim-ale-diagnostic")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)
EOF

let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 0

" Use deoplete
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)

let g:ale_fixers = {
           \   '*': ['remove_trailing_lines', 'trim_whitespace'],
           \   'rust': ['rustfmt'],
           \   'go': ['goimports']
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
" Plugin: neovim/nvim-lspconfig
"----------------------------------------------
nmap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nmap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <leader>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nmap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nmap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nmap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" auto-format
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.go.in lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.rs.in lua vim.lsp.buf.formatting_sync(nil, 1000)

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable foldink
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

"----------------------------------------------
" Language: Rust
"----------------------------------------------
au FileType rust set expandtab
au FileType rust set shiftwidth=4
au FileType rust set softtabstop=4
au FileType rust set tabstop=4
au FileType rust set colorcolumn=100

" Plugin: 'simrat39/rust-tools.nvim'
lua << EOF
local opts = {
    tools = {
        runnables = {
            use_telescope = false,
        },
    }
}
require'rust-tools'.setup(opts)
EOF

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
