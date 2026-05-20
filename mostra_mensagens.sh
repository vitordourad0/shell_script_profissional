#!/bin/bash
### Configuração do programa mostra_mensagens.sh
### Use 0(zero) para desligar as opções a 1(um) pra ligar 
### O padrão é zero para todas(desligado)

chave=1
test $chave = 1 && echo LIGADA

if test $chave = 1
then
    echo VAMO TÁ LIGADA
fi
