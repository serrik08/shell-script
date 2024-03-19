#!/bin/bash

# Verificar si se proporcionó el nombre de usuario
if [ $# -eq 0 ] && [ id "$1" &>/dev/null;]; then
    echo "No se proporcionó el nombre de usuario linux."
    exit 0
else

    # Verificar si Oh My Zsh está instalado
    if [ -d "$HOME/.oh-my-zsh" ] && [ -d "/home//.oh-my-zsh" ]; then
        echo "Oh My Zsh ya está instalado. Saliendo."
        exit 0
    fi

    # Desinstalar Oh My Zsh
    echo "Desinstalando Oh My Zsh..."
    rm -rf "$HOME/.oh-my-zsh"
    rm -rf "/home/$1/.oh-my-zsh"

    # Restaurar la configuración de la shell predeterminada
    echo "Restaurando la configuración de la shell predeterminada..."
    chsh -s $(which bash)
    chsh -s $(which bash) $1

    su $1

    echo "¡Oh My Zsh se ha desinstalado correctamente!"

fi
exit 0