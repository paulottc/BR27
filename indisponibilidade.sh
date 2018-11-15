#!/bin/bash

 echo
 echo "*******************************"
 echo "      INDISPONIBILIDADE        "
 echo "*******************************"
 echo
 echo " " >  teste.txt
 touch teste.txt

 echo -n "Digite o número do contrato:"
 echo
 read cont

 echo "Cliente ligou informando que está sem conexão com a internet." >>  teste.txt
 echo "Contrato: "$cont"-A." >> teste.txt
 
 echo " " >> teste.txt


 echo -n "Digite a data da indisponibilidade"
 echo
 read data
     
 echo -n "Digite o horário da indisponibilidade"
 echo
 read  hora

echo "Cliente encontra-se conexão com a internet desde o dia: "$data" às "$hora"." >>  teste.txt
echo " " >> teste.txt
 echo "Tipo de indisponibilidade:"
 echo "1 - Individual"
 echo "2 - Rua" 
 echo
 read op

if [ $op == "2" ]; then

 echo -n "Digite a rua":
 echo
 read  rua
 
 echo -n "Digite a quantidade de clientes sem conexão"
 echo
 read  cli

echo "As conexões de "$cli" clientes moradores da "$rua", ficaram indisponíveis no mesmo horário, indicando um possível problema na caixa de atendimento ou rompimento de fibra." >>  teste.txt
fi


 echo "1 Roteador reiniciado"
 echo "2 Roteador reiniciado + Porta WAN"
 echo "3 Roteador reiniciado + Porta WAN + Fonte PoE"
 echo "4 Roteador reiniciado + Porta WAN + ONU"
 echo 
 read op2

 	if [ $op2 == "1" ]; then
	echo "De acordo com o cliente o roteador foi reiniciado, mas a conexão permanece indisponível. É necessário uma visita técnica no local." >>  teste.txt	
	fi
	
	 if [ $op2 == "2" ]; then
        echo "O cliente verificou, se o cabo estava conectado a interface WAN do roteador, além disso o roteador foi reiniciado pelo cliente, mas a conexão permanece indisponível. É necessário uma visita técnica no local." >>  teste.txt 
        fi

	if [ $op2 == "3" ]; then
        echo "De acordo com o cliente o roteador foi reiniciado, foi removido e recolocado o cabo UTP que chega até a interface WAN do roteador, a fonte PoE foi descontada da energia, foram removidos e recolocados os cabos que chegam até a porta LAN e PoE da fonte, mas a conexão permanece indisponível. É necessário uma visita técnica no local." >>  teste.txt 
        fi


		
                echo "1 Roteador configurado"
	 	echo "2 Roteador desconfigurado"
		echo 
		read op3

		if [ $op3 == "1" ]; then
        	echo " " >> teste.txt
		echo "De acordo informações dadas pelo cliente, o roteador não está desconfigurado." >>  teste.txt 
        	fi

         	if [ $op3 == "2" ]; then

		 echo "4 Roteador reiniciado + Porta WAN + ONU"
  		 echo 
   		 read mac

                 echo " " >> teste.txt
       		 echo "De acordo informações dadas pelo cliente, o roteador está desconfigurado." >>  teste.txt
		 echo "Mas, não requisão do usuário instalação no juniper, com o mac: "$mac"." >> teste.txt
        	fi

echo " " >> teste.txt
echo "O cliente foi informado sobre a abertura do atendimento e do prazo para que o problema seja resolvido." >> teste.txt

echo 
echo
echo "*******************************"
echo "     RESUMO DO ATENDIMENTO     "
echo "*******************************"
echo

cat teste.txt


