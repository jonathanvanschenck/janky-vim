" We don't still live in the 80s . . . 
set nocompatible



" -----------------
"  Highlighting
" -----------------

" Get that sweet, sweet coloration
syntax on


" -------------
"  Indentation
" -------------

" turn on the plugin
filetype plugin indent on

" indent when moving to the next line
set autoindent

" convert tabs to spaces
set expandtab

" define width for >> and << commands
set shiftwidth=2

" what does this do?
set softtabstop=2


" -----------------
"  Commenting
" ----------------

source ~/.vim/scripts/vcomments.vim
" For some reason, '<C-_>' is 'ctrl+/'
nnoremap <C-_> :call ToggleComment(0)<CR>
inoremap <C-_> <esc> :call ToggleComment(0)<CR>gi
vnoremap <C-_> <esc> :call ToggleComment(1)<CR>


" -------------
"  Clipboard
" -------------
" Interface system clipboard with vim default register
set clipboard=unnamedplus


" ---------------
"  File search
" --------------

" Add tab complete for nested structures
set path+=**

" show tab complete menu
set wildmenu


" ----------------
"  Tags
" ---------------

" Bind the tag generated function to a vim key
noremap <leader>tag :!ctags --recurse=yes --exclude=.git --exclude=node_modules/* --exclude=venv/*


" ----------
"  Snippets
" ----------

nnoremap <leader>p :-1read $HOME/.vim/snippets/print.js<CR>f(la

" source ~/.vim/scripts/printify.vim
" noremap <C-p> :call Printify()<CR>

