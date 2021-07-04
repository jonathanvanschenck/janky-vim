" Vim syntax file
" Language: Celestia Star Catalog
" Adapted from https://vim.fandom.com/wiki/Creating_your_own_syntax_files

" Bail if a previous file has already defined syntax
if exists("b:current_syntax")
  finish
endif

" Declare Keyword
" syntax keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2
" Declare Matches
" syntax match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite
" Declare Regions
" syntax region syntaxElementRegion start='x' end='y'

syntax match celNumber '\d\+'
syntax match celNumber '[-+]\d\+'
syntax match celNumber '[-+]?\d\+\.\d*'

syntax region celDescBlock start="{" end="}" fold transparent contains=celNumber,celBlockCmd

syntax keyword celBlockCmd RA Dec SpectralType nextgroup=celNumber skipwhite
syntax keyword celBlockCmd Mass Distance AbsMag nextgroup=celNumber skipwhite


" Add comments with #
syn keyword celTodo contained TODO FIXME XXX NOTE
syn match celComment "#.*$" contains=celTodo



" Set highlighing
let b:current_syntax = "cel"

hi def link celTodo       Todo
hi def link celBlockCmd   Statement
hi def link celNumber     Constant
