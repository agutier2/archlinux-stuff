#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}


[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc
 
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
 

 
# Default lang 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8 


# Enable vim mode
# set -o vi # Set in inputrc

# Load profile
source ~/.profile

# SSHFS aliases
alias mountbsc="sshfs bscdc-login:/home/agutierrez ~/mnt/bscdc"
alias umountbsc="fusermount -u ~/mnt/bscdc"

# Acroread
# https://hub.docker.com/r/chrisdaish/acroread/
alias acroreadCreate="docker run  -v $HOME/Documents:/home/acroread/Documents:rw \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -e uid=$(id -u) \
            -e gid=$(id -g) \
            -e DISPLAY=unix$DISPLAY \
             --name acroread \
            chrisdaish/acroread"

alias acroread="docker start acroread"

alias :q="exit"


# psql colors
#   From: https://simply.name/yet-another-psql-color-prompt.html

export YELLOW=`echo -e '\033[1;33m'`
export LIGHT_CYAN=`echo -e '\033[1;36m'`
export GREEN=`echo -e '\033[0;32m'`
export NOCOLOR=`echo -e '\033[0m'`
export LESS="-iMSx4 -FXR"
# Breaks man
#export PAGER="sed \"s/^\(([0-9]\+ [rows]\+)\)/$GREEN\1$NOCOLOR/;s/^\(-\[\ RECORD\ [0-9]\+\ \][-+]\+\)/$GREEN\1$NOCOLOR/;s/|/$GREEN|$NOCOLOR/g;s/^\([-+]\+\)/$GREEN\1$NOCOLOR/\" 2>/dev/null | less"
# export PAGER="/usr/bin/most -s"
export PAGER="/usr/bin/less"

## Coloring with less
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal


alias pacaur='makeopts="-A" pacaur'

