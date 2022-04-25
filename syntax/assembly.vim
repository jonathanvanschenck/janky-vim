" Vim syntax file
" Language: 6502 Assembly
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

syntax match assemblyImmediate '#\$[0-9A-F]\{2\}'
syntax match assemblyByte '\$[0-9A-F]\{2\}'
syntax match assemblyWord '\$[0-9A-F]\{4\}'

" syntax region assemblyDescBlock start="{" end="}" fold transparent contains=assemblyNumber,assemblyBlockCmd
" syntax keyword assemblyBlockCmd RA Dec SpectralType nextgroup=assemblyNumber skipwhite
" syntax keyword assemblyBlockCmd Mass Distance AbsMag nextgroup=assemblyNumber skipwhite


" Add comments with #
" syn keyword assemblyTodo contained TODO FIXME XXX NOTE
" syn match assemblyComment "\;.*$" contains=assemblyTodo
syn match assemblyComment "\;.*$"

syntax keyword assemblyOpcode  ADC AND ASL BIT CMP CPX CPY DEC EOR INC LSR ORA ROL ROR SBC
syntax keyword assemblyOpcode  JMP JSR
syntax keyword assemblyOpcode  LDA LDX LDY STA STX STY
syntax keyword assemblyOpcode  BRK RTI RTS
syntax keyword assemblyOpcode  NOP
syntax keyword assemblyOpcode  BPL BMI BVC BVS BCC BCS BNE BEQ
syntax keyword assemblyOpcode  CLC SEC CLI SEI CLV CLD SED
syntax keyword assemblyOpcode  TAX TXA DEX INX TAY TYA DEY INY TXS TSX
syntax keyword assemblyOpcode  PHA PLA PHP PLP

syntax match assemblyLabel '^[a-z]\+'
syntax keyword assemblySpecialLabel main zero

syntax match assemblyWhiteSpaceError '^  .*'
syntax match assemblyWhiteSpaceError '^ [a-z].*'

" Set highlighing
let b:current_syntax = "assembly"

hi def link assemblyTodo       Todo
hi def link assemblyComment    Comment 
hi def link assemblyImmediate  Identifier
hi def link assemblyByte       Constant
hi def link assemblyWord       Constant
hi def link assemblyOpcode     Statement
hi def link assemblyLabel      Special
hi def link assemblySpecialLabel    Type
hi def link assemblyWhiteSpaceError Error
