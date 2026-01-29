# .bashrc

# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default bluearchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/bluearchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# opencode
export PATH=/home/dehoej/.opencode/bin:$PATH
