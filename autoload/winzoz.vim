" autoload/winzoz.vim

function! winzoz#goZoZ() abort
  redrawstatus!
  exe 'echohl ' . g:winzoz_statusline_hl_group
  try
    echo s:make_status_line()
    let key = ''
    while key !=# "\<Esc>"
      let [key, l:count] = s:get_count_and_key(s:strip_ctrl(nr2char(getchar())))
      let key = s:g_takes_one_more_key(key)
      execute "normal! \<c-w>" . l:count . key
      echo ''
      redrawstatus!
      echo s:make_status_line()
    endw
    echo ''
    redrawstatus!
  finally
    echohl None
  endtry
endfunction

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

function! s:strip_ctrl(key) abort
  if has_key(s:ctrl_map, a:key)
    return s:strip_ctrl[a:key]
  else
    return a:key
  endif
endfunction

function! s:get_count_and_key(key) abort
  let l:count = ""
  let key = a:key
  while key =~ "[0-9]"
    let l:count .= key
    let key = nr2char(getchar())
  endw
  return [key, l:count]
endfunction

function! s:g_takes_one_more_key(key) abort
  let key = a:key
  if key ==# 'g' || key ==# "\<C-g>"
    let key = join([key, nr2char(getchar())], '')
  endif
  return key
endfunction

function! s:make_status_line() abort
  let text = 'Go WinZoZ'
  let text .= repeat(' ', (&columns - len(text))/2)
  return repeat(' ', &columns - len(text) - 1) .  text
endfunction
