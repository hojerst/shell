if [ "$UID" = 0 ] ; then
    export PS1='\[\e[01;31m\]\u@\h \[\e[01;34m\]\w$(__git_ps1 " \[\e[01;33m\][%s]")\[\e[00m\]\$ '
else
    export PS1='\[\e[01;32m\]\u@\h \[\e[01;34m\]\w$(__git_ps1 " \[\e[01;33m\][%s]")\[\e[00m\]\$ '
fi
