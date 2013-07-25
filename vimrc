call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set number
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
syntax on
command! Status echo "All systems are go!"
set runtimepath^=~/.vim/bundle/ctrlp.vim

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{fugitive#statusline()},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

if has("autocmd")
  filetype plugin indent on
endif


" Map to C-W to use multi window without closing window...
map <C-O> <C-W>

"-----------------------------------------
" CtrlP settings
"-----------------------------------------

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
