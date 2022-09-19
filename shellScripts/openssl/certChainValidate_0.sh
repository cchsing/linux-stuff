#!/bin/bash

#initialization
cert0="CRTFile0"
cert1="CRTFile1"
subject0_h=0000
issuer0_h=1111
subject1_h=1111
issuer1_h=2222
echo "Initialize subject: $subject0 and issuer: $issuer0, loop start..."
for var in "$@"
do
    cert0=$cert1 #previous cert
    cert1=$var #current cert
    subject0_h=$subject1_h # previous cert subject hash
    issuer0_h=$issuer1_h # previous cert issuer hash

    subject1_h=$(openssl x509 -hash -issuer_hash -noout -in $cert1 | awk 'NR==1{print}')
    echo "Certificate: " $cert1 " Subject hash: " $subject1_h
    issuer1_h=$(openssl x509 -hash -issuer_hash -noout -in $cert1 | awk 'NR==2{print}')
    echo "Certificate: " $cert1 " Issuer hash: " $issuer1_h
    cert_info=$(openssl x509 -in $cert1 -text -noout | grep -E '(Subject|Issuer):')
    echo $cert_info
    echo "--------------------------------------------"

    if [[ $subject0_h == 1111 ]]; then
        continue
    else
        if [[ $issuer0_h == $subject1_h ]]; then 
            echo "******** Chain $cert0 to $cert1 is valid."
        else
            echo "******** Chain $cert0 to $cert1 is invalid."
            break
        fi
    fi
done