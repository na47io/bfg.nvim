" BFG colorscheme
" Maintainer: nik
" Description: A minimal, calming colorscheme with muted greens and yellows

if exists("g:colors_name")
  hi clear
endif

if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "bfg"

" Load the Lua module
lua require('bfg').load()