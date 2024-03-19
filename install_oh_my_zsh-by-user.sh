#!/bin/bash

# Verificar si se proporcionó el nombre de usuario
if [ $# -eq 0 ]; then
    echo "No se proporcionó el nombre de usuario linux."
    exit 0
else
    echo "El nombre de usuario linux proporcionado es: $1"

    # Verificar si Oh My Zsh está instalado
    if [ -d "$HOME/.oh-my-zsh" ] && [ -d "/home/$1/.oh-my-zsh" ]; then
        echo "Oh My Zsh ya está instalado. Saliendo."  
        exit 0      
    fi

    # Instalar Oh My Zsh
    echo "Instalando Oh My Zsh..."
    apt-get update
    apt-get install zsh -y
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Personalizar el tema de Zsh (opcional)
    echo "Personalizando el tema de Oh My Zsh..."
    # agnoster tjkirch robbyrussell random
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="random"/' ~/.zshrc

    # Instalar plugins (opcional)
    echo "Instalando plugins..."
    sed -i 's/plugins=(git)/plugins=(git z)/' ~/.zshrc

    # Configurar Zsh predeterminado
    echo "Configurando Zsh como la shell predeterminada..."
    chsh -s $(which zsh)
    chsh -s $(which zsh) $1

    # Recargar la configuración de Zsh
    echo "Recargando la configuración de Zsh..."
    zsh
    source ~/.zshrc

    echo "¡La instalación y configuración de Oh My Zsh se ha completado con éxito!"

fi
exit 0