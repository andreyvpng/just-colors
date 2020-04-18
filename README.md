Just-Colors
===========

Just-Colors is easy and lighweight way to change colors

# Installing

```bash
git clone \
  https://github.com/andreyvpng/just-colors \
  ~/.config/just-colors/

chmod +x ~/.config/just-colors/just-colors

ln -s $HOME/.config/just-colors/just-colors /bin/just-colors  
```

# Usage

```
usage: just-colors [options]

  Options:
    --theme [name of theme]
    --no-apply
    --reload
```

run command:

```bash
just-colors --theme default-dark
```

This generate configurations for tty and Xresorces with default-dark theme (in ~/.config/just-colors/cache), also you can add own themes and templates

# Apply theme

For linux terminal, add in your ~/.zshrc or ~/.bashrc this line

```bash
($HOME/.config/just-colors/cache/tty.sh)
```

For Xresources, add in your ~/.xinitrc this line

```bash
xrdb -merge -quiet -I$HOME ~/.config/just-colors/cache/colors.Xresources
```

For qutebrowser, you can use [this](https://gist.github.com/andreyvpng/62291eee5df64fb700b33f66eb2ec0ed) solution

For GTK, you can use [Oomox](https://github.com/themix-project/oomox). Oomox generates GTK theme using Xresources

If you have not found a solution for your favorite program, you can solve it yourself by creating a new template (in ~/.config/just-colors/templates/)
