" File              : whitespace.vim
" Author            : lu5her <lu5her@mail>
" Date              : Wed Dec, 04 2024, 11:28 339
" Last Modified Date: Wed Dec, 04 2024, 11:28 339
" Last Modified By  : lu5her <lu5her@mail>
" -----
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <F5>   m`:TrimSpaces<CR>``
vnoremap <F5>   :TrimSpaces<CR>
