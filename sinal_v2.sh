#!/bin/bash

echo
 echo "*******************************"
 echo "           SINAL               "
 echo "*******************************"
 echo
 echo " " >  sinal.txt
 touch sinal.txt

 echo -n "Digite o MAC do cliente:"
 echo
 read  mac
### GERAR UM MEC SEPADO POR -
 mac2=$mac
 echo 
 echo ${mac2//:/-}

 echo -n "Digite o PPOE do cliente:"
 echo
 read ppoe
 echo

#GERAR IMAGEM 

gnome-screenshot -a --file="/home/br27-nv1/Imagens/"$ppoe"_sinal.png"
     
 ## DADOS 
 echo -n "SLOT:"
 echo
 read slot

 echo -n "PON:"
 echo
 read pon

 echo -n "ONU:"
 echo
 read onu

 echo -n "SINAL:"
 echo
 read sinal      

##### FUNÇÕES #####

## FUNÇÃO PARA SINAL OK
function sinalok(){
echo "Foi realizado acesso à gerência da OLT Fiberhome $1 e identificado que o endereço MAC do roteador ("$mac"), está chegando no SLOT "$slot", PON "$pon", ONU "$onu". A partir desta informação, foi constatado que o nível de sinal da fibra estava em -"$sinal"dBm." >> sinal.txt
echo "Uma imagen exibindo a identificação da ONU e o nível de sinal da fibra, foi adicionada em Anexos como registro." >> sinal.txt
}

## FUNÇÃO  PARA SINAL INCOMPATÍVEL
function incompativel(){
echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT $1, SLOT "$slot", PON "$pon", ONU "$onu"." >> sinal.txt
echo "Não é possível verificar o nível de sinal, pois a ONU é incompatível com o software ANM2000. Segue prints em anexo." >> sinal.txt 
}


 echo -n "Escolha o tipo:"
 echo
 echo "1 FiberHome"
 echo "2 CiaNet" 
 echo 
 read  op

if [ $op == "1" ]; then

 echo -n "Qual a OLT":
 echo 
 echo "1 ANID"
 echo "2 ALTIPLANO"
 echo "3 VALENTINA" 
 echo
 read  olt
 	
	#OLT ANID#
	if [ $olt == "1" ]; then	
	 echo "Escolha uma das opções:"
	 echo
	 echo "1 SINAL OK"
         echo "2 ONU INCOMPATIVEL" 
 	 echo
 	 read  op2
		
		if [ $op2 == "1" ]; then		
		
		## DECLARAÇÃO DA VARIÁVEL 
		olt_ok=ANID
		
	        ## CHAMANDO A FUNÇÃO, PASSANDO O PARAMETRO		
	        sinalok "$olt_ok"

		fi	
		
		if [ $op2 == "2" ]; then

                ## DECLARAÇÃO DA VARIÁVEL 
                olt_in=ANID

                ## CHAMANDO A FUNÇÃO, PASSANDO O PARAMETRO              
                incompativel "$olt_in"

                fi      
		
	 fi
        
	 #OLT ALTIPLANO#
	 if [ $olt == "2" ]; then        
         echo "Escolha uma das opções:"
         echo
	 echo "1 SINAL OK"
         echo "2 ONU INCOMPATIVEL" 
         echo
         read  op2

                if [ $op2 == "1" ]; then

		## DECLARAÇÃO DA VARIÁVEL 
                olt_ok=ALTIPLANO

                ## CHAMANDO A FUNÇÃO, PASSANDO O PARAMETRO
                sinalok "$olt_ok"
	
                fi      

                if [ $op2 == "2" ]; then
	 
		## DECLARAÇÃO DA VARIÁVEL 
                olt_in=ALTIPLANO

                ## CHAMANDO A FUNÇÃO, PASSANDO O PARAMETRO
                incompativel "$olt_in"

                fi      

         fi

	 #OLT VALENTINA#
         if [ $olt == "3" ]; then        
         echo "Escolha uma das opções:"
         echo
	 echo "1 SINAL OK"
         echo "2 ONU INCOMPATIVEL" 
         echo "3 SLOT 19" 
	 echo
         read  op2

                if [ $op2 == "1" ]; then

		## DECLARAÇÃO DA VARIÁVEL 
                olt_ok=VALENTINA

                ## CHAMANDO A FUNÇÃO, PASSANDO O PARAMETRO
                sinalok "$olt_ok"

                fi      

                if [ $op2 == "2" ]; then
		
		## DECLARAÇÃO DA VARIÁVEL 
                olt_in=VALENTINA

                ## CHAMANDO A FUNÇÃO, PASSANDO O PARAMETRO
                incompativel "$olt_in"

                fi 
		
		if [ $op2 == "3" ]; then

                echo "Foi identificado que o MAC "$mac" está chegando no slot 19 da FiberHome, OLT Valentina." >> sinal.txt
                echo "Obs.: Não é possível identificar o nível de sinal das SFP's, através do software ANM2000." >> sinal.txt           

                fi 
     
         fi
fi

 echo "Número do chamado:"
 echo
 read  num

echo
echo "" >> sinal.txt
echo "*******************************" >> sinal.txt
echo "          ANEXOS               " >> sinal.txt
echo "*******************************" >> sinal.txt
echo "" >> sinal.txt
echo "Atendimento "$num": Nível de sinal." >> sinal.txt


 echo
 echo "*******************************"
 echo "          RESUMO               "
 echo "*******************************"
 echo

cat sinal.txt
