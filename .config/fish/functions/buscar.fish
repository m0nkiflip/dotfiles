function buscar --wraps='xbps-query -R' --description 'alias buscar=xbps-query -R'
    xbps-query -R $argv
end
