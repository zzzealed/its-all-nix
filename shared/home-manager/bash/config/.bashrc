set -o vi

alias cat="bat" # uutils/coreutils still doesn't have syntax highlighting for cat

alias zellij="zellij --layout compact"
#eval "$(zellij setup --generate-auto-start bash"

alias cp="uutils-cp --interactive --progress"
alias mv="uutils-mv --interactive --progress"
alias rm="uutils-rm --interactive=always"
