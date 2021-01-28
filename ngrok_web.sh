#!/bin/bash
#Colores
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
yellowColour="\e[0;33m\033[1m"
endColour="\033[0m\e[0m"

#CRTL-C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColour}Programa Terminado ${endColour}"
        exit 0
}

read -p "$(echo -e ${yellowColour}Ingresa el token ${endColour})" TOKEN

if [ -z "$TOKEN" ]
then 
echo -e "${redColour}No ingresaste el token!!!! ${endColour}"
exit 1

else
echo -e "\n${yellowColour}Instalando dependencias ${endColour}"
sudo apt update && sudo apt install -y snapd

echo -e "\n${yellowColour}Instalando SSH y chequeando el estado ${endColour}"
sudo apt install -y openssh-server && systemctl status ssh.service

echo -e "\n${yellowColour}Instalando ngrok via SNAP ${endColour}"
sudo snap install ngrok

echo -e "\n${yellowColour}Autenticando ${endColour}"
ngrok authtoken "$TOKEN"

echo -e "\n${greenColour}Iniciando el tunel SSH ${endColour}"
ngrok http 80

fi