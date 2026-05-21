#!/bin/bash
#usuarios.sh
#mostra os logins e nomes de usuários do sistema
#obs.: lê dados do arquivo /etc/passwd
#Vitor Dourado, Maio de 2026

cut -d : -f 1,5 /etc/passwd | tr : \\t

