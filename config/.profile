#export TERMINAL=roxterm
#export TERMINAL=terminator
#export TERMINAL=sakura
export TERMINAL=urxvt
#export TERMINAL="gnome-terminal"

# Detachable cmus
# alias cmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus)"'
# alias cmus='screen -q -r -D cmus || screen -S cmus $(which cmus)'

# Path MSX
PATH=$PATH:~/MSX/bin

# vim + todoman alias
alias vim='vim --servername vim'
alias todoman='todo'


# El tiempo
alias wsan='curl wttr.in/"San Vicente de la Barquera"'
alias wbar='curl wttr.in/Barcelona'
