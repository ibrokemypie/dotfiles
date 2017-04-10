#! zsh

#tmux
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

#start timer
zmodload zsh/datetime
start=$EPOCHREALTIME

# which os
if [ "$(uname -s)" = "Darwin" ]; then
    #if mac
    scripts=(${scripts[@]} $HOME/.zsh/profileOSX )
else
    #if not
    scripts=(${scripts[@]} $HOME/.zsh/profileUNIX )
fi

#common sources
scripts=(
    ${scripts[@]}
    $HOME/.zsh/aliases
    $HOME/.zsh/history.zsh
    $HOME/.zsh/gpg.zsh
    $HOME/.zsh/fasd.zsh
    $HOME/.zsh/theme-and-appearance.zsh
    $HOME/.zsh/git.zsh
    $HOME/.zsh/bullet-train.zsh
    #source $HOME/.zsh/set-title-tab.zsh
    $HOME/.zsh/zsh-256color/zsh-256color.plugin.zsh
    $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    $HOME/.zsh/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
    $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
)

#sauce me up
for s in "${scripts[@]}"; do
    source "$s"
done

#end timer
dur=$(echo "$EPOCHREALTIME - $start" | bc)
echo "Execution time: $dur seconds"