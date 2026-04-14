# Description

The plugin can show and remove trailing whitespaces.

# Install

+ [vim-plug][vim-plug-github]: `Plug 'jdhao/whitespace.nvim'`
+ [lazy.nvim][lazy-nvim-github]:
```lua
  { "jdhao/whitespace.nvim", event = "VeryLazy" },
```

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

<!-- References -->
[lazy-nvim-github]: https://github.com/folke/lazy.nvim
[vim-plug-github]: https://github.com/junegunn/vim-plug
