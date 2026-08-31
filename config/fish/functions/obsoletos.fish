function obsoletos --wraps='doas xbps-remove -O' --description 'alias obsoletos=doas xbps-remove -O'
    doas xbps-remove -O $argv
end
