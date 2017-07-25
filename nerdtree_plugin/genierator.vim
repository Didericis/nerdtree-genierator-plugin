" ============================================================================
" File:        genierator.vim 
" Description: plugin for NERD Tree that provides genierator support
" Maintainer:  Eric Bauerfeld <didericis@gmail.com>
" Last Change: 24 July 2017
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================
if exists('g:loaded_nerdtree_genierator')
  finish
endif
let g:loaded_nerdtree_genierator = 1

call NERDTreeAddMenuItem({
  \ 'text':     '(g)enierate',
  \ 'shortcut': 'g',
  \ 'callback': 'NERDTreeGenierate'
  \ })

function! NERDTreeGenierate()
  let treenode = g:NERDTreeDirNode.GetSelected()
  let name = input("Component Name: ", "rcc ")

  call system("cd " . treenode.path.str() . " && genierate " . name)

  call NERDTreeFocus() 
  "call g:NERDTree.ForCurrentTab().getRoot().refresh()
  "call g:NERDTree.ForCurrentTab().render() 
endfunction
