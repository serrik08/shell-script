#!/bin/bash

update() {

sudo apt-get update;

sudo apt-get upgrade;
    
if [ $? -ne 0 ]; then
    echo "UBUNTU NO SE ACTUALIZO CORRECTAMENTE "
else 
    sudo apt-get autoclean;
    sudo apt-get clean;
    sudo apt-get autoremove
    echo "UBUNTU SE ACTUALIZO CORRECTAMENTE "        
fi
}

update