#export path ----------------------------------------------
export PATH="$PATH"

#Terminal styling ----------------------------------------------
#change prompt colors and configure prompt to "username@host:cwd $"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

#change ls colors
LSCOLORS=ExFxBxDxCxegedabagacad

#Defaults ----------------------------------------------
#default editor
export EDITOR="/usr/local/Cellar/nano/2.7.0/bin/nano"

#Aliases here ----------------------------------------------
#terminal convenience
alias ls="ls -lFG"
alias cp="cp -v"
alias mv="mv -v"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias f="open -a Finder ./"
alias clear="clear && archey && ls"
alias oldcd=original-cd
alias cd=cd-with-ls
alias mkdir=make-dir

#networking
alias myip="curl ip.appspot.com" #gets public ip

#system
alias clnDS="oldcd ~ && find . -type f -name '*.DS_Store' -ls -delete"
alias clnLC="oldcd ~ && find . -type f -name '*.localized' -ls -delete"
alias cln="clnDS; clnLC"
alias finderShowHidden="defaults write com.apple.finder ShowAllFiles TRUE"
alias finderHideHidden="defaults write com.apple.finder ShowAllFiles FALSE"
alias src-bp="source ~/.bash_profile" #reloads bash profile

#so pretty
alias archey="archey -c"

#Functions ----------------------------------------------
#cd + ls
cd-with-ls() { builtin cd "$@"; ls; }

#original cd
original-cd() { builtin cd "$@"; }

#mkdir with extra options and cd into new dir
make-dir(){ command mkdir -pv "$@" && cd -P "$@"; }

#One command to extract most know archives
extract() {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#Auto run on terminal opening ----------------------------------------------
archey
ls
