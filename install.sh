set -x 
export DOTFILES=$HOME/projects/dotfiles

FILES="ackrc screenrc zsh/zshrc vim/vimrc vim git/gitconfig git/gitignore git/gitattributes"

for i in $FILES; do
  rm -rf $HOME/.`basename $i`
  ln -s $DOTFILES/$i $HOME/.`basename $i`
done

pushd $DOTFILES && git submodule init && git submodule update
ln -s $DOTFILES/zsh/nsmith.zsh-theme $DOTFILES/zsh/oh-my-zsh/themes/
popd
