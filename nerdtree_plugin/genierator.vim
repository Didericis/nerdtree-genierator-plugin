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
  let component = input("Component Name:", "rcc")
  let filename = input("Filename:")
  let vars = input("Vars:")

  call system("cd " . treenode.path.str() . " && genierate " . component . " " . filename . " " . vars)

  let filepath = treenode.path.str() . "/" . filename

  let newTreeNode = g:NERDTreeFileNode.New(filepath, b:NERDTree)
  if empty(treenode)
    call b:NERDTree.root.refresh()
    call b:NERDTree.render()
  elseif treenode.isOpen || !empty(treenode.children)
    call parentNode.addChild(newTreeNode, 1)
    call NERDTreeRender()
    call newTreeNode.putCursorHere(1, 0)
  endif
endfunction
