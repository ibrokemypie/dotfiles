#EXPORTS
export EDITOR=nano
export VISUAL=nano
export BUILD_MAC_SDK_EXPERIMENTAL=1

#PATHS
PATH=":~/bin:/usr/local/bin:/usr/local/sbin:/Applications/Wine Staging.app/Contents/Resources/wine/bin:$PATH"
fpath=(/usr/local/share/zsh-completions $fpath)

#ZSH STLES
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle :compinstall filename '/Users/Conor/.zshrc'
zstyle ':completion:*' menu select

if test "$CASE_SENSITIVE" = true; then
  unset HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS
fi

if test "$DISABLE_COLOR" = true; then
  unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
  unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
fi


autoload -Uz compinit
compinit
autoload edit-command-line
zle -N edit-command-line

#KEYS
bindkey '^X^e' edit-command-line
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
