function actualizar --wraps='doas xbps-install -Syu' --description 'alias actualizar=doas xbps-install -Syu'
    doas xbps-install -Syu $argv
end
