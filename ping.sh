#!/bin/bash

echo
echo  ############### PING ###############
echo
ping -s 1500 -c 5 192.168.1.1 > ping.txt

echo ""
echo "Teste de conectividade concluído!"
echo "" 
## Atribuindo a uma váriavel o resultado de um comando. 

resul=`cat ping.txt | grep % | awk '{print $6}'`

##resul=$(cat ping.txt | grep % | awk '{print $6}')

if [ $resul == "0%" ]; then
echo "Foi realizado um teste de conectividade do NOC para o roteador do cliente, segue abaixo o teste."
echo ""
tail -n 7 ping.txt
echo ""
echo "O teste realizado aponta que a conexão não apresenta perdas."
fi

if [ $resul != "0%" ]; then
echo "Foi realizado um teste de conectividade do NOC para o roteador do cliente, segue abaixo o teste"
echo ""
tail -n 7 ping.txt
echo ""
echo "O teste realizado aponta que a conexão apresenta perdas de "$resul"."
fi
