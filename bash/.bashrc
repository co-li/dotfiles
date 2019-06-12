# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
source '/usr/share/fzf/shell/key-bindings.bash'

export EDITOR='nvim'
export VISUAL=$EDITOR
export PAGER='less'
export GOPATH='/home/kingofinfo/Code/go'
export CLASSPATH='/usr/share/java/junit.jar:/usr/share/java/hamcrest/core.jar:.'

alias ls='exa'
alias vim='nvim'
alias gb='git branch'
alias gc='git commit'
alias gch='git checkout'
alias gp='git push'
alias gpr='git pull --rebase'
alias fuck='sudo $(history -p \!\!)'
alias junit='java org.junit.runner.JUnitCore'
alias bat='acpi'
alias vuln='grep . /sys/devices/system/cpu/vulnerabilities/*'

