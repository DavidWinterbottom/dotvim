#Installation

###On linux/macOS

```shell
cd ~
git clone https://github.com/DavidWinterbottom/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

cd ~/.vim
git submodule init
git submodule update
```

###On Windows

```shell
cd %HOMEPATH%
git clone https://github.com/DavidWinterbottom/dotvim.git vimfiles

cd vimfiles
git submodule init
git submodule update
```
