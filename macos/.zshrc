export CLICOLOR=1

#Aliases
alias l='ls -alh'
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias grep='grep --color=auto'
alias gs='git status'
alias sch='cd /Users/arshguntakal/Documents/UT_Work/Fall2024/'

# Add git branch name to right hand side of the prompt, add colors
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1) /p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}%# '

source <(fzf --zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
