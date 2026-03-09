#!/usr/bin/env bash

export EDITOR="$( (which nvim &> /dev/null && echo nvim) || echo vim )"

# export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:tw=30;42:ow=34;42:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:tw=30;04:ow=34;04:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

export HISTSIZE='500'
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL='ignoreboth'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export LESS_TERMCAP_md="${yellow}"
# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'
export GOPATH=${HOME}/go

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Include user specific binaries
PATH="${HOME}/.local/bin:${HOME}/bin::/usr/local/go/bin:${GOPATH}/bin:${HOME}/.npm-packages/bin:${HOME}/.local/share/gem/ruby/3.3.0/bin:${HOME}/.cargo/bin:$PATH"

alias vim='nvim'

alias c="cd"
alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."
alias .....="c ../../../.."
alias ......="c ../../../../.."
alias .......="c ../../../../../.."
alias ........="c ../../../../../../.."
alias .........="c ../../../../../../../.."

colorflag=--color=always
alias la=" ls -lhaF ${colorflag}"
alias lsd=" ls -lF ${colorflag} | grep --color=never '^d'"
alias grep="grep --color=auto"
alias ll=" ls -l ${colorflag}"
alias ls=" ls ${colorflag}"
alias l=" ls ${colorflag}"
alias lla=" ls -la ${colorflag}"

# git aliases

alias gcl='git clone'
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias glog="git --no-pager log --decorate --graph --pretty=format:'%C(auto)%h %d %s %C(green)(%cr) %C(blue)[%an <%ae>]'"
shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell
for option in autocd globstar
do
    shopt -s "${option}" 2> /dev/null
done

eval "$(/bin/starship init bash --print-full-init)"

# kanagawa color
~/shell/padded_logo ~/shell/logo.txt `echo -e '\e[38;2;195;64;67m'`

# # rose pine
# ~/shell/padded_logo ~/shell/logo.txt `echo -e '\e[38;2;49;72;143m'`
