#!/bin/bash
#Colores
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
blueColour="\e[0;34m\033[1m"
purpleColour="\e[0;35m\033[1m"
endColour="\033[0m\e[0m"

#CRTL-C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColour}Programa Terminado ${endColour}"
        exit 0
}

#variables
TOKEN=token

echo -e "${redColour}El programa necesita que declares el token en el script!!!! ${endColour}"

echo -e "\n${yellowColour}Instalando dependencias ${endColour}"
sudo apt update && sudo apt install -y snapd

echo -e "\n${yellowColour}Instalando SSH y chequeando el estado ${endColour}"
sudo apt install -y openssh-server 

echo -e "\n${yellowColour}Instalando ngrok via SNAP ${endColour}"
sudo snap install ngrok

echo -e "\n${yellowColour}Autenticando ${endColour}"
ngrok authtoken "$TOKEN"

echo -e "\n${greenColour}Iniciando el tunel SSH ${endColour}"
ngrok tcp 22


