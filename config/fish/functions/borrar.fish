function borrar --wraps='doas xbps-remove -R' --description 'alias borrar=doas xbps-remove -R'
    doas xbps-remove -R $argv
end
