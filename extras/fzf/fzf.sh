# fzf color scheme for bfg theme
# Add this to your .zshrc or .bashrc

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='
  --color=fg:#C2BDA1,bg:#022B2B,hl:#37C8BC
  --color=fg+:#C2BDA1,bg+:#213131,hl+:#90E0D6
  --color=info:#6b8b6b,prompt:#90E0D6,pointer:#3fdf1f
  --color=marker:#3fdf1f,spinner:#6b8b6b,header:#90E0D6
  --preview-window=border-sharp
'
export BAT_THEME='bfg'
