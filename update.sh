#!/bin/bash

update() {

    # Script para actualizar apt
    sudo apt-get update -y;
    #sudo apt-get upgrade -y;
        
    if [ $? -ne 0 ]; then
        echo "UBUNTU NO SE ACTUALIZO CORRECTAMENTE."
    else 
        sudo apt-get autoclean;
        sudo apt-get clean;
        sudo apt-get autoremove
        
        echo "UBUNTU SE ACTUALIZO CORRECTAMENTE."
    fi

    # Verificar si Curl ya está instalado
    if ! command -v curl &> /dev/null; then
        sudo apt update
        sudo apt install curl -y

        # Si estás en una distribución diferente, debes ajustar los comandos
        # sudo yum install -y curl
        # o
        # sudo dnf install -y curl
    else
        echo "CURL YA ESTA INSTALADO."
    fi

    # Verificar la instalación
    curl --version

}

update