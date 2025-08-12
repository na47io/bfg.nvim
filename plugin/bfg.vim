" BFG colorscheme plugin
" This file is automatically loaded by Neovim

if exists('g:loaded_bfg') || &compatible
  finish
endif
let g:loaded_bfg = 1

" Add the colorscheme to the runtime path
let s:plugin_root = expand('<sfile>:h:h')
let &runtimepath .= ',' . s:plugin_root