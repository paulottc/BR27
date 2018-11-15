#!/bin/bash

echo
 echo "*******************************"
 echo "           SINAL               "
 echo "*******************************"
 echo
 echo " " >  sinal.txt
 touch sinal.txt

 echo -n "Digite o PPOE do cliente:"
 echo
 read ppoe

#GERAR IMAGEM 

gnome-screenshot -a --file="/home/br27-nv1/Imagens/"$ppoe"_sinal.png"
     
 echo -n "Digite o MAC do cliente"
 echo
 read  mac

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
		
		echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT ANID, SLOT "$slot", PON "$pon", ONU "$onu". Nível de sinal: -"$sinal" dBm. Segue prints em anexo." >> sinal.txt 		

		fi	
		
		if [ $op2 == "2" ]; then

                echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT ANID, SLOT "$slot", PON "$pon", ONU "$onu"." >> sinal.txt
		echo "Não é possível verificar o nível de sinal, pois a ONU é incompatível com o software ANM2000. Segue prints em anexo. Segue prints em anexo." >> sinal.txt           

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

                echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT ALTIPLANO, SLOT "$slot", PON "$pon", ONU "$onu". Nível de sinal: -"$sinal" dBm. Segue prints em anexo." >> sinal.txt

                fi      

                if [ $op2 == "2" ]; then

                echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT ANID, SLOT "$slot", PON "$pon", ONU "$onu"." >> sinal.txt
		echo "Não é possível verificar o nível de sinal, pois a ONU é incompatível com o software ANM2000. Segue prints em anexo. Segue prints em anexo." >> sinal.txt           

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

                echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT ALTIPLANO, SLOT "$slot", PON "$pon", ONU "$onu". Nível de sinal: -"$sinal" dBm. Segue prints em anexo." >> sinal.txt

                fi      

                if [ $op2 == "2" ]; then

                echo "Foi identificado que o mac "$mac" está chegando na FibreHome, na OLT ANID, SLOT "$slot", PON "$pon", ONU "$onu"." >> sinal.txt
		echo "Não é possível verificar o nível de sinal, pois a ONU é incompatível com o software ANM2000. Segue prints em anexo. Segue prints em anexo." >> sinal.txt           

                fi 
		
		if [ $op2 == "3" ]; then

                echo "Foi identificado que o MAC do roteador está chegando no slot 19 da FiberHome, OLT Valentina." >> sinal.txt
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
