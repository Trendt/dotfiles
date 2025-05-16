> [!WARNING]
> Do not trust anything that is stated here and instead look up how [GNU stow][stow] works :)

[stow]: https://www.gnu.org/software/stow/

# Usage:

```sh
git clone git@github.com:Trendt/dotfiles.git $HOME/dotfiles;

cd $HOME/dotfiles;

stow <module> --adopt;
git reset --hard
```

# Module specific
## zsh
1. Install [oh-my-zsh][ohmyzsh]: 
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
2. Use `stow`



[ohmyzsh]: https://github.com/ohmyzsh/ohmyzsh

# TODO
* nvim config
* tmux-sessionizer
