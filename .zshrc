#start timer
zmodload zsh/datetime
start=$EPOCHREALTIME

#the sauce
source ~/.profile
source ~/.aliases
source ~/.zsh/history.zsh
source ~/.zsh/.iterm2_shell_integration.zsh
source ~/.zsh/gpg.zsh
source ~/.zsh/fasd.zsh
source ~/.zsh/theme-and-appearance.zsh
source ~/.zsh/bullet-train.zsh
source ~/.zsh/set-title-tab.zsh
source ~/.zsh/zsh-256color/zsh-256color.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
source ~/.zsh/zsh-history-substring-search/history-substring-search.zsh

#end timer
dur=$(echo "$EPOCHREALTIME - $start" | bc)
echo "Execution time: $dur seconds"

if test "$CASE_SENSITIVE" = true; then
  unset HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS
fi

if test "$DISABLE_COLOR" = true; then
  unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
  unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
fi