## Bash profile on login

* Default global profile : `/etc/profile`
* Profile on normal login : `~/.bashrc`
* Profile on xterm login : `~/.bash_login`

* Sample config
    ```bash
    unset ENV
    clear
    #Color Codes
    GREEN="[033[32;1m" 
    RED="[033[31;1m"
    YELLOW="[033[33;1m"
    CYAN="[033[36m"
    BLUE="[033[34;1m"
    PURP="[033[35m"
    underline=$(tput smul)
    nounderline=$(tput rmul)
    bolded=$(tput bold)
    tab=$(echo "\t\t")
    hiligon=$(tput smso)
    hiligof=$(tput rmso)
    allreset=$(tput sgr0)
    #
    # Set up the Prompt
    HOST=$(hostname) ; export hostname
    vwho=$(whoami)
    PS1='${GREEN}${bolded}${vwho}@${HOST}${allreset}${PWD} λ ' ; export PS1
    PS2='~ '
    #

    #Alias
    alias l='ls -lrt'
    set -o vi
    ```