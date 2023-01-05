" autoload/winzoz.vim

function! winzoz#goZoZ() abort
  redraw
  exe 'echohl ' . g:winzoz_style
  let columns = &columns
  try
    echo s:make_status_line(expand('%:p'), columns)
    let key = ''
    while key !=# "\<Esc>"
      let [key, l:count] = s:get_count_and_key(g:Winzoz_getchar)
      let key = s:one_more_key_after_g(g:Winzoz_getchar, key)
      execute "normal! \<c-w>" . l:count . key
      redraw
      echo s:make_status_line(expand('%:p'), columns)
    endw
    echo ''
    redraw
  finally
    echohl None
  endtry
endfunction

function! s:strip_ctrl(key) abort
  let s:ctrl_map = {
        \ "\<C-G>": "g",
        \ "\<C-H>": "h",
        \ "\<C-J>": "j",
        \ "\<C-K>": "k",
        \ "\<C-L>": "l",
        \ "\<C-N>": "n",
        \ "\<C-S>": "s",
        \ "\<C-V>": "v",
        \ "\<C-W>": "w",
        \ "\<C-X>": "x",
        \ }
  if has_key(s:ctrl_map, a:key)
    return s:ctrl_map[a:key]
  else
    return a:key
  endif
endfunction

function! s:get_count_and_key(getkey) abort
  let l:count = ""
  let key = s:strip_ctrl(a:getkey())
  while key =~ "[0-9]"
    let l:count .= key
    let key = a:getkey()
  endw
  return [key, l:count]
endfunction

function! s:one_more_key_after_g(getkey, key) abort
  let key = a:key
  if key ==# 'g' || key ==# "\<C-g>"
    let key = join([key, a:getkey()], '')
  endif
  return key
endfunction

function! s:make_status_line(path, columns) abort
  let space = a:columns - len(a:path)
  if space >= 0
    return a:path . repeat(' ', space - 1)
  else
    let space *= -1
    let space += 2
    let components = split(a:path, '/', 1)
    for index in range(len(components))
      let complen = len(components[index]) - 2
      let reduction = 0
      if complen >= 1
        if space > complen
          let reduction = complen
          let space -= complen - 1
        else
          let reduction = space
          let space = 0
        endif
        if reduction > 0
          let components[index] = components[index][0] . "…" . components[index][reduction + 1:]
        endif
      endif
    endfor
    let path = join(components, '/')
    return path . repeat(' ', space - 1)
  endif
endfunction
