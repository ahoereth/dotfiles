# START OH MY ZSH
export ZSH=/Users/shoeffner/.oh-my-zsh
export ZSH_THEME="my_custom"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export UPDATE_ZSH_DAYS=7
ENABLE_CORRECTION="true"
plugins=(git brew gem npm compleat mvn pip python vi-mode wd venv zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# remove arguments in argument list from auto completion
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
setopt histignorealldups
setopt histignorespace
# zsh-completions via compleat
autoload -Uz compinit bashcompinit
compinit
bashcompinit
source /usr/local/share/x86_64-osx-ghc-8.0.1/compleat-1.0/compleat_setup
# END OH MY ZSH

# START ENV
export PATH="/usr/local/sbin:$PATH"
export MAVEN_OPTS="-Xmx1024m"
export EDITOR="/usr/local/bin/vim"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# END ENV

# BEGIN ALIASES
eval "$(thefuck --alias)"
alias json='python -m json.tool | ccat'
alias findershow="defaults write com.apple.finder AppleShowAllFiles YES && echo \"Alt-Click on Finder and relaunch!\""
alias finderhide="defaults write com.apple.finder AppleShowAllFiles NO && echo \"Alt-Click on Finder and relaunch!\""
alias gitst='git status -sb'
# END ALIASES


# START vim mode
bindkey -v
export KEYTIMEOUT=0.01
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^r' history-incremental-search-backward
# END vim mode


# START FUNCTIONS
# git checkout commit before date (thanks @ahoereth)
git-checkout-before() {
    git checkout `git rev-list -n 1 --before="$1" $2`
}

# compiles tex projects with bibtex
pdfcomp() {
    pdflatex $1.tex && bibtex $1 && pdflatex $1.tex && pdflatex $1.tex && open $1.pdf
}

# epoch time
epoch() {
    date +'%s'
}

# from http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized, thanks @ahoereth
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# END FUNCTIONS

