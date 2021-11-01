# Description

The plugin can show and remove trailing whitespaces.

# Install

+ [packer.nvim](https://github.com/wbthomason/packer.nvim): `use {'jdhao/whitespace.nvim', event = 'VimEnter'}`
+ [vim-plug](https://github.com/junegunn/vim-plug): `Plug 'jdhao/whitespace.nvim'`

# Usage

Works out of the box.

To trim trailing whitespaces, run command `:StripTrailingWhitespace`.

# Configuration

To disable showing trailing whitespaces on certain file types, customize the
variable `g:trailing_whitespace_exclude_filetypes`:

```vim
let g:trailing_whitespace_exclude_filetypes = ['alpha', 'git']
```

# License

This plugin is released under the MIT License.
