call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on

set hidden
set vb t_vb=

# display settings
set background=dark     # enable for dark terminals
set nowrap              # dont wrap lines
set scrolloff=2         # 2 lines above/below cursor when scrolling
set number              # show line numbers
set showmatch           # show matching bracket (briefly jump)
set showmode            # show mode in status bar (insert/replace/...)
set showcmd             # show typed command in status bar
set ruler               # show cursor position in status bar
set title               # show file in titlebar
set wildmenu            # completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        # use 2 lines for the status bar
set matchtime=2         # show matching bracket for 0.2 seconds
set matchpairs+=<:>     # specially for html

# editor settings
#set esckeys             # map missed escape sequences (enables keypad keys)
set ignorecase          # case insensitive searching
set smartcase           # but become case sensitive if you type uppercase characters
set smartindent         # smart auto indenting
set smarttab            # smart tab handling for indenting
set magic               # change the way backslashes are used in search patterns
set bs=indent,eol,start # Allow backspacing over everything in insert mode

set tabstop=2           # number of spaces a tab counts for
set shiftwidth=2        # spaces for autoindents
set expandtab           # turn a tabs into spaces

#set fileformat=unix     # file mode is unix
#set fileformats=unix,dos    # only detect unix file format, displays that ^M with dos

# system settings
set lazyredraw          # no redraws in macros
set confirm             # get a dialog when :q, :w, or :wq fails
set nobackup            # no backup~ files.
set viminfo='20,\"500   # remember copy registers after quitting in the .viminfo file -set hidden              # remember undo after quitting
set history=50          # keep 50 lines of command history
set mouse=v             # use mouse in visual mode (not normal,insert,command,help mode)'

command! Status echo "All systems are go!"

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{fugitive#statusline()},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

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
autocmd vimenter * if !argc() | NERDTree | endif
map <C-T> :NERDTreeToggle<CR>

"-----------------------------------------
" CtrlP settings
"-----------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:ctrlp_use_caching = 0


"-----------------------------------------
" Slime settings
"-----------------------------------------

let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"
"let g:slime_target = "whimrepl"


"------------------------
" jQuery settings
"-------------------------
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery"
