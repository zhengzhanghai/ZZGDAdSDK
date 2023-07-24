
#!/bin/sh

export LANG=en_US.UTF-8


## green to echo
function greenEcho(){
    echo -e "\033[32m[ $1 ]\033[0m"
}

#pod 验证......................
greenEcho "pod spec lint......................."
/usr/local/bin/pod spec lint --use-libraries --allow-warnings --verbose

