mkdir -p .vim/colors
curl -fLo .vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm

