#!/bin/bash

# Verificar si Oh My Zsh está instalado
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh no está instalado. Saliendo."
    exit 0
fi

# Desinstalar Oh My Zsh
echo "Desinstalando Oh My Zsh..."
rm -rf "$HOME/.oh-my-zsh"

# Restaurar la configuración de la shell predeterminada
echo "Restaurando la configuración de la shell predeterminada..."
chsh -s $(which bash)

echo "¡Oh My Zsh se ha desinstalado correctamente!"