export GPG_TTY=$(tty)
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

if [[ "$(uname)" == "Darwin" ]]; then
	export PATH=$PATH:/opt/homebrew/bin:$HOME/Library/Python/3.9/bin
elif [[ "$(uname)" == "Linux" ]]; then
	source $HOME/.atuin/bin/env
fi

plugins=(
	git
	asdf
	sudo
	kubectl
	gpg-agent
	web-search
	virtualenv
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# do not edit this file. put files in the dir below.
for FN in $HOME/.local/zshrc.d/*.sh; do
	source $FN
done

# initialize atuin
eval "$(atuin init zsh --disable-up-arrow)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit && compinit
