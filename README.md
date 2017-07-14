# ibrokemypie's dotfiles

use ./install from within $DOTFILES to 
* check existance of each file in  $DOTFILES in ~/
* check whether each existing file is symlink
* if not symlink, move to new directory dotfiles_old, renaming duplicates
* if not symlink, make symlink to file in $DOTFILES

to add any dotfiles,

1.  move the file into $DOTFILES 
2.  run ./install (or just ln -s ~/.file $DOTFILES/.file) 
3.  git add .
4.  git pull
5.  git commit -a -m "message here"
6.  git push

keep any private certificates out of this, eg in ~/.certs/ which you would not link to $DOTFILES