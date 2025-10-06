function usepsp() {
    export PSPDEV=/usr/local/pspdev
    export VITASDK=""
    export PATH=$(echo $PATH | tr ':' '\n' | grep -v '/usr/local/vitasdk/bin' | grep -v '/usr/local/pspdev/bin' | tr '\n' ':')
    export PATH=$PSPDEV/bin:$PATH
}


function usevita() {
    export VITASDK=/usr/local/vitasdk
    export PSPDEV=""
    export PATH=$(echo $PATH | tr ':' '\n' | grep -v '/usr/local/pspdev/bin' | grep -v '/usr/local/vitasdk/bin' | tr '\n' ':')
    export PATH=$VITASDK/bin:$PATH
}

