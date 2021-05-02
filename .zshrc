# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
export TERM_PROGRAM="/Users/joehannes/.cargo/bin/alacritty"
export TERM_PROGRAM_VERSION="0.7.2"

# GO packages path
export GOPATH=/Users/joehannes/go

# default web browser for stuff like ddgr, googler
export BROWSER=$(which google-chrome-stable)

# JAVA_HOME
export JAVA_HOME=/Library/Java/JavaVirtualMachines/default/Contents/Home

# Ruby gems path
export GEMPATH=/Users/joehannes/.gem/ruby/latest

# If you come from bash you might have to change your $PATH.
export PATH=/home/linuxbrew/.linuxbrew/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$JAVA_HOME/bin:$GEMPATH/bin:$GOPATH/bin:/Users/joehannes/Library/Python/3.9/bin:$PATH
export FPATH=/home/linuxbrew/.linuxbrew/share/zsh/site-functions:$FPATH
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  export FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/joehannes/.oh-my-zsh

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
  git git-flow git-extras github git-hubflow ssh-agent compleat npm zsh-completions history history-substring-search tig copybuffer copydir copyfile dash fancy-ctrl-z sudo taskwarrior tmux tmuxinator zsh-navigation-tools zsh-autosuggestions zsh-peco-history ubuntu vi-mode z zsh-wakatime gpg-agent fasd jump gnu-utils zsh-interactive-cd zsh_reload
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
alias chrome="$(which google-chrome-stable) --remote-debugging-port=9222"
alias hack="/home/linuxbrew/.linuxbrew/bin/nvim"

txq() {
	tmuxinator stop $1;
}

# unmerited favor king of kings
ufkk() {
  tmuxinator start "חישמה עושי";
}

ufkkq() {
  tmuxinator stop "חישמה עושי";
}

~() {
	cd ~/.local/$1/
}

eval "$(hub alias -s)"

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
source /Users/joehannes/.oh-my-git/prompt.sh

# tmuxinator completion
source ~/.local/bin/tmuxinator.zsh

# gtm plugin
source ~/.local/bin/gtm-plugin.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use --silent default

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rvm/bin:$PATH"
source ~/.rvm/scripts/rvm
rvm use 3.0.0 --default

# $:404 => echo "... brief status code explanation"
source ~/.local/bin/http_status_codes.zsh

eval "$(fasd --init auto)"

export MAD_PATH=~/.manu-pages/md

# ZPlug Section

source $HOME/.zplug/init.zsh

if ! zplug check; then
    zplug install
fi

zplug "modules/prompt", from:prezto
zplug "psprint/zsh-select"
zplug "b4b4r07/enhancd"

if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
fi

zplug "tmux-plugins/tmux-yank"
zplug "wfxr/tmux-fzf-url"

zplug "facetframer/zshnip"
zplug "kutsan/zsh-system-clipboard"

if zplug check kutsan/zsh-system-clipboard; then
  typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
fi

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
[ -f /Users/joehannes/.config/cani/completions/_cani.zsh ] && source /Users/joehannes/.config/cani/completions/_cani.zsh
