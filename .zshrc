# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000000000000
SAVEHIST=10000000000000

setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nomatch
setopt notify
setopt numericglobsort
setopt promptsubst

setopt append_history
setopt no_extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

bindkey -e
bindkey ' ' magic-space
bindkey '^U' backward-kill-line
bindkey '^[[3;9~' kill-word       # Alt+Delete (Option+Delete kills word on Mac Terminal by default)
bindkey '^[f' forward-word        # Option+f moves forward word (Meta-f)
bindkey '^[b' backward-word       # Option+b moves backward word (Meta-b)

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
zmodload zsh/complist
compinit -C
# End of lines added by compinstall

WORDCHARS=${WORDCHARS//\/}

setopt AUTO_MENU
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'r:|[._-]=* r:|=*'
zstyle ':completion:*' group-name ''

# Descriptions / messages
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{magenta}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches --%f'

# File and directory colors for zsh completion and ls.
export CLICOLOR=1
export LSCOLORS='Exfxcxdxcxdadahbadacag'
export LS_COLORS='di=38;5;147:fi=38;5;15:ln=38;5;213:pi=38;5;221:so=38;5;208:bd=38;5;214;1:cd=38;5;172;1:or=30;41:mi=05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=38;5;118;1:*.sh=38;5;118;1:*.zsh=38;5;118;1:*.py=38;5;148:*.js=38;5;220:*.ts=38;5;81:*.json=38;5;179:*.md=38;5;223:*.txt=38;5;250:*.log=38;5;245:*.pkg=38;5;208;1:*.dmg=38;5;208;1:*.app=38;5;123;1:*.zip=38;5;203:*.tar=38;5;203:*.gz=38;5;203:*.tgz=38;5;203:*.xz=38;5;203:*.bz2=38;5;203:*.7z=38;5;203:*.jpg=38;5;176:*.jpeg=38;5;176:*.png=38;5;176:*.gif=38;5;176:*.webp=38;5;176:*.svg=38;5;176:*.mp3=38;5;179:*.wav=38;5;179:*.flac=38;5;179:*.mp4=38;5;135:*.mkv=38;5;135:*.mov=38;5;135'

# Process listing enhancement
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,%cpu,%mem,cmd'
# Colors for zsh completion lists
zstyle ':completion:*' list-colors \
  '*.app(|/)=38;5;123;1' \
  'di=38;5;147' \
  'fi=38;5;15' \
  'ln=38;5;213' \
  'pi=38;5;221' \
  'so=38;5;208' \
  'bd=38;5;214;1' \
  'cd=38;5;172;1' \
  'or=30;41' \
  'mi=05;37;41' \
  'su=37;41' \
  'sg=30;43' \
  'tw=30;42' \
  'ow=34;42' \
  'st=37;44' \
  'ex=38;5;118;1' \
  '*.sh=38;5;118;1' \
  '*.zsh=38;5;118;1' \
  '*.py=38;5;148' \
  '*.js=38;5;220' \
  '*.ts=38;5;81' \
  '*.json=38;5;179' \
  '*.md=38;5;223' \
  '*.txt=38;5;250' \
  '*.log=38;5;245' \
  '*.pkg=38;5;208;1' \
  '*.dmg=38;5;208;1' \
  '*.app=38;5;123;1' \
  '*.zip=38;5;203' \
  '*.tar=38;5;203' \
  '*.gz=38;5;203' \
  '*.tgz=38;5;203' \
  '*.xz=38;5;203' \
  '*.bz2=38;5;203' \
  '*.7z=38;5;203' \
  '*.jpg=38;5;176' \
  '*.jpeg=38;5;176' \
  '*.png=38;5;176' \
  '*.gif=38;5;176' \
  '*.webp=38;5;176' \
  '*.svg=38;5;176' \
  '*.mp3=38;5;179' \
  '*.wav=38;5;179' \
  '*.flac=38;5;179' \
  '*.mp4=38;5;135' \
  '*.mkv=38;5;135' \
  '*.mov=38;5;135'

PROMPT='$ '

if (( $+commands[gls] )); then
  ls() {
    if [[ -t 1 ]]; then
      command gls --color=always "$@" | perl -pe 's/\e\[38;5;147m([^\e\n]+\.app)(?=\e\[0m)/\e[38;5;123;1m$1/g'
    else
      command gls --color=never "$@"
    fi
  }
fi

# Zinit
source /opt/homebrew/opt/zinit/zinit.zsh

# Autosuggestions
zinit ice wait"0" lucid
zinit light zsh-users/zsh-autosuggestions

# Git completions
zinit ice wait"0" lucid as"completion"
zinit light git/git

# Docker completions
zinit ice wait"0" lucid as"completion"
zinit light docker/cli

zinit ice wait"0" lucid as"completion"
zinit light docker/compose

zinit ice wait"0" lucid
zinit light zsh-users/zsh-completions

# Fast syntax highlighting (must be last, still turbo)
zinit ice wait"0" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

. "$HOME/.local/bin/env"
