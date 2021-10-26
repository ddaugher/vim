# VIM Config

## To install

```sh
ln -s ~/whereveryouputit ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

vim +PlugInstall +qall
```

## Install ElixirLS

Get the latest elixir-ls release from [here](https://github.com/elixir-lsp/elixir-ls/releases/tag/v0.7.0) and unzip it into ~/.vim/plugged/coc-elixir/els-release 
```
unzip elixir-ls.zip -d ~/.vim/plugged/coc-elixir/els-release
```

## Per user config

To have your very own custom vimrc additions or custom gvimrc just create these files ala:

    touch ~/.vim/custom_vimrc
    touch ~/.vim/custom_gvimrc

Then, sprinkle to taste with your defaults, undoing my craziness, etc.  These files are ignored by git and enable fun for all.

## On first run

If you see errors, but this is just Vim complaining about not having the plugins it wants installed.   Simply run:

    :PlugInstall
