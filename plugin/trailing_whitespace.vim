let g:trailing_whitespace_exclude_filetypes = get(g:, "trailing_whitespace_exclude_filetypes",
      \ ['alpha', 'git', 'floggraph', 'dashboard'])

" highlight namespace for this plugin
let g:TrailingWhitespace_ns = nvim_create_namespace("TrailingWhitespace")

highlight TrailingWhitespace ctermbg=red guibg=red

augroup trailing_space
  autocmd!
  autocmd FileType,InsertLeave,TextChanged * call trailing_whitespace#refresh()
  autocmd InsertEnter * call trailing_whitespace#clear_highlight(v:true)
augroup END

command! -nargs=0 StripTrailingWhitespace call trailing_whitespace#Strip()
