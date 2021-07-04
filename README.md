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
Which can be finished off with the Vim command:
```vim
 :PluginInstall
 :VimspectorInstall debugpy
```
Then:
```bash
 $ cd bundle/vimspector
 $ python3 install_gadget.py --force-enable-node
```


Also, get yourself some sweet (ctags action)[https://andrew.stwrt.ca/posts/vim-ctags/]:
```bash
 $ sudo apt install ctags
```
Then modify the path in the `--options=/path/to/.vim/ctags/modern-js` and run:
```bash
$ cp .ctags.example ~/.ctags
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

Also add this to your `~/.config/git/ignore` file:
```
*.swp
tags
tags.lock
```
which will allow gutentags to make tags EVERYWHERE and they won't get tracked by git


# .vimrc.reduced setup
```bash
git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"
```
