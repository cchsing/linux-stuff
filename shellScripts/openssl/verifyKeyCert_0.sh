#!/bin/bash

if [[ -n $1 && -n $2 ]]; then
    var1=$(openssl rsa -noout -modulus -in $1 | openssl md5)
    echo $var1
    var2=$(openssl x509 -noout -modulus -in $2 | openssl md5)
    echo $var2
    if [[ $var1 == $var2 ]]; then
        echo "$1 and $2 valid"
    else
        echo "$1 and $2 not valid"
    fi 
else
    echo "no sufficient argument."
fi 