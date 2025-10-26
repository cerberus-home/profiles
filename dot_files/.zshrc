export PATH="/opt/homebrew/opt/python@4.14/libexec/bin:$PATH"

# --- Custom Terminal ---
# Custom prompt
PROMPT="%F{red}┌─[%m]─[%F{yellow}$(ipconfig getifaddr en0)%f]─[%F{blue}%n@%m%f]─[%F{green}%~%f]
%F{red}└──➤ %f"

# man with colors
man() {
  env \
  LESS_TERMCAP_mb=$'\e[01;31m' \
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}

# --- Zsh History Configuration ---
# Location of your history file
HISTFILE=~/.zsh_history
# Number of commands to keep in memory during the session
HISTSIZE=1000
# Number of commands to save in the history file
SAVEHIST=1000
# Avoid duplicates and store timestamps
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY  # Save timestamps with history
# Append to history file (don't overwrite)
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME  # Write history immediately
# Share history across all open shells
setopt SHARE_HISTORY

