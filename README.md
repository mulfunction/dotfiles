# dotfiles

My personal dotfiles for CachyOS / KDE Plasma, managed with [chezmoi](https://www.chezmoi.io/).

---

## What's included

- Shell config (fish)
- KDE Plasma settings (panel, shortcuts, window manager, theme)
- App configs (`~/.config`)
- Package list (`pkglist.txt` for pacman, `aurlist.txt` for AUR)

---

## Fresh install on a new machine

```fish
sudo pacman -S chezmoi git
chezmoi init --apply https://github.com/mulfunction/dotfiles.git
bash ~/.local/share/chezmoi/install.sh
```

That's it. The `install.sh` script will:
1. Install all pacman packages from `pkglist.txt`
2. Install AUR packages from `aurlist.txt` via `paru`
3. Apply all dotfiles via `chezmoi apply`

---

## Updating dotfiles (on main machine)

After changing a config file, re-sync it into chezmoi and push:

```fish
chezmoi re-add ~/.config/fish/config.fish   # or whichever file changed
cd ~/.local/share/chezmoi
git add .
git commit -m "describe what changed"
git push
```

## Pulling updates (on other machine)

```fish
chezmoi update
```

This pulls from GitHub and applies changes in one step.

---

## Updating the package list

Run this whenever you install new packages you want to track:

```fish
pacman -Qqe > ~/.local/share/chezmoi/pkglist.txt
pacman -Qqm > ~/.local/share/chezmoi/aurlist.txt
cd ~/.local/share/chezmoi
git add pkglist.txt aurlist.txt
git commit -m "update package list"
git push
```

---

## Key files tracked

| File | What it controls |
|------|-----------------|
| `~/.config/fish/config.fish` | Fish shell config & aliases |
| `~/.config/plasma-org.kde.plasma.desktop-appletsrc` | Panel layout & widgets |
| `~/.config/kwinrc` | Window manager rules |
| `~/.config/kglobalshortcutsrc` | Custom keyboard shortcuts |
| `~/.config/kdeglobals` | Global KDE theme |
| `~/.config/plasmarc` | Plasma appearance |

---

## Adding a new config file to track

```fish
chezmoi add ~/.config/APPNAME/config
cd ~/.local/share/chezmoi
git add .
git commit -m "add APPNAME config"
git push
```

---

## Repo layout

```
~/.local/share/chezmoi/
├── dot_config/
│   ├── fish/
│   └── ...
├── pkglist.txt
├── aurlist.txt
├── install.sh
└── README.md
```

---

## Dependencies

- [`chezmoi`](https://www.chezmoi.io/) — dotfile manager
- [`paru`](https://github.com/Morganamilo/paru) — AUR helper (must be installed before running `install.sh`)
- `git` — obviously
