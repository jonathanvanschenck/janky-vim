function! Printify()
  let ft = &filetype
  if ft == "javascript"
    " execute ":i<CR>console.log(``)<ESC>"
    " execute ":normal f(la"
    execute ":-1read $HOME/.vim/snippets/print.js"
    execute ":normal f(2l"
    execute ":startinsert"
  elseif ft == "python"
    " a
  else
    echo "No print available for this file type"
  endif
endfunction
