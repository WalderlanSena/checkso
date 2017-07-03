#!/bin/bash
# CheckSO - Verifique qual SO(Sistema Operacional) está rodando na máquina
# Version: 0.0.1
# Developer: Walderlan Sena <eu@walderlan.xyz>
# License: MIT <https://opensource.org/licenses/MIT>
# Github: WalderlanSena <https://www.github.com/WalderlanSena>
# Site: Mentes Virtuais Sena <https://www.mentesvirtuaissnea.com>


# --- Inicio do script ---

# Padrão do TTL retornado pelo sistema operacionais listados abaixo

#  +-------------------+
#  |    SO       TTL   |
#  +----------|--------+
#  | Unix     |   255  |
#  | Linux    |   64   |
#  | Windows  |   128  |
#  | OsX      |    ?   |
#  +----------+--------+

clear   #Limpando a tela do terminal
 
# Inicio tela de splash
echo -e "\033[31m
              ____  _               _      ____   ___               
             / ___ | |__   ___  ___| | __ / ___| / _ \\ 
             | |   | '_ \\ / _ \\/ __| |/ / \\___ \\| | | |
             | |___| | | |  __/ (__|   <   ___) | |_| |
              \\____|_| |_|\\___|\\___|_|\\_\\ |____/ \\___/ 
                                                v-0.0.1\033[0m
                \033[34m>Identifique o SO da máquina "pingada"<                                                 
                        eu@walderlan.xyz
                      Autor: Walderlan Sena\033[0m
          
    "
#end tela
echo -e "\t[-] Inicializando a requisição via PING\n"

if [ ! -n "$1" ] 
then
  echo -e "\t[ ERROR ] Passe o IP da máquina"
  exit 1
else

  valorSO=$(ping -c1 $1 | grep -o -e 'ttl=[0-9]*' | sed 's/ttl=//g')   #Captura o valor do retorno do TTL

  #Veficação do SO baseando-se no padrão definido acima
  #
  # Lembrando que a cada vez que um pacote passa por roteador ele decremente 2 no valor do TTL
  # Sendo assim o valor talvez tenha que ser ajustado,ou simplismente reavaliado as verificações do "test"
  #
  if [ $valorSO -eq 64  ]
  then
    echo -e "\t[ OK ] Sistema Operacional : aproximadamente - GNU/Linux" 
  elif [ $valorSO -eq 128 ]
  then
    echo -e "\t[ OK ] Sistema Operacional : Aproximadamente - Microsoft Windows"
  elif [ $valorSO -eq 255 ]
  then
    echo -e "\t[ OK ] Sistema Operacional : Aproximadamente - Unix"
  else
    echo -e "\t[ OK ] Desculpe: Sistema não identificado :("
  fi
fi # end script




