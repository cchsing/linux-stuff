# OPENSSL related bash scripting

To automate different use cases for the TLS related security stuff.

## Logs - 19 September 2022

1. verifyKeyCert_0.sh script used for validating the Private Key and the Signed Certificate (Public Key). Usage:
   "./verifyKeyCert_0.sh <privatekey.key> <myserverCert.crt>"
2. certChainValidate_0.sh script used for validating the chained certificates.
   - got issue with the way chain certificates are validated. It seems like the validation is not based the information contained in the section "Issuer:" and "Subject:"
   - further investigation seems to suggest the "X509v3 extensions:" play the roles for the validation
     - more specifically "X509v3 Authority Key Identifier:"
     - the information is related to the openssl configuration, openssl.cnf located in /etc/pki/tls
