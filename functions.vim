function! s:BabelCompile(startline, endline)
  let src = bufnr('%')

  if !exists("b:babel_compile_buf") || bufwinnr(b:babel_compile_buf) == -1
    belowright new
    let buf = bufnr('%')
    setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile nomodifiable
    nnoremap <buffer> <silent> q :hide<CR>
    exec 'silent! file [BabelCompile ' . src . ']'
    exec bufwinnr(src) 'wincmd w'
    let b:babel_compile_buf = buf
  endif

  let input = join(getline(a:startline, a:endline), "\n")
  let filename = expand('%:p')
  let output = system('bin/babel -f ' . filename . ' 2>&1', input)

  exec bufwinnr(b:babel_compile_buf) 'wincmd w'
  setlocal modifiable
    silent exec '% delete _'
    silent put! =output
    silent exec '$ delete _'
  setlocal nomodifiable

  if v:shell_error
    setlocal filetype=
  else
    setlocal filetype=javascript
  endif

  exec bufwinnr(src) 'wincmd w'
endfunction

command! -range=% -bar -nargs=0 BabelCompile call s:BabelCompile(<line1>, <line2>)
