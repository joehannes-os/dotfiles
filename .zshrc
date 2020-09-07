export TERM="screen-256color"

# GO packages path
export GOPATH=/home/joehannes/go

# default web browser for stuff like ddgr, googler
export BROWSER=/usr/bin/lynx

# JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/default-java

# Ruby gems path
export GEMPATH=/home/joehannes/.gem/ruby/latest

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.linuxbrew/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$JAVA_HOME/bin:$GEMPATH/bin:$GOPATH/bin:$PATH
export FPATH=$HOME/.linuxbrew/share/zsh/site-functions:$FPATH
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  export FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/joehannes/.oh-my-zsh

# Wakatime
export ZSH_WAKATIME_PROJECT_DETECTION=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(public_ip dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='magenta'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='cyan'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern url)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git git-flow git-extras github git-hubflow ssh-agent compleat npm zsh-completions history history-substring-search tig copybuffer copydir copyfile dash fancy-ctrl-z sudo taskwarrior tmux tmuxinator zsh-navigation-tools zsh-autosuggestions zsh-peco-history zsh-select ubuntu vi-mode zsh-vimode-visual z zsh-wakatime zsh-syntax-highlighting gpg-agent
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshcfg="nvim ~/.zshrc"
alias nvimcfg="nvim ~/.config/nvim/init.vim"
alias ohmybugcfg="nvim ~/.config/bugwarrior/bugwarriorrc"
alias ohmytmuxcfg="nvim ~/.tmux.conf.local"
alias ohmymux="txs regular"
alias ohmymutt="nvim ~/.neomuttrc"

i() {
  sudo apt-get install $1;
}

s() {
  apt search $1;
}

txq() {
	tmuxinator stop $1;
}

~() {
	cd ~/.local/$1/
}

eval "$(hub alias -s)"

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
source /home/joehannes/.oh-my-git/prompt.sh

# tmuxinator completion
source ~/.local/bin/tmuxinator.zsh

# gtm plugin
source ~/.local/bin/gtm-plugin.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use --silent default

