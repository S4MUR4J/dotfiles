# 🛠️ S4MUR4J's Dotfiles

This repository contains my personal dotfiles to set up development environment across **Windows**, **Arch Linux**, **macOS**. Repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks.

---

## Requirements

- [Git](https://git-scm.com/) - Windows / Linux / macOS
- [GNU Stow](https://www.gnu.org/software/stow/) - Linux / macOS

## Tools to install  

- [Chocolatey](https://chocolatey.org/) - Windows
- [Homebrew](https://brew.sh/) - macOS
- [Wezterm](https://wezterm.org/) - Windows / Linux / macOS
- [NeoVIM](https://neovim.io/) - Windows / Linux / macOS

## Creating symlinks  

On windows use custom script

```pwsh

```

On macOS and Linux use GNU Stow to create symlinks.

```bash
stow .
```

trzeba tylko zrobić lazy sync i zainstalować gcc