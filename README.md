# ohmyzsh-key-bindings

This repository exports key bindings of [Oh My Zsh][1]
as a standalone zsh plugin that you can install using zplug, antigen/antibody or
with no bundler at all.

**Why?** I don't want to use the bulky Oh My Zsh for only a few features.

## Features

* <kbd>PageUp</kbd> / <kbd>PageDown</kbd>  
  navigate history up/down line-by-line
* <kbd>↑</kbd> / <kbd>↓</kbd>  
  fuzzy find input line in history
* <kbd>Control</kbd>+<kbd>r</kbd>  
  search history backwards incrementally
* <kbd>Home</kbd> / <kbd>End</kbd>  
  go to beginning/end of input line
* <kbd>Control</kbd>+<kbd>←</kbd> / <kbd>Control</kbd>+<kbd>→</kbd>  
  move cursor one word forward/backward
* <kbd>Shift</kbd>+<kbd>Tab</kbd>  
  navigate completion menu backwards
* <kbd>Control</kbd>+<kbd>x</kbd>, then <kbd>Control</kbd>+<kbd>e</kbd>  
  edit the currently input line in `$EDITOR`
* <kbd>Esc</kbd>, then <kbd>w</kbd>  
  erase from cursor to the beginning of the line
* <kbd>Esc</kbd>, then <kbd>l</kbd>  
  run `ls`
* <kbd>Esc</kbd>, then <kbd>m</kbd>  
  copy previous word (helpful for file renaming)

## Install

### [Oh My Zsh][1]

You don't need to do anything. These keybindings are included with Oh My Zsh.

### [Antibody][2]

In your .zshrc:

```zsh
antibody bundle NickKaramoff/ohmyzsh-key-bindings
```

Or, if you use static loading, add `NickKaramoff/ohmyzsh-key-bindings` to your
.txt-file with plugins.

### [Antigen][3]

In your .zshrc:

```zsh
antigen bundle NickKaramoff/ohmyzsh-key-bindings
```

### [zplug][4]

```zsh
zplug "NickKaramoff/ohmyzsh-key-bindings", use:"ohmyzsh-key-bindings.zsh"
```

### [zgen][5]

```zsh
zgen load "NickKaramoff/ohmyzsh-key-bindings"
```

### [zinit][6]

```zsh
zinit ice depth=1; zinit load "NickKaramoff/ohmyzsh-key-bindings"
```

### Manual

```zsh
git clone --depth=1 https://github.com/NickKaramoff/ohmyzsh-key-bindings.git ~/.ohmyzsh-key-bindings
echo 'source ~/ohmyzsh-key-bindings/ohmyzsh-key-bindings.zsh' >>! ~/.zshrc
```

## License

This repository is licensed under the MIT License and uses code copied and/or
derived from [ohmyzsh/ohmyzsh][1], which is as well licensed under the
MIT License.

[1]: https://github.com/ohmyzsh/ohmyzsh
[2]: https://github.com/getantibody/antibody
[3]: https://github.com/zsh-users/antigen
[4]: https://github.com/zplug/zplug
[5]: https://github.com/tarjoilija/zgen
[6]: https://github.com/zdharma/zinit
