call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on

set hidden
set vb t_vb=

"# display settings
"set background=dark     "# enable for dark terminals
colorscheme solarized

"set nowrap              "# dont wrap lines
set scrolloff=2         "# 2 lines above/below cursor when scrolling
set number              "# show line numbers
#set showmatch           "# show matching bracket (briefly jump)
set showmode            "# show mode in status bar (insert/replace/...)
set showcmd             "# show typed command in status bar
set ruler               "# show cursor position in status bar
set title               "# show file in titlebar
set wildmenu            "# completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        "# use 2 lines for the status bar
#set matchtime=2         "# show matching bracket for 0.2 seconds
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

""#set fileformat=unix     # file mode is unix
""#set fileformats=unix,dos    # only detect unix file format, displays that ^M with dos

""# system settings
set lazyredraw          ""# no redraws in macros
set confirm             ""# get a dialog when :q, :w, or :wq fails
set nobackup            ""# no backup~ files.
set viminfo='20,\"500   ""# remember copy registers after quitting in the .viminfo file -set hidden              # remember undo after quitting
set history=50          ""# keep 50 lines of command history
set mouse=v             ""# use mouse in visual mode (not normal,insert,command,help mode)'

set fdm=indent          ""# Set folding method to indent

command! Status echo "All systems are go!"

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{fugitive#statusline()},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

if has("autocmd")
  filetype plugin indent on
endif


" Map to C-W to use multi window without closing window...
map <C-O> <C-W>
"nmap <silent> <C-Left> :wincmd h<CR>
"nmap <silent> <C-Down> :wincmd j<CR>
"nmap <silent> <C-Up> :wincmd k<CR>
"nmap <silent> <C-Right> :wincmd l<CR>

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
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|mode_modules\',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:ctrlp_use_caching = 1


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

"------------------------
" session-save settings
"-------------------------
:let g:session_autosave = 'yes'

"------------------------"
" YouCompleteMe settings"
"------------------------"
let g:ycm_collect_identifiers_from_tags_files = 1


"------------------------"
" TagBar settings"
"------------------------"
nnoremap <silent> <Leader>b :TagbarToggle<CR>
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
\ }
let g:tagbar_ctags_bin = "/local/tools/ctags/ctags58/"
"
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

" Custom syntastic settings:
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
    " let g:syntastic_javascript_jshint_conf = l:jshintrc
    let g:syntastic_javascript_jshint_args = '--config ' . l:jshintrc

endfunction

au BufEnter * call UpdateJsHintConf()
let g:syntastic_always_populate_loc_list=1
let g:syntastic_debug = 0

"--------------------------"
" Matchit settings
"--------------------------"
filetype plugin on
runtime bundle/vim-matchit/plugin/matchit.vim
