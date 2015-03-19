set go-=T
set bg=dark
set vb t_vb=

if has("mac")
  set fu
  set fuopt+=maxhorz
endif


if &background == "dark"
    hi normal guibg=black
endif

set guifont=Lucida_Console:h8
set lines=27
set columns=86
colorscheme solarized
