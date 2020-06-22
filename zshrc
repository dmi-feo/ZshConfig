# Path to your oh-my-zsh configuration.
ZDOTDIR=$HOME/.zsh.d
ZSH=$ZDOTDIR/oh-my-zsh
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

PYTHONPATH="./.pip:$PYTHONPATH"

HISTCONTROL=ignoreboth:erasedups
HISTFILE=$ZDOTDIR/zsh_history

autoload -U compinit
compinit
setopt CORRECT_ALL

ZSH_THEME="ys"

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

if [[ $TERM == "xterm" || $TERM == "screen" ]]
then
	export TERM="xterm-256color"
fi

export HOMEBREW_NO_EMOJI=True
export LSCOLORS="Dxfxcxdxcxegedabagacad"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh.aliases

if [ ! -d "$HOME/bin" ] ; then
    mkdir -p $HOME/bin
fi
if [ ! -d "$HOME/.pip" ] ; then
    mkdir -p $HOME/.pip
fi

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/.local/bin:~/bin


CONFIGHOST="$HOME/.zsh.d/`hostname`"
if [ -d $CONFIGHOST ] ; then
	[ -f $CONFIGHOST/zshrc ] && source $HOME/.zsh.d/`hostname`/zshrc
	[ -f $CONFIGHOST/zsh.aliases ] && source $HOME/.zsh.d/`hostname`/zsh.aliases
fi

export LANG=en_US.UTF-8

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '$HOME/yandex-cloud/path.bash.inc' ]; then source '$HOME/yandex-cloud/path.bash.inc'; fi

source $HOME/.ya.completion/zsh/arc
