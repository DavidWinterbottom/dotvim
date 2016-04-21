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

"------------------
"" filetypes for Ultisnip and JavaScript
"------------------
"autocmd BufEnter,BufNew *.js setf javascript.javascript_jasmine

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

"-----------------------------------------
" BufExplorer settings
"-----------------------------------------
map <C-B> :BufExplorer<CR>

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

"------------------------"
" TernJS Settings
"------------------------"
let g:tern_show_argument_hints='on_hold'
"
"------------------------"
" Syntastic settings:
"------------------------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['jshint']"
let g:syntastic_javascript_checkers = ['eslint']"

autocmd BufNewFile,BufRead *.json set ft=javascript
let g:syntastic_json_checkers = ['eslint']

let g:syntastic_debug = 0
let g:jsx_ext_required = 0

"let g:syntastic_shell = "\bin\sh"
set shell=C:\local\tools\Git\bin\sh.exe
set shellslash

"http://stackoverflow.com/questions/22534048/how-to-prevent-syntastic-from-creating-a-directory-for-every-vim-instance
"let $TMPDIR = '/tmp/vim-' . $USER
"silent! call mkdir($TMPDIR, '', 0700)
"
"----------------------------"
"" Ultisnips settings
"----------------------------"
if has("mac")
  let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/UltiSnips", $HOME."/.vim/bundle/vim-snippets/UltiSnips"]
elseif has("win32")
  let g:UltiSnipsSnippetDirectories=[$HOME."/vimfiles/UltiSnips", $HOME."/vimfiles/bundle/vim-snippets/UltiSnips"]
endif

let g:UltiSnipsEditSplit="horizontal"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListTrigger="<c-g>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"----------------------------"
"" Neocomplete settings
"----------------------------"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"-----------------------------------------
" Matchanything settings
"-----------------------------------------
let g:mta_filetypes = {'html':1,'xhtml':1,'xml':1, 'javascript':1}

"-----------------------------------------
"" folding settings
"-----------------------------------------
set foldmethod=indent   "fold based on indent
set foldlevelstart=99
set foldignore=

"-----------------------------------------
" Emmet
"-----------------------------------------
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/vimfiles/.snippets_custom.json')), "\n"))


