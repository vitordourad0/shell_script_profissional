#!/bin/bash
#usuarios.sh
#
#mostra os logins e nomes de usuários do sistema
#obs.: lê dados do arquivo /etc/passwd

#Versão 1: Mostra usuários e nomes separados por TAB
#Versão 2: Adicionado suporte a ação -h
#Versão 3: Adicionado suporte á opção -V e opções inválidas
#Versão 4: Arrumando bug quando não tem opções, basename no
#	   nome do programa, -V extraindo direto dos cabeçalhos,
#	   adicionas opções --help e --version
#Versão 5: Adicionada opções -s e --sort

ordenar=0	# A saída deverá ser ordenada?

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V | -s]

	-h, --help	 Mostra esta tela de ajuda e sai
	-V, --version    Mostra a versão do programa e sai
	-s, --sort	 Ordena a listagem alfabeticamente
"

#Tratamento das opções de linha de comando
case "$1" in


   -s | --sort)
	ordenar=1
;;
 
   -h | --help)
	echo "$MENSAGEM_USO"
	exit 0
;;

   -V | --version)
		echo -n $(basename "$0")
		#Extrai a versão diretamente dos cabeçalhos do programa
		grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
		exit 0
;;

	*)
		if test -n "$1"
		then
			echo Opção inválida: $1
			exit 1
	fi
;;
esac

# Extrai a listagem
	lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena a listagem (se necessário)
if test "$ordenar" = 1
then
   lista=$(echo "$lista" | sort)
fi

# Mostra o resultado para o usuário
echo "$lista" | tr : \\t

#Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
