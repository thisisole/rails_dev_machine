"This must be first, because it changes other options as a side effect.
set nocompatible
scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8
"set mouse=a

" Let's save undo info!
if !isdirectory($HOME.'/.vim')
    call mkdir($HOME.'/.vim', '', 0770)
endif
if !isdirectory($HOME.'/.vim/undo_dir')
    call mkdir($HOME.'/.vim/undo_dir', '', 0700)
endif
set undodir=~/.vim/undo_dir
set undofile

"activate pathogen
call pathogen#infect()

"store lots of :cmdline history
set history=1000

"load ftplugins and indent files
filetype plugin on
filetype indent on

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"display tabs and trailing spaces
"set list
"set listchars=tab:»·,trail:·,eol:¶

"turn on syntax highlighting
syntax on

set tabstop=2
set relativenumber      "show line numbers
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points
set ignorecase

"default indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"tell the term has 256 colors
set t_Co=256

colorscheme solarized
set background=dark

if has ("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolate\ 12
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
endif

"settings für syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci

"if has("autocmd")
""    autocmd FileType ruby set omnifunc=rubycomplete#Complete
""    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
"endif

"mit eingabe von '=j' json formatieren
nmap =j :%!python -m json.tool<CR>

"fix to show vim airline instant
set laststatus=2

