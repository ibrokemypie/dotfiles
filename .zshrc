#start timer
zmodload zsh/datetime
start=$EPOCHREALTIME

# Detect distribution
if [ "$(uname -s)" = "Darwin" ]; then
    IS_MACOS=true
else
    IS_MACOS=false
fi

#common sauce
source ~/.zsh/history.zsh
source ~/.zsh/gpg.zsh
source ~/.zsh/fasd.zsh
source ~/.zsh/theme-and-appearance.zsh
source ~/.zsh/git.zsh
source ~/.zsh/bullet-train.zsh
source ~/.zsh/set-title-tab.zsh
source ~/.zsh/zsh-256color/zsh-256color.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

if [ $IS_MACOS = true ]; then
# mac sauce
	source ~/.zsh/profileOSX
	source ~/.zsh/aliasesOSX
	source ~/.zsh/iterm2_shell_integration.zsh
else
#non-mac sauce
	source ~/.zsh/profileUNIX
	source ~/.zsh/aliasesUNIX
fi

#end timer
dur=$(echo "$EPOCHREALTIME - $start" | bc)
echo "Execution time: $dur seconds"
