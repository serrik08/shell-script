#!/bin/bash


# Verificar si Oh My Zsh está instalado
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh ya está instalado. Saliendo."
    exit 0      
fi

# Instalar Oh My Zsh
echo "Instalando Oh My Zsh..."
sudo apt-get update
sudo apt-get install zsh -y
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Personalizar el tema de Zsh (opcional)
echo "Personalizando el tema de Oh My Zsh..."
# agnoster tjkirch robbyrussell xiong-chiamiov random
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="random"/' ~/.zshrc
#sed -i 's/ZSH_THEME="tjkirch"/ZSH_THEME="random"/' ~/.zshrc

# Instalar plugins (opcional)
echo "Instalando plugins..."
sed -i 's/plugins=(git)/plugins=(git z)/' ~/.zshrc

# Configurar Zsh predeterminado
echo "Configurando Zsh como la shell predeterminada..."
chsh -s $(which zsh)

# Recargar la configuración de Zsh 
echo "Recargando la configuración de Zsh..."
zsh
source ~/.zshrc

echo "¡La instalación y configuración de Oh My Zsh se ha completado con éxito!"
exit 0