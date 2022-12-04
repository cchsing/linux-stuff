# SSL Certifications

## Create Self-signed certificates using openssl

1. Generate the root CA Private Key

```
openssl genrsa -out rootCAKey.pem 2048
```

2. Generate the self-signed root CA Certificate

```
openssl req -x509 -sha256 -new -nodes -key rootCAKey.pem -days 3650 -out rootCACert.pem
```

3. Review the certificate

```
openssl x509 -in rootCACert.pem -text
```
