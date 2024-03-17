#!/bin/bash

update() {

apt-get update;

apt-get upgrade;
    
if [ $? -ne 0 ]; then
    echo "UBUNTU NO SE ACTUALIZO CORRECTAMENTE "
else 
    apt-get autoclean;
    apt-get clean;
    apt-get autoremove
    echo "UBUNTU SE ACTUALIZO CORRECTAMENTE "        
fi
}

update