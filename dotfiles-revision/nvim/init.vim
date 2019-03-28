" Setup dein  ---------------------------------------------------------------{{{
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-commentary')
  call dein#add('w0rp/ale')
  call dein#add('joshdick/onedark.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('ncm2/ncm2')
  call dein#add('roxma/nvim-yarp')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })


  if dein#check_install()
     call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on
" }}}

if (has("termguicolors"))
	set termguicolors
endif

let base16colorspace=256
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

set background=dark
colorscheme onedark

set number
set relativenumber
set noswapfile
set nobackup
set nowritebackup
set tabstop=2
set smartcase
set expandtab
set shiftwidth=2
set cc=79
set undofile
set undodir=~/.vim/temp/undodir
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2
set hidden

set completeopt=noinsert,menuone,noselect,
set cot+=preview

" Ale Linter
let g:ale_fixers = {'javascript': ['standard']}

" Airline theme and buffers
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript   

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" Set up language client
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
		\ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'java': ['/usr/local/bin/jdtls', '-data', getcwd()],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
