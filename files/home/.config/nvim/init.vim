set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/deoplete.nvim'               " auto completion
Plugin 'junegunn/goyo.vim'                  " calm mode
Plugin 'junegunn/limelight.vim'             " highlight current paragraph only
Plugin 'rstacruz/sparkup'                   " HTML speedup with ;e
Plugin 'vim-airline/vim-airline'            " vim statusbar
Plugin 'vim-airline/vim-airline-themes'     " vim statusbar themes
Plugin 'enomsg/vim-haskellConcealPlus'      " unicode for haskell operators
Plugin 'easymotion/vim-easymotion'          " fast movement with `f` in normal mode
Plugin 'tpope/vim-surround'                 " operations on parentheses, brackets, etc
Plugin 'scrooloose/nerdtree'                " Folder explorer
Plugin 'Shougo/vimproc.vim'                 " make neovim asynchronous 
Plugin 'yogsototh/haskell-vim'              " syntax indentation / highlight
" Plugin 'eagletmt/ghcmod-vim'                " various haskell features
Plugin 'eagletmt/neco-ghc'                  " Haskell completion plugin
" Plugin 'Twinside/vim-hoogle'                " use hoogle in vim
Plugin 'tidalcycles/vim-tidal'              " tidal : music patterns in haskell

Plugin 'dylanaraps/wal.vim'

call vundle#end()
filetype plugin on

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = 'DarkGray'

colorscheme wal
" colorscheme noctu

set backspace=indent,eol,start
set history=200
set ruler
set wildmenu
set ttimeout
set ttimeoutlen=100
set display=truncate
set scrolloff=5
set incsearch
set mouse=a
set expandtab
set tabstop=2
set shiftwidth=2
set wrap
set linebreak
syntax on
  
" if (exists('+colorcolumn'))
"     set colorcolumn=120
"     highlight ColorColumn ctermbg=9
" endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n>:bprevious<CR>
tnoremap <A-l> <C-\><C-n>:bnext<CR>
tnoremap <A-q> <C-D><C-\><C-n>:bdelete!<CR>

set hlsearch
set number
set relativenumber
set background=dark
set nobackup
set noswapfile
set showcmd
set ignorecase
set hidden
set autoindent
set laststatus=2
set encoding=utf-8
set fileencoding=utf-8

autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

let g:deoplete#enable_at_startup = 1

" Deoplete <Tab> shortcut
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Vim-Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wal'
let g:airline#extensions#tabline#enabled = 1

" Use , instead of \ as the Leader key
let mapleader = ","
nmap f <Plug>(easymotion-w)

" NERDTree Config
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '\.swo', '\.swn', '\.swm', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*', '\.un\~$']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>


" Tabs Management
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-q> :q<CR>
inoremap <C-l> :tabnext<CR>
inoremap <C-h> :tabprevious<CR>
inoremap <C-n> :tabnew<CR>
inoremap <C-q> :q<CR>

" Buffers Management
nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bprevious<CR>
nnoremap <A-q> :bdelete<CR>
inoremap <A-l> :bnext<CR>
inoremap <A-h> :bprevious<CR>
inoremap <A-q> :bdelete<CR>

" Additional shortcuts

inoremap <C-Space> <Esc>/<++><Enter>:noh<Enter>"_c4l
nnoremap <C-Space> <Esc>/<++><Enter>:noh<Enter>"_c4l

" HTML Files

autocmd Filetype html set autoindent
autocmd Filetype html inoremap ;d <!DOCTYPE html><Enter><html><Enter><Tab><head><Enter><Tab><title><++></title><Enter><meta charset="utf-8" /><Enter><Backspace></head><Enter><body><Enter><Tab><++><Enter><Backspace></body><Enter><Backspace></html>
autocmd Filetype html nnoremap ;d i<!DOCTYPE html><Enter><html><Enter><Tab><head><Enter><Tab><title><++></title><Enter><meta charset="utf-8" /><Enter><Backspace></head><Enter><body><Enter><Tab><++><Enter><Backspace></body><Enter><Backspace></html>
let g:sparkupExecuteMapping = ';e'

" Open URLs in firefox
let g:netrw_browsex_viewer= "firefox"

" LaTeX files
autocmd Filetype tex nnoremap ;c :w<Enter>:!pdflatex "%"<Enter><Enter>
" C files
autocmd Filetype c nnoremap ;c :w<Enter>:!gcc "%" -o program<Enter><Enter>


" -------------------
"       Haskell
" -------------------
let mapleader="-"
let g:mapleader="-"
let hscoptions="𝐓𝐒𝐄𝐌""
" let hscoptions="SMETfcCRla𝐓𝐒𝐄𝐌"
set tm=2000
" nmap <silent> <leader>ht :GhcModType<CR>
" nmap <silent> <leader>hh :GhcModTypeClear<CR>
" nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
let g:syntastic_always_populate_loc_list = 1
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>

" Auto-checking on writing
" autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

"  neocomplcache (advanced completion)
autocmd BufEnter *.hs,*.lhs let g:neocomplcache_enable_at_startup = 1
function! SetToCabalBuild()
    if glob("*.cabal") != ''
        set makeprg=cabal\ build
    endif
endfunction
autocmd BufEnter *.hs,*.lhs :call SetToCabalBuild()

" -- neco-ghc
let $PATH=$PATH.':'.expand("~/.cabal/bin")
