#! zsh

#tmux
# case $(tty) in /dev/tty[0-9]*)
	# if [ $SSH_TTY ]; then
		# tmux attach -t $(tmux ls | grep -v attached | head -1 | cut -f1 -d:) || tmux
	# fi
# esac
# if [ -z $SSH_TTY ]; then
	# case $(tty) in /dev/tty[0-9]*)
		# [ -z $TMUX ] && (tmux attach -t $(tmux ls | grep -v attached | head -1 | cut -f1 -d:) || tmux)
	# esac
# fi

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
    #$HOME/.zsh/gpg.zsh
    $HOME/.zsh/fasd.zsh
    #$HOME/.zsh/theme-and-appearance.zsh
    #$HOME/.zsh/git.zsh
    #$HOME/.zsh/bullet-train.zsh
    #source $HOME/.zsh/set-title-tab.zsh
    $HOME/.zsh/zsh-256color/zsh-256color.plugin.zsh
    $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    $HOME/.zsh/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
    $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
)

export PATH=$PATH:~/.config/Color-Scripts/color-scripts:~/thingo/go/bin
export GOPATH=$HOME/thingo/go

prompt() {
    PS1="$(powerline-rs --modules time,host,user,cwd,perms,git,gitstage --shell zsh $?)"
}
precmd_functions+=(prompt)

#sauce me up
for s in "${scripts[@]}"; do
    source "$s"
done

#end timer
dur=$(echo "$EPOCHREALTIME - $start" | bc)
echo "Execution time: $dur seconds"

