# .dotfiles

### Install prerequisite
`sudo apt install git stow zsh vim`

### Clone with submodules

```
# ssh
git clone --recurse-submodules --single-branch git@github.com:KunHCS/.dotfiles.git
# http
git clone --recurse-submodules --single-branch https://github.com/KunHCS/.dotfiles.git
```

### Stow (create symlink)
```
cd .dotfiles
stow -v */
```
