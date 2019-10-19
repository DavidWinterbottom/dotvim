call pathogen#infect()
call pathogen#helptags()

syntax on

set hidden
set vb t_vb=

"set nowrap              "# dont wrap lines
set scrolloff=2         "# 2 lines above/below cursor when scrolling
set number              "# show line numbers
set showmatch           "# show matching bracket (briefly jump)
set showmode            "# show mode in status bar (insert/replace/...)
set showcmd             "# show typed command in status bar
set ruler               "# show cursor position in status bar
set title               "# show file in titlebar
set wildmenu            "# completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        "# use 2 lines for the status bar
set matchtime=2         "# show matching bracket for 0.2 seconds
set matchpairs+=<:>     "# specially for html

"# editor settings
"#set esckeys            # map missed escape sequences (enables keypad keys)
set ignorecase          ""# case insensitive searching
set smartcase           ""# but become case sensitive if you type uppercase characters
set smartindent         ""# smart auto indenting
set smarttab            ""# smart tab handling for indenting
set magic               ""# change the way backslashes are used in search patterns
set bs=indent,eol,start ""# Allow backspacing over everything in insert mode
set splitbelow
set splitright

nmap <leader>p :setlocal paste! paste?<cr>

set tabstop=2           ""# number of spaces a tab counts for
set shiftwidth=2        ""# spaces for autoindents
set expandtab           ""# turn a tabs into spaces

set fileformat=unix       ""# file mode is unix
set fileformats=unix,dos  "" # only detect unix file format, displays that ^M with dos

""# system settings
set lazyredraw          ""# no redraws in macros
set confirm             ""# get a dialog when :q, :w, or :wq fails
set nobackup            ""# no backup~ files.
set viminfo='20,\"500   ""# remember copy registers after quitting in the .viminfo file -set hidden              # remember undo after quitting
set history=50          ""# keep 50 lines of command history
set mouse=v             ""# use mouse in visual mode (not normal,insert,command,help mode)'

" directories for swap and undo
if has("win32")
  set backupdir=/Users/David/vimfiles/backup
  set directory=/Users/David/vimfiles/swap
  set undodir=/Users/David/vimfiles/undo
else
  set backupdir=~/.vim/backup/
  set directory=~/.vim/swap/
  set undodir=~/.vim/undo/
endif

"------------------
"" display settings - using solarized
"------------------
set background=dark     "# enable for dark terminals
colorscheme solarized

if has("autocmd")
  filetype plugin indent on
endif

" Map to C-W to use multi window without closing window...
map <C-O> <C-W>

"-----------------------------------------
"" german characters
"-----------------------------------------

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"-----------------------------------------
" NERDTree settings
"-----------------------------------------
map <C-T> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-----------------------------------------
" BufExplorer settings
"-----------------------------------------
map <C-B> :BufExplorer<CR>
let g:bufExplorerShowRelativePath=1

"-----------------------------------------
" CtrlP settings
"-----------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$\|node_modules\|bower_components',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:ctrlp_use_caching = 1

"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'c'

"-----------------------------------------
"" folding settings
"-----------------------------------------
set foldmethod=indent   "fold based on indent
set foldlevelstart=99
set foldignore=

"-----------------------------------------
"" Markdown Preview settings
"-----------------------------------------
let g:mkdp_path_to_chrome = ""
" Path to the chrome or the command to open chrome (or other modern browsers).
" If set, g:mkdp_browserfunc would be ignored.

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" Callback Vim function to open browser, the only parameter is the url to open.

let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

let g:mkdp_open_to_the_world = 0
" Set to 1, the preview server will be available to others in your network.
" By default, the server only listens on localhost (127.0.0.1).
