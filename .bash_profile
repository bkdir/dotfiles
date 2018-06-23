for DOTFILE in `find ~/bin/dotfiles/bash`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done
