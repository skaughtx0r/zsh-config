export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0C0 '
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0C2 '
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\UE0C8 '
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\UE0CA '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{white}%K{blue}%} $user_symbol%{%b%f%k%F{blue}%}\UE0C0 %{%f%}"
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$%f "
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="╰─$ "
# MULTILINE_LAST_PROMPT_PREFIX="$ "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time virtualenv)

DEFAULT_USER=$(whoami)
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github colorize colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## never ever beep ever
setopt NO_BEEP

#. ~/.iterm2_shell_integration.`basename $SHELL`

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# # Directory info.
local current_dir='${PWD/#$HOME/~}'

# # Autosuggest
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# # Git info.
# local git_info='$(git_prompt_info)'
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} on%{$reset_color%} git:%{$fg[cyan]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
# ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"

# # Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
# PROMPT="
# %{$fg_bold[magenta]%}%n%{$reset_color%}\
# %{$fg_no_bold[yellow]%}@\
# %{$fg_bold[blue]%}$(box_name)%{$reset_color%} \
# %{$fg[yellow]%}in \
# %{$fg_bold[green]%}${current_dir}%{$reset_color%}\
# ${git_info}
# %{$fg_bold[red]%}ᗈ %{$reset_color%}"

# RPROMPT="%{$fg_bold[yellow]%} -- %*  %W -- %{$reset_color%}"


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

fpath=(/usr/local/share/zsh-completions $fpath)
rm -f ~/.zcompdump; compinit -u

# Load my aliases/functions:
. ~/.aliases
. ~/.functions

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/texbin:$HOME/bin
export PATH

export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:$HOME/.npm-global/lib/node_modules
