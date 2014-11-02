" JavaScript Lint
if !exists('b:current_compiler')
  compiler jsl
endif
autocmd QuickFixCmdPost make open

" quickrun for Node
let g:quickrun_config = {
      \ "javascript": {
      \   "command": "node", 
      \   "tempfile": "{tempname().js"
      \   }
      \ }
	
