#! /usr/bin/bash

# Brown's special settings of bash.
# This file should be under the /etc/profile.d for CentOS.
# This file is not intended to be run directly by user.

# Modify command promote format
if [[ -n $PS1 ]]; then 
    if [[ $UID -eq 0 ]]; then
        PS1="\e[1;31m[\\u@\\H \\t \\w]\\n\\$ \e[m"
    else
        PS1="\e[1;36m[\\u@\\H \\t \\w]\\n\\$ \e[m"
    fi
fi
