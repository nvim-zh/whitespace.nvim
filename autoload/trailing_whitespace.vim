function! trailing_whitespace#should_skip() abort
  " skip some files
  if !&modifiable || !&buflisted || &bufhidden != '' || &buftype != ''
    return v:true
  endif

  if index(g:trailing_whitespace_exclude_filetypes, &filetype) != -1
    return v:true
  endif
endfunction

" Remove trailing white space, see https://vi.stackexchange.com/a/456/15292
function! trailing_whitespace#Strip() abort
  if trailing_whitespace#should_skip()
    return
  endif

  let l:save = winsaveview()
  " vint: next-line -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  keeppatterns %s/\v\s+$//e
  call winrestview(l:save)
endfunction

function! trailing_whitespace#refresh() abort
  if trailing_whitespace#should_skip()
    return
  endif

  " should delete old match highlight and re-highlight if text is changed.
  " Otherwise, highlight may be misplaced.
  call trailing_whitespace#clear_highlight(v:false)

  for i in range(1, line('$'))
    " getline() is 1-index
    let linetext = getline(i)

    let idx = match(linetext, '\v\s+$')
    if idx == -1
      continue
    endif

    let l:line = i-1
    " col index should starts from 1, however match() is 0-indexed.
    let l:col_start = idx
    let l:col_end = -1

    call nvim_buf_add_highlight(0, g:TrailingWhitespace_ns, "TrailingWhitespace", l:line, l:col_start, l:col_end)
  endfor
endfunction

" @cur_line_only: whether to clear the highlight for current line only
function! trailing_whitespace#clear_highlight(cur_line_only) abort
  if !a:cur_line_only
    let l:line_start = 0
    let l:line_end = -1
  else
    let l:line_start = line('.') - 1
    let l:line_end = l:line_start + 1
  endif

  call nvim_buf_clear_namespace(0, g:TrailingWhitespace_ns, l:line_start, l:line_end)
endfunction
