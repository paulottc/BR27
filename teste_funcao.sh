 #!/bin/sh

# Declaração de uma função em ShellScript
function BoasVindas(){
    echo -e "\n\nSeja Bem Vindo $1 \n\n"
}

echo -n "Digite seu nome: "
##read _NOME
_NOME=PAUL  
# A variável _NOME receberá o que foi digitado pelo usuário

BoasVindas "$_NOME"
# Aqui passamos o conteúdo da variável _NOME como o 1º parâmetro para a função BoasVindas() 
