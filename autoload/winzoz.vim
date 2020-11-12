" autoload/winzoz.vim

function! winzoz#goZoZ() abort
  redrawstatus!
  exe 'echohl ' . g:winzoz_statusline_hl_group
  try
    echo s:make_status_line()
    let key = ''
    while key !=# "\<Esc>"
      let key = nr2char(getchar())
      if key ==# 'g' || key ==# "\<C-g>"
        let key = join([key, nr2char(getchar())], '')
      endif
      execute "normal! \<c-w>" . key
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

function! s:make_status_line() abort
  let text = 'Go WinZoZ'
  let text .= repeat(' ', (&columns - len(text))/2)
  return repeat(' ', &columns - len(text) - 1) .  text
endfunction
