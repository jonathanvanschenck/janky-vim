" We don't still live in the 80s . . . 
set nocompatible
filetype off


" ---------------
"  Vundle config
"  --------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" get nerdtree for filebrowsing
Plugin 'preservim/nerdtree'

" Indent guide
Plugin 'Yggdroot/indentLine'

" chords
Plugin 'kana/vim-arpeggio'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" -----------------
"  Highlighting
" -----------------

" Get that sweet, sweet coloration
syntax on


" ----------------
"  Numbering
" ---------------

set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" -------------
"  Indentation
" -------------

" turn on the plugin (handled above)
" filetype plugin indent on

" indent when moving to the next line
set autoindent

" convert tabs to spaces
set expandtab

" define width for >> and << commands
set shiftwidth=2

" what does this do?
set softtabstop=2


" Reset color
let g:indentLine_color_term = 239
" let g:indentLine_setColors = 0

" Change character
let g:indentLine_char = '▏'

" Correct for json file types
" let g:indentLine_enabled = 1
" let g:vim_json_syntax_conceal = 0
" autocmd Filetype json let g:indentLine_setConceal = 0
autocmd Filetype json :IndentLinesDisable

" -----------------
"  Commenting
" ----------------

source ~/.vim/scripts/vcomments.vim
" For some reason, '<C-_>' is 'ctrl+/'
nnoremap <C-_> :call ToggleComment(0)<CR>
inoremap <C-_> <esc> :call ToggleComment(0)<CR>gi
vnoremap <C-_> <esc> :call ToggleComment(1)<CR>


" ---------------
"  Screen Motion
" ---------------

noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>

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


" ------------------
"  Split Navigation
" ------------------

" Why is this not the default?!
set splitright
set splitbelow

" Simplify split navigation
noremap <C-J> <C-W><C-J>
noremap <C-H> <C-W><C-H>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

" ----------
"  Snippets
" ----------

nnoremap <leader>p :-1read $HOME/.vim/snippets/print.js<CR>f(la

" source ~/.vim/scripts/printify.vim
" noremap <C-p> :call Printify()<CR>



" -----------------
"  NERDTree
" -----------------

" Start on load (but not in diff mode)
if !(&diff)
  autocmd VimEnter * NERDTree | wincmd p
endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Nicer arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'




" -----------------
"  Helper Commands
" ----------------

" reload .vimrc 
nnoremap <C-F5> :source $HOME/.vim/.vimrc<CR>


" force reload all tabs (for after git checkouts)
nnoremap <F5> :tabdo e!<CR>


" Load arpeggio here
call arpeggio#load()

" Insert lines above or below
"  mnemonic: "Return Over" and "Return Below"
Arpeggio nnoremap ro O<esc>j^
Arpeggio nnoremap rb o<esc>k^

