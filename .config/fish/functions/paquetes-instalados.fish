function paquetes-instalados --wraps='xbps-query -m' --description 'alias paquetes-instalados=xbps-query -m'
    xbps-query -m $argv
end
