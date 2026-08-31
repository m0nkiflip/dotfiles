function huerfanos --wraps='doas xbps-remove -oO' --description 'alias huerfanos=doas xbps-remove -oO'
    doas xbps-remove -oO $argv
end
