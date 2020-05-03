#!/bin/zsh

# Source:
# https://github.com/ohmyzsh/ohmyzsh/blob/95aa9bd97b9fb2a57f355178b2c5f01eb72ad0b6/lib/key-bindings.zsh

# See more:
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi


# Use Emacs' key bindings
bindkey -e

# [Esc] [w] - remove text from the cursor to the beginning of command
bindkey '\ew' kill-region

# [Esc] [l] - run `ls`
bindkey -s '\el' 'ls\n'

# [Ctrl]-[r] - search history backwards incrementally for an input string.
#              The string may begin with ^ to anchor the search to the beginning
#              of the line.
bindkey '^r' history-incremental-search-backward

# Navigate history with [PageUp]/[PageDown]
if [[ "${terminfo[kpp]}" != "" ]]; then
  # [PageUp] - Up a line of history
  bindkey "${terminfo[kpp]}" up-line-or-history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  # [PageDown] - Down a line of history
  bindkey "${terminfo[knp]}" down-line-or-history
fi

# Fuzzy find in history with [UpArrow]/[DownArrow] for an input string
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  # start typing + [UpArrow] to fuzzy find in history forwards
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  # start typing + [DownArrow] to fuzzy find in history backwards
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Navigate line with [Home]/[End]
if [[ "${terminfo[khome]}" != "" ]]; then
  # [Home] - go to beginning of line
  bindkey "${terminfo[khome]}" beginning-of-line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  # [End] - go to end of line
  bindkey "${terminfo[kend]}"  end-of-line
fi

# [Space] - do history expansion
bindkey ' ' magic-space

# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete char backwards (as you'd expect)
bindkey '^?' backward-delete-char

# [Delete] - delete char forwards
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# [Ctrl-x] [Ctrl-e] - Edit the currently input line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# [Esc] [m] - copy previous word (helpful for file renaming)
bindkey "^[m" copy-prev-shell-word

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#