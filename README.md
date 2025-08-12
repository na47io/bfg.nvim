# black forest gateau

<img width="3116" height="1992" alt="image" src="https://github.com/user-attachments/assets/bec4fd16-975b-455e-ac48-079441d3ada6" />

A minimal, calming Neovim colorscheme with muted greens and yellows. Inspired by Jonathan Blow's programming environment - to me it means taking programming seriously. Nothing is more serious than a [Black Forest Gateau](https://en.wikipedia.org/wiki/Black_Forest_gateau).

## installation

using Neovim 0.12 built-in plugin manager `vim-pack`:

```lua
vim.pack.add({
  "https://github.com/na47io/bfg.nvim",
})

require "bfg".setup({
    -- optional configuration here
})

vim.cmd("colorscheme bfg")
```

using `lazy.nvim`:

```lua
{
  'yourusername/bfg.nvim',
  config = function()
    require('bfg').setup()
    vim.cmd('colorscheme bfg')
  end,
}
```

using `packer.nvim`:

```lua
use {
  'yourusername/bfg.nvim',
  config = function()
    require('bfg').setup()
    vim.cmd('colorscheme bfg')
  end
}
```

## Default Configuration

```lua
require('bfg').setup({
  terminal_colors = true,
  transparent_mode = true,
  italic = {
    comments = true,
    strings = false,
  },
  bold = false,
  palette_overrides = {},
  overrides = {},
})
```

## Extras

Additional configurations for other applications can be found in the `extras/` folder:

- **ghostty** - Terminal emulator theme
- **tmux** - Status line configuration  
- **lazygit** - Git TUI theme

## Contributing

Pull requests are welcome! Feel free to submit themes for additional applications, improvements to the existing colorscheme, or bug fixes.

---

Thanks to [vague2k](https://github.com/vague2k) for inspiration and a repository template.
