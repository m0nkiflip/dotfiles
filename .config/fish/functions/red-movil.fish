function red-movil --wraps='doas ip link set dev wlp0s20f3 mtu 1300' --description 'alias red-movil=doas ip link set dev wlp0s20f3 mtu 1300'
    doas ip link set dev wlp0s20f3 mtu 1300 $argv
end
