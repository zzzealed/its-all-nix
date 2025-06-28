# the/goat
set -o vi

# Yazi stuff
alias yazi="TERM=xterm-kitty yazi"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Aliases
alias ls="ls --color=always --indicator-style=slash"
alias rm="rm --verbose --interactive=once"
# I use uutils-coreutils for cp and mv because of their `--progress` option.
alias cp="uutils-cp --verbose --interactive --progress"
alias mv="uutils-mv --verbose --interactive --progress"
alias cat="bat" # Syntax highlighting for output
alias grep="rg"
alias du="dust"
