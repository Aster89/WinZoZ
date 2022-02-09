" plugin/winzoz.vim

if (exists('g:winzoz_disable') && g:winzoz_disable) || &compatible
  finish
endif

nnoremap <silent> <Plug>(go-zoz-navigation) :<C-U>call winzoz#goZoZ()<CR>

if !exists('g:winzoz_statusline_hl_group')
  let g:winzoz_statusline_hl_group = 'Search'
endif

if !exists('g:winzoz_no_mappings')
  nmap <silent> <leader>w <Plug>(go-zoz-navigation)
endif

" https://vi.stackexchange.com/questions/36732/when-was-getcharstr-introduced-and-how-could-i-have-found-the-answer-my-self
if v:versionlong >= 8022957
  let g:Winzoz_getchar = {-> getcharstr()}
else
  let g:Winzoz_getchar = {-> nr2char(getchar())}
endif
