packadd minpac
call minpac#init()

call minpac#add('junegunn/fzf')


" commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" key-bindings
nnoremap <C-p> :FZF<CR>
