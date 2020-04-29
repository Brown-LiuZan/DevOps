#Brown@copyright
#Version: 1.1
#Date: 20180527
#It should be under the following diretory: /etc/profile.d
#Besides, for Ubuntu, we should append following statements to .bashrc under user home directory:
#if [[ -f /etc/profile.d/brown-bash-config.sh ]]; then
#    . /etc/profile.d/brown-bash-config.sh
#fi


#Brown's special settings of bash.
#Modify command promote format
ip=$(ip addr | grep inet | grep brd | grep 'scope global')
ip=${ip#*inet }
ip=${ip%%/*}
if [[ -n $PS1 ]]; then
    #Non-printable sequences should be enclosed in \[ and \].
    if [[ $UID -eq 0 ]]; then
        PS1="\\n\[\e[1;31m\][\\u@${ip} \\t \\w]\\n\\$ \[\e[m\]"
    else
        PS1="\\n\[\e[1;36m\][\\u@${ip} \\t \\w]\\n\\$ \[\e[m\]"
    fi
fi

#Make sure we could always access bash from /usr/bin
BASH_CENTOS='/usr/bin/bash'
BASH_UBUNTU='/bin/bash'
if [[ ! -x $BASH_CENTOS ]]; then
    if [[ -x $BASH_UBUNTU ]]; then
        sudo ln -s $BASH_UBUNTU $BASH_CENTOS
    else
        echo 'Warning: unrecognized Linux distribution and failed to setup /usr/bin/bash' >&2
    fi
fi

#Make sure font display correctness
export LANG="zh_CN.utf8"
export LC_ALL="en_US.utf8"

#Enable coredumpe
ulimit -c unlimited

#File system travel.
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias lla='ls -la --color=auto'
alias lh='ls -h --color=auto'

export LZHOME="/home/brown"
export LZBIN="${LZHOME}/Bin"
export LZBAK="${LZHOME}/Backups"
export LZDWLD="${LZHOME}/Downloads"
export LZGIT="${LZHOME}/GitHub"
export TOOLCHAIN="${LZGIT}/CxxToolChain"
export CFS="${LZGIT}/CloudFileSystem"
export DEVOPS="${LZGIT}/DevOps-Studio-LiuZan"
export SHROOT="${LZGIT}/Bash-Studio-LiuZan"
export PYROOT="${LZGIT}/Python-Studio-LiuZan"
export CXXROOT="${LZGIT}/Cpp-Studio-LiuZan"
export CXXBUILD="${CXXROOT}/Build"
export GLROOT="${LZGIT}/Go-Studio-LiuZan"
PATH=${PATH}:${LZBIN}
export PATH=${PATH}:/usr/local/go/bin
export editor=vim

alias lzhome="cd ${LZHOME}"
alias lzbin="cd ${LZBIN}"
alias lzbak="cd ${LZBAK}"
alias lzdwld="cd ${LZDWLD}"
alias lzgit="cd ${LZGIT}"
alias toolchain="cd ${TOOLCHAIN}"
alias cfs="cd ${CFS}"
alias devops="cd ${DEVOPS}"
alias shroot="cd ${SHROOT}"
alias pyroot="cd ${PYROOT}"
alias cxxroot="cd ${CXXROOT}"
alias cxxbuild="cd ${CXXBUILD}"
alias glroot="cd ${GLROOT}"

cd ~

