BACKUP_DIR="$HOME/dotfiles/_backup_dotfiles"
mkdir -p $BACKUP_DIR

# if ! [ -e "$HOME/.zprezto" ]; then
#   git clone --recursive https://github.com/sorin-ionescu/prezto.git \
#     "$HOME/.zprezto"
#   setopt EXTENDED_GLOB

#   for rcfile in "$HOME/.zprezto/runcoms/^README.md(.N)"; do
#     ln -s "$rcfile" "$HOME/.${rcfile:t}"
#   done
#   rm "$HOME/.zshrc"
# fi

if [ -e "$HOME/.zshrc" ]; then
  echo "backup of zshrc …"
  mv "$HOME/.zshrc" $BACKUP_DIR
fi

if [ -e "$HOME/.tmux.conf" ]; then
  echo "backup of tmux conf …"
  mv "$HOME/.tmux.conf" $BACKUP_DIR
fi

if [ -e "$HOME/.config/nvim" ]; then
  echo "backup of init.vim …"
  mv "$HOME/.config/nvim" $BACKUP_DIR
fi

ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"

if ! [ -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
