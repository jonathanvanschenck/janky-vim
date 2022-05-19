" we don't still live in the 80s . . .
set nocompatible
filetype off
color mp-hack

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

" tags
" Plugin 'ludovicchabant/vim-gutentags'
set statusline+=%{gutentags#statusline()}

" JS improved syntax
Plugin 'pangloss/vim-javascript'

" python improved syntax
Plugin 'vim-python/python-syntax'

" mermaidi syntax
Plugin 'mracos/mermaid.vim'

" if (has('python3'))
"   " Debugging Tools
"   Plugin 'puremourning/vimspector'
" endif

" ctrlp
" Plugin 'ctrlpvim/ctrlp.vim'

" Surrounding
Plugin 'tpope/vim-surround'

" Git tooling
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" -----------------
"  Highlighting
" -----------------

" Get that sweet, sweet coloration
syntax on

" Show trailing whitepace and spaces before a tab:
" autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

" ---------------
"  Spelling
" ---------------

autocmd FileType latex setlocal spell spelllang=en_us
autocmd FileType markdown setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" ----------------
"  Numbering
" ---------------

set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" -------------
"  Indentation
" -------------

" turn on the plugin
" filetype plugin indent on

" indent when moving to the next line
set autoindent

" get that sweet, sweet auto carriage returns when
"  CRing on a {
set smartindent

" convert tabs to spaces
set expandtab



" define width for >> and << commands
set shiftwidth=2
set softtabstop=2
function g:SetTabs( value )
  execute printf("setlocal shiftwidth=%d", a:value)
  execute printf("setlocal softtabstop=%d", a:value)
endfunction
nnoremap <leader>st4 :call g:SetTabs(4)<CR>
nnoremap <leader>st2 :call g:SetTabs(2)<CR>


" Reset color
let g:indentLine_color_term = 239
" let g:indentLine_setColors = 0

" Change character
let g:indentLine_char = '▏'


" Force json to show quotes, but still allow indentlines
let g:vim_json_conceal=0


" -------------
"  Bracket Operations
" -------------

" Open up brackets
let s:matching_bracket = {
    \  "(" : ")",
    \  "{" : "}",
    \  "[" : "]",
    \ }
function g:OpenBrackets()
  let l:char = getline('.')[col('.')-1]
  if ((match(l:char, "\[]})\]") > -1) || (match(l:char, "\[[{(\]") > -1))
    execute printf("normal ci%s\<CR>\<ESC>", l:char)
    " execute ":<"
    execute "normal O "
  else
    return
  endif
  execute ":startreplace"
endfunction
" mnemonic "Bracket Open"
nnoremap <C-b> :call<space>g:OpenBrackets()<CR>
inoremap <C-b> <ESC>:call<space>g:OpenBrackets()<CR>



" -----------------
"  Commenting
" ----------------

source ~/.vim/scripts/vcomments.vim
" For some reason, '<C-_>' is 'ctrl+/'
nnoremap <C-_> :call ToggleComment(0)<CR>
inoremap <C-_> <esc> :call ToggleComment(0)<CR>gi
vnoremap <C-_> <esc> :call ToggleComment(1)<CR>

" -------------------
"  Normalize spacing
" -------------------

" source ~/.vim/scripts/prettify.vim
" nnoremap <leader>p :call g:PrettifySpaces()<CR>


" ---------------
"  Motion
" ---------------

" Screen motion - move faster
noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>

" Split screen (Why is this not the default?!)
set splitright
set splitbelow

" Simplify split navigation
noremap <C-J> <C-W><C-J>
noremap <C-H> <C-W><C-H>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>


" In visual line mode, it is easy to press J not j,
"  but J is irritatingly maped to "join lines", 
"  which is almost never what I want to do. So just
"  map J to j in visual mode. If I want to "join lines"
"  I can just use gJ in visual mode which does the same
"  thing. Even better, you don't even need to be in visual
"  mode to gJ!
vnoremap J j
vnoremap K k

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

" Turn off dumb super searches
set wildignore+=*/.git/*,*/node_modules/*,*/env/*,*.swp

" show tab complete menu
set wildmenu


" ----------------
"  Gutentags 
" ---------------

" Bind the tag generated function to a vim key
noremap <leader>tag :!ctags -R .<CR>:!vim -E -s -c "source $HOME/.vim/ctags/remove-require.vim" ./tags<CR>

" Let gutentags auto find project roots
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']

" Make GT reload happy
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_empy_buffer = 0

" Ignore all `requires` as javascript variables
" let g:gutentags_ctags_post_process_cmd = 'vim -E -s -c "q"'
" let g:gutentags_ctags_post_process_cmd = "vim -E -s -c \"source /home/jonathan/.vim/ctags/remove-require.vim\""


" ------------------
"  Split Navigation
" ------------------

" -----------------
"  JS syntax
" -----------------
let g:javascript_plugin_jsdoc = 1
" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"


" -----------------
"  python syntax
" -----------------
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

" -----------------
"  Vimspector
" -----------------
" let g:vimspector_enable_mappings = 'HUMAN'
nmap <Leader>dd  <Plug>VimspectorContinue                     "   When debugging, continue. Otherwise start debugging.
nmap <Leader>de  <Plug>VimspectorStop                         "   Stop debugging.
nmap <Leader>dr  <Plug>VimspectorRestart                      "   Restart debugging with the same configuration.
nmap <Leader>dp  <Plug>VimspectorPause                        "   Pause debuggee.
nmap <Leader>db  <Plug>VimspectorToggleBreakpoint             "   Toggle line breakpoint on the current line.
nmap <Leader>dcb <Plug>VimspectorToggleConditionalBreakpoint  "   Toggle conditional line breakpoint on the current line.
nmap <Leader>dfb <Plug>VimspectorAddFunctionBreakpoint        "   Add a function breakpoint for the expression under cursor
nmap <Leader>dtc <Plug>VimspectorRunToCursor                  "   Run to Cursor
nmap <Leader>dj  <Plug>VimspectorStepOver                     "   Step Over
nmap <Leader>dl  <Plug>VimspectorStepInto                     "   Step Into
nmap <Leader>dk  <Plug>VimspectorStepOut                      "   Step out of current function scope

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" -----------------
"  Folding
" -----------------

" See the after ftplugin section

" Set folding to indent
set foldmethod=indent

" Only fold up to two
" set foldnestmax=2

" Start totally unfolded
set foldlevelstart=99

" -----------------
"  NERDTree
" -----------------

" Set width to slightly smaller
let g:NERDTreeWinSize=25

" Start on load (but not in diff mode)
if !(&diff)
  " autocmd VimEnter * NERDTree | wincmd p
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


" -------------------
"  SQL
" -------------------
" stop sql plugin from remaping <C-c>
let g:ftplugin_sql_omni_key = '<C-q>'

" ---------------------
"  CtrlP Configuration
" ---------------------

" Override default
" let g:ctrlp_map = '<c-p>'

" Overrride command name
" let g:ctrlp_cmd = 'CtrlP'




" -----------------
"  Helper Commands
" ----------------

" reload .vimrc 
nnoremap <C-F5> :source $HOME/.vim/.vimrc<CR>


" force reload all tabs (for after git checkouts)
nnoremap <F5> :tabdo e!<CR>


" shortcut for help in a new tab
nnoremap <leader>h :tab help 

" Load arpeggio here
call arpeggio#load()

" print/console-log shortcut
" function g:InsertLog()
"   if &filetype ==# 'javascript'
"     normal! iconsole.log()
"     startinsert
"   elseif &filetype ==# 'python'
"     normal! iprint()
"     startinsert
"   endif
" endfunction
" 
" nnoremap <C-B> <ESC>:call g:InsertLog()<CR>
" inoremap <C-B> <ESC>:call g:InsertLog()<CR>

" Insert lines above or below
"  mnemonic: "Return Over" and "Return Below"
Arpeggio nnoremap ro O<esc>j^
Arpeggio nnoremap rb o<esc>k^


" Close tabs and write them
function g:CloseTab()
  if tabpagenr('$') == 1
    q
  else
    tabclose
  endif
endfunction

function g:WriteCloseTab()
  w
  if tabpagenr('$') == 1
    q
  else
    tabclose
  endif
endfunction
"  mnemonic "Quit Tab" and "Write and quit Tab" and "Open Tab"
Arpeggio nnoremap qt :call<space>g:CloseTab()<CR>
Arpeggio nnoremap wt :call<space>g:WriteCloseTab()<CR>
Arpeggio nnoremap ot :tabe<space>


" ----------
"  Snippets
" ----------

" nnoremap <leader>p :-1read $HOME/.vim/snippets/print.js<CR>f(la

" source ~/.vim/scripts/printify.vim
" noremap <C-p> :call Printify()<CR>



" ---------------------------
"   Node.js specific helpers
" ---------------------------

" empty arrow function
autocmd FileType javascript nnoremap <leader>ae i() => {}<ESC>i

" arrow around word
autocmd FileType javascript nnoremap <leader>aaw ciw() => {}<ESC>F)Pf{a

" arrow around visual selection
autocmd FileType javascript vnoremap <leader>aa c() => {}<ESC>F)Pf{a

autocmd FileType javascript nnoremap <leader>t :!npm run test<CR>

" ---------------------------
"   Git tooling
" ---------------------------




