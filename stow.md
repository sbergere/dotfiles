# GNU Stow

[Stow Manual](https://www.gnu.org/software/stow/manual/)

## Layout

Example layout:

- `bash/.bashrc`
- `git/.gitconfig`
- `nvim/.config/nvim/init.lua`

From the dotfiles directory, stowing `bash` will symlink `bash/.bashrc` to `~/.bashrc`.

Here we are not bothering creating individual packages for each tool, we are just putting everything in the root. Might change later if this becomes unmanageable.

## Common usage

Run commands from the root of the dotfiles repo:

If stowing all at once:

```sh
stow .
```

Or by package:

```sh
stow bash
stow git
stow nvim
```

## Useful commands

Stow a package:

```sh
stow <package>
```

Restow after changes:

```sh
stow -R <package>
```

Unstow a package:

```sh
stow -D <package>
```

Preview without changing anything:

```sh
stow -n -v <package>
```

Choose a target directory explicitly:

```sh
stow -t "$HOME" <package>
```
