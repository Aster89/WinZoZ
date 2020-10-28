" plugin/winzoz.vim

if (exists('g:winzoz_disable') && g:winzoz_disable) || &compatible
  finish
endif

nnoremap <silent> <Plug>(go-zoz-navigation) :call winzoz#goZoZ()<cr>

if !exists('g:winzoz_statusline_hl_group')
  let g:winzoz_statusline_hl_group = 'Search'
endif

if !exists('g:winzoz_no_mappings')
  nmap <silent> <leader>w <Plug>(go-zoz-navigation)
endif
