# Janky-VIM
This is just a repo to track all my janky vim hacks. Feel free to steal whatever you want.

# Setup
Why in the world does vim come on ubuntu, but not, like, a fully featured version? Make sure your vim version has `clipboard` functionality:
```vim
:echo has('clipboard')
```
if that returns a `0`, you need a better version of vim:
```bash
 $ sudo apt-get install vim-gtk3
```

Needs `vim >= 8`, so that you can stick this in your `.bashrc` allowing the .vimrc file to be global:
```
export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'  #or any other location you want
```

Vundle is your friend
```bash
 $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```


Also, get yourself some sweet (ctags action)[https://andrew.stwrt.ca/posts/vim-ctags/]:
```bash
 $ sudo apt install ctags
```
For which you'll need to periodically run:
```bash
 $ ctags --recurse=yes --exclude=.git --exclude=node_modules/* --exclude=venv/*
```
to dump your generated tags into the .git folder. Or just use `\tag` in normal mode.

# Git config
Use vimdiff for git:
```bash
 $ git config --global diff.tool vimdiff
 $ git config --global --add difftool.prompt false # suppress confirmation
```
