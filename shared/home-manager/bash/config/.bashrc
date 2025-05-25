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

# Zellij stuff
eval "$(zellij setup --generate-auto-start bash)"

# Other
alias ls="eza"
alias cat="bat" # uutils/coreutils still doesn't have syntax highlighting for cat
alias grep="rg"
alias du="dust"
alias cp="uutils-cp --interactive --progress"
alias mv="uutils-mv --interactive --progress"
alias rm="uutils-rm --interactive=always"
