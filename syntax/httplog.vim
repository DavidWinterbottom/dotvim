" Vim syntax file
" Language: apache log files
" Maintainer: Claudio Fleiner <claudio@fleiner.com>
" URL:    http://www.fleiner.com/vim/syntax/httplog.vim
" Last change:  2001 Apr 26


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match httpHost "^[a-zA-Z0-9._-]*" nextgroup=httpUnknown skipwhite
syn match httpUnknown contained "-" nextgroup=httpId skipwhite
syn match httpId contained "[-a-zA-Z0-9]\+" nextgroup=httpDate skipwhite
syn match httpDate contained "\[[^\]]*]" nextgroup=httpCommand skipwhite
syn match httpCommand contained +"[^"]*"+ contains=httpFile,httpRobot nextgroup=httpResult skipwhite
syn match httpFile contained " /[^ "]*"
syn match httpRobot contained " /robots.txt"hs=s+1
syn match httpResult contained "\d\+" nextgroup=httpSize skipwhite
syn match httpSize contained "\d\+" nextgroup=httpReferer skipwhite
syn match httpSize contained "-" nextgroup=httpReferer skipwhite
syn match httpReferer contained +"[^"]*"+ nextgroup=httpBrowser skipwhite
syn match httpBrowser contained +"[^"]*"+ 
syn match httpIgnore "^.*transmeta.com.*$"
syn match httpIgnore "^.*209.10.217.66.*$"
syn match httpIgnore "^.*almaden.ibm.com.*$"
syn match httpIgnore "^.*ricochet.net.*$"
syn match httpIgnore "^.*216.122.113.83.*$"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_bc_syn_inits")
  if version < 508
    let did_bc_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink httpHost Comment
  HiLink httpUnknown PreProc
  HiLink httpId Exception
  HiLink httpDate String
  HiLink httpCommand Statement
  HiLink httpResult Type
  HiLink httpSize Number
  HiLink httpReferer Function
  HiLink httpBrowser Boolean
  HiLink httpRobot Debug
  HiLink httpIgnore Debug
  delcommand HiLink
endif

