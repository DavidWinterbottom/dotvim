call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set number
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
syntax on
command! Status echo "All systems are go!"
set runtimepath^=~/.vim/bundle/ctrlp.vim

if has("autocmd")
  filetype plugin indent on
endif



"-----------------------------------------
" CtrlP settings
"-----------------------------------------

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

let g:ctrlp_use_caching = 0
