" BASES {{{
    " Base configs goes here.
    
    " Enable the clipboard between nvim and apps
    set clipboard=unnamedplus

    " Enable mouse
    set mouse=a

    " Show title
    set title

    " Navigate without saving buffers
    set hidden

    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    " Enable type file detection. Vim will be able to try to detect the type of file in use.
    filetype on

    " Enable plugins and load plugin for the detected file type.
    filetype plugin on

    " Load an indent file for the detected file type.
    filetype indent on

    " Turn syntax highlighting on.
    syntax on

    " Add numbers to each line on the left-hand side.
    set number

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

    " Use space characters instead of tabs.
    set expandtab

    " Do not save backup files.
    set nobackup

    " Do not let cursor scroll below or above N number of lines when scrolling.
    set scrolloff=10

    " Do not wrap lines. Allow long lines to extend as far as the line goes.
    set nowrap

    " While searching though a file incrementally highlight matching characters as you type.
    set incsearch

    " Ignore capital letters during search.
    set ignorecase

    " Override the ignorecase option if searching for capital letters.
    " This will allow you to search specifically for capital letters.
    set smartcase

    " Show partial command you type in the last line of the screen.
    set showcmd

    " Show the mode you are on the last line.
    set showmode

    " Show matching words during a search.
    set showmatch

    " Use highlighting when doing a search.
    set hlsearch

    " Set the commands to save in history default number is 20.
    set history=1000

    " Enable auto completion menu after pressing TAB.
    set wildmenu

    " Make wildmenu behave like similar to Bash completion.
    set wildmode=list:longest

    " There are certain files that we would never want to edit with Vim.
    " Wildmenu will ignore files with these extensions.
    set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

    " Enable fold
    " set foldmethod=indent
" }}}

" MAPPINGS {{{
    " Base
    let mapleader = " "

    " Normal
    nnoremap <leader>\ :nohlsearch<cr>

    " Split view
    nnoremap <leader>wj :split<cr>
    nnoremap <leader>wl :vsplit<cr>

    " Buffers
    nnoremap <leader>qq :bw<cr>
    nnoremap <c-n> :bnext<cr>
    nnoremap <c-p> :bprevious<cr>

    " Navigate the split view
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k 
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
    
    " Resize split windows
    nnoremap <leader>wrk <c-w>10+
    nnoremap <leader>wrj <c-w>10-
    nnoremap <leader>wrh <c-w>10>
    nnoremap <leader>wrl <c-w>10<

    " Plugins
    nnoremap <leader>e :NERDTree<cr>

 " }}}
