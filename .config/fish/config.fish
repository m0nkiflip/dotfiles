#Variables de entoro
set -gx MOZ_ENABLE_WAYLAND 1
set -gx QT_QPA_PLATFORM "wayland;xcb"
set -gx GDK_BACKEND "wayland,x11"

#Mensaje de bienvenida
set -g fish_greeting

#Comandos visuales
if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    starship init fish | source
end
