" write over default tabs
setlocal shiftwidth=2
setlocal softtabstop=2


" setlocal foldmethod=indent
" setlocal foldexpr=JSFolds()

" let s:count=0
" let s:max=0
" function JSFolds()
"   let thisline = getline(v:lnum)
"   if thisline =~? '\v^\s*$'
"     return '-1'
"   endif
"   
"   if thisline =~? '[{]\s*$'
"     let s:count+=1
"   elseif thisline =~? '\v^\s*[}][\s);]*$'
"     let s:count-=1
"   endif
"   if s:count > 2
"     let s:count =2
"   endif
"   return s:count " indent(v:lnum) / &shiftwidth
" endfunction

" Only fold up to two
" setlocal foldnestmax=2

" Start totally unfolded
" setlocal foldlevelstart=9
