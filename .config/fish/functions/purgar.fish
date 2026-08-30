function purgar --wraps='doas vkpurge rm all' --description 'alias purgar=doas vkpurge rm all'
    doas vkpurge rm all $argv
end
