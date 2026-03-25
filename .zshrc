export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
export CLICOLOR_FORCE=1

export EDITOR="$( (which nvim &> /dev/null && echo nvim) || echo vim )"
export HISTSIZE='500'
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL='ignoreboth'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

PATH="${HOME}/.local/bin:${HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:${HOME}/go/bin:${HOME}/.npm-packages/bin:${HOME}/.local/share/gem/ruby/3.3.0/bin:$PATH"

bindkey -e
bindkey \^U backward-kill-line

alias vim='nvim'

alias c=cd

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."

alias la="ls -lhaF --color=auto"
alias lla="ls -lhaF --color=auto"
alias ll="ls -l --color=auto"
alias ls="ls --color=auto"
alias l="ls --color=auto"

alias disk="cd /mnt/DATA"

playlist_time() {
for f in *.mp4; do
  ffprobe -v error -show_entries format=duration \
  -of default=nw=1:nk=1 "$f"
done | awk '{s+=$1} END {printf "%02d:%02d:%02d\n",s/3600,(s%3600)/60,s%60}'
}

# export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:tw=30;42:ow=34;42:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:tw=30;04:ow=34;04:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"

PATH="/home/mabona3/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mabona3/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mabona3/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mabona3/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mabona3/perl5"; export PERL_MM_OPT;

eval "$(/bin/starship init zsh)"

# kanagawa color
~/shell/padded_logo ~/shell/logo.txt `echo -e '\e[38;2;195;64;67m'`

# # rose pine
# ~/shell/padded_logo ~/shell/logo.txt `echo -e '\e[38;2;49;72;143m'`

# ~/shell/padded_logo ~/shell/logo.txt

# tput sgr0
