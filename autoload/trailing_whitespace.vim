" Remove trailing white space, see https://vi.stackexchange.com/a/456/15292
function! trailing_whitespace#Strip() abort
  let l:save = winsaveview()
  " vint: next-line -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  keeppatterns %s/\v\s+$//e
  call winrestview(l:save)
endfunction

function! trailing_whitespace#refresh() abort
  if index(g:trailing_whitespace_exclude_filetypes, &filetype) != -1
    return
  endif

  " should delete old match highlight and re-highlight if text is changed.
  " Otherwise, highlight may be misplaced.
  call trailing_whitespace#clear_highlight()

  let b:trailing_whitespace_pos = []
  for i in range(1, line('$'))
    let linetext = getline(i)

    let idx = match(linetext, '\v\s+$')
    if idx == -1
      continue
    endif

    " col index should starts from 1, however match() is 0-indexed.
    let col = idx + 1
    let w = len(linetext) - col + 1
    call add(b:trailing_whitespace_pos, [i, col, w])
  endfor

  call matchaddpos('TrailingWhitespace', b:trailing_whitespace_pos)
endfunction

function! trailing_whitespace#clear_highlight() abort
  let l:match_ids = []
  for l:el in getmatches()
    if l:el.group == 'TrailingWhitespace'
      call add(l:match_ids, l:el.id)
    endif
  endfor

  for _id in l:match_ids
    call matchdelete(_id)
  endfor
endfunction

