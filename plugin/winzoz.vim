" plugin/winzoz.vim

if (exists('g:winzoz_disable') && g:winzoz_disable) || &compatible
  finish
endif

nnoremap <silent> <Plug>(go-zoz-navigation) :<C-U>call winzoz#goZoZ()<CR>

if !exists('g:winzoz_style')
  let g:winzoz_style = 'Search'
endif

if !exists('g:winzoz_trigger')
  let g:winzoz_trigger = '<leader>w'
endif

execute 'nmap <silent> ' . g:winzoz_trigger . ' <Plug>(go-zoz-navigation)'

" https://vi.stackexchange.com/questions/36732/when-was-getcharstr-introduced-and-how-could-i-have-found-the-answer-my-self
if v:versionlong >= 8022957
  let g:Winzoz_getchar = {-> getcharstr()}
else
  let g:Winzoz_getchar = {-> nr2char(getchar())}
endif
