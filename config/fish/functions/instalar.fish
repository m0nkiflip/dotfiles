function instalar --wraps='doas xbps-install' --description 'alias instalar=doas xbps-install'
    doas xbps-install $argv
end
