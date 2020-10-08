# .bashrc

export PS1="\[\033[0;35m\]\n\w (\t) \n\[\033[0m\][\[\033[0;34;48m\]\u@\[\033[0;31;48m\]\h\[\033[0m\]]$ "

alias xterm='xterm -bg black -fg green -sl 3000'
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -a'
alias lt='ls -ltr'
alias gl='git log'
alias grep='grep --exclude tags --color -s'
alias ack='ack-grep'
alias pylint='pylint --reports=n --rcfile=~/.pylintrc --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}"'
#alias ssh='ssh -X'
alias ctags='/usr/bin/ctags'
alias gvim='/Applications/MacVim.app/Contents/bin/mvim'

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/opt/go/libexec/bin

export LD_LIBRARY_PATH=/usr/local/lib

if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
fi

alias x="xdg-open"

parse_git_branch ()
{
  git branch 2> /dev/null | grep '*' | sed 's#*\ \(.*\)#(git: \1)#'
}
parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

# Add git and svn branch names
export PS1="$PS1\$(parse_git_branch)\$(parse_svn_branch) "


