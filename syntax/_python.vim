" Vim syntax file
" Language: python

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


" ---------------
"    Special
" --------------



" -----------------------
"      Builtin types
" -----------------------
" ints
syntax match pyNumber '\<\d\+\>'
" floats
syntax match pyNumber '\<\d\+\.\d*\>'
syntax match pyNumber '\<\d\+\.\?\d*[eE][+-]\?\d\+\>'
" Boolean
" syntax match pyBoolean '\<\(True\|False\)\>'
syntax keyword pyBoolean False True
syntax keyword pyNone None


" syntax region pyBlock start="{" end="}" fold transparent contains=celNumber,celBlockCmd

" syntax keyword pyBlockCmd Mass Distance AbsMag nextgroup=pyNumber skipwhite


" -------------------
"     Composites
" -------------------
syntax region pyFuncDef start='def ' end='(' contains=pyFuncName
syntax match pyFuncName '\<[A-Za-z0-9_]\+\>' contained

" --------------------
"      Keywords
" --------------------

" Uniary Operators
syntax keyword pyUniaryOps assert async await del global nonlocal not 
syntax keyword pyUniaryOps import lambda

" Binary Operators
syntax keyword pyBinaryOps and as from in is or

" Block initiators
syntax keyword pyBlockDec class def
syntax keyword pyBlockDec if elif except with  
syntax keyword pyBlockDec for
syntax keyword pyBlockDec try while else finally

" Flow controllers
syntax keyword pyFlowCont break continue pass
syntax keyword pyFlowCont yield return raise



" -------------------
"     Comments
" -------------------
" Add comments with #
syn keyword pyTodo contained TODO FIXME XXX NOTE
syn match pyComment "#.*$" contains=pyTodo




" ----------------------
"     Finishing up
" ----------------------
" Set highlighing
let b:current_syntax = "python"

hi def link pyCOmment         Comment
hi def link pyTodo            Todo
hi def link pyUniaryOps       Statement
hi def link pyBinaryOps       Statement
hi def link pyBlockDec        Statement
hi def link pyFLowCont        Statement
hi def link pyNumber          Constant
hi def link pyBoolean         Type
hi def link pyNone            Type
hi def link pyFuncName        Type
