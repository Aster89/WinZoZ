vim9script noclear

const GetChar = () => getcharstr()

export def Run(): void
  redraw
  exe 'echohl ' .. g:winzoz_style
  const columns = &columns
  try
    echo MakeStatusLine(g:Winzoz_make_status_line_text(), columns)
    var key = ''
    var count = ''
    while key !=# "\<Esc>"
      [count, key] = GetCountAndKey(GetChar)
      key = OneMoreKeyAfterG(GetChar, key)
      execute "normal! \<c-w>" .. count .. key
      redraw
      echo MakeStatusLine(g:Winzoz_make_status_line_text(), columns)
    endwhile
    echo ''
    redraw
  finally
    echohl None
  endtry
enddef

const ctrl_map = {
      \ "\<C-G>": 'g',
      \ "\<C-H>": 'h',
      \ "\<C-J>": 'j',
      \ "\<C-K>": 'k',
      \ "\<C-L>": 'l',
      \ "\<C-N>": 'n',
      \ "\<C-S>": 's',
      \ "\<C-V>": 'v',
      \ "\<C-W>": 'w',
      \ "\<C-X>": 'x',
      \ }

def IndexOrDefault(map: dict<any>, key: any, default: any): any
  if has_key(map, key)
    return map[key]
  else
    return default
  endif
enddef

def GetCountAndKey(GetKey: func(): string): list<string>
  var count = ''
  const key_ = GetKey()
  var key = IndexOrDefault(ctrl_map, key_, key_)
  while key =~ '[0-9]'
    count ..= key
    key = GetKey()
  endwhile
  return [count, key]
enddef

def OneMoreKeyAfterG(Getkey: func(): string, key: string): string
  var keys = key
  if keys ==# 'g' || keys ==# "\<C-g>"
    keys = join([keys, Getkey()], '')
  endif
  return keys
enddef

def MakeStatusLine(path: string, columns: number): string
  var space = columns - len(path)
  if space >= 0
    return path .. repeat(' ', space - 1)
  else
    space *= -1
    space += 2
    var components = split(path, '/', 1)
    for index in range(len(components))
      const complen = len(components[index]) - 2
      var reduction = 0
      if complen >= 1
        if space > complen
          reduction = complen
          space -= complen - 1
        else
          reduction = space
          space = 0
        endif
        if reduction > 0
          components[index] = components[index][0] .. '…' .. components[index][reduction + 1 : ]
        endif
      endif
    endfor
    const path2 = join(components, '/')
    return path2 .. repeat(' ', space - 1)
  endif
enddef
