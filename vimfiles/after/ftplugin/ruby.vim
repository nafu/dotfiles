nmap <buffer> <C-CR> :call <SID>Eval(function("<SID>YankNormal"))<CR>
vmap <buffer> <C-CR> :call <SID>EvalVisual()<CR>

execute 'ruby vim_bind = binding'

function! s:Eval(Yank)
  let s:saved_reg = @"
  call a:Yank()
  execute 'ruby begin; p eval(%q(' . @" . '), __vim_bind); rescue ScriptError, StandardError => e; puts e.message;end'
  let @" = s:saved_reg
endfunc

function! s:EvalVisual() range
  call <SID>Eval(function("<SID>YankVisual"))
endfunc

function! s:YankVisual()
  silent normal `<v`>y
endfunc

function! s:YankNormal()
  silent normal yy
endfunc
