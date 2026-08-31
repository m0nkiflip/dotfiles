function power-sav --wraps='doas tlp power-saver' --description 'alias power-sav=doas tlp power-saver'
    doas tlp power-saver $argv
end
