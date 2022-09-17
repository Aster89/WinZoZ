vim9script noclear

import autoload 'winzoz.vim'

if (exists('g:winzoz_disable') && g:winzoz_disable) || &compatible
  finish
endif

if !exists('g:winzoz_style')
  g:winzoz_style = 'Search'
endif

if !exists('g:winzoz_trigger')
  g:winzoz_trigger = '<leader>w'
endif

if !exists('g:Winzoz_make_status_line_text')
  g:Winzoz_make_status_line_text = () => expand('%:p')
endif

nnoremap <silent> <Plug>(go-zoz-navigation) :<C-U>call <SID>winzoz.Run()<CR>

execute 'nmap <silent> ' .. g:winzoz_trigger .. ' <Plug>(go-zoz-navigation)'
