call pathogen#runtime_append_all_bundles()
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

"------------------
"" display settings - using solarized
"------------------
set background=dark     "# enable for dark terminals
colorscheme solarized

"------------------
"" status line - using fugitive
"------------------
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{fugitive#statusline()},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"" problem with fugitive on windows -- http://stackoverflow.com/questions/2932399/error-using-the-gdiff-command-of-fugitive-vim-using-gvim-for-windows-and-msys-g
set directory+=,~/tmp,$TMP

if has("autocmd")
  filetype plugin indent on
endif

"-----------------------------------------
"" folding settings
"-----------------------------------------
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

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

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"-----------------------------------------
" CtrlP settings
"-----------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|node_modules\|bower_modules\',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:ctrlp_use_caching = 1

"------------------------"
" EasyTags settings"
"------------------------"
":let g:easytags_cmd = "c:/local/tools/ctags58/ctags"
:set tags=./tags;
:let g:easytags_dynamic_files = 1

"------------------------"
" TagBar settings"
"------------------------"
nnoremap <silent> <Leader>b :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
\ }
"let g:tagbar_ctags_bin = "c:/local/tools/ctags58/ctags"

" tagbar support for groovy
let g:tagbar_type_groovy = {
\ 'ctagstype' : 'groovy',
\ 'kinds' : [
\ 'p:package',
\ 'c:class',
\ 'i:interface',
\ 'f:function',
\ 'v:variables',
\ ]
\ }

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }

"------------------------"
" Syntastic settings:
"------------------------"
function s:find_jshintrc(dir)
    let l:found = globpath(a:dir, '.jshintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:find_jshintrc(l:parent)
    endif

    return "~/.jshintrc"
endfunction

function UpdateJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:find_jshintrc(l:dir)
    let g:syntastic_javascript_jshint_args = '--config ' . l:jshintrc

endfunction

au BufEnter * call UpdateJsHintConf()
let g:syntastic_always_populate_loc_list=1
let g:syntastic_debug = 0

