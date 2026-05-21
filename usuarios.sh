#!/bin/bash
#usuarios.sh
#mostra os logins e nomes de usuários do sistema
#obs.: lê dados do arquivo /etc/passwd
#Vitor Dourado, Maio de 2026

#Versão 1: Mostra usuários e nomes separados por TAB
#Versão 2: Adicionado suporte a ação -h

MENSAGEM_USO="
Uso: $0 [-h]

        -h      Mostra esta tela de ajuda e sai
"
VERSA0="
Uso: $0 [-v]
        -v      versao 1.0
"
#Tratamento das opções de linha de comando
if test "$1" = "-h"
then
   echo "$MENSAGEM_USO"
elif
   test "$1" = "-v"
then
   echo "$VERSAO"
   exit 0
fi

#Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
