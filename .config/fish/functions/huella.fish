function huella --wraps='pkill -9 fprintd' --description 'alias huella=pkill -9 fprintd'
    pkill -9 fprintd $argv
end
