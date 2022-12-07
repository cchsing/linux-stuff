# Openssl use cases

---

## **Generate the Keys**

`openssl genrsa -out rootCAKey.pem 2048`

`openssl genrsa -des3 -out rootCAKey.pem 2048` - to protect key with passphrase

`openssl genrsa -des3 -passout pass:passphrase -out rootCA.key 2048`

`openssl rsa -in [original.key] -out [new.key]` - remove the passphrase

`openssl rsa -in [original.key] -out [new.key] -passin pass:passphrase`

## **Review the Keys**

`openssl rsa -in splunkCA.key -check`

`openssl rsa -in splunkCA.key -check -passin pass:passphrase` - passing in passphrase inline

---

## **Generate the CSR** - Certificate Signing Request

`openssl req -key domain.key -new -out domain.csr`

`openssl req -key domain.key -passin pass:passphrase -new -out domain.csr`

## **Review the CSR**

`openssl req -text -noout -verify -in CSR.csr`

### Create both the private key and CSR with a single command

`openssl req -newkey rsa:2048 -keyout domain.key -out domain.csr`

`openssl req -newkey rsa:2048 -nodes -keyout domain.key -out domain.csr` - unencrypted private key

### Create CSR Configuration

```
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = US
ST = California
L = San Fransisco
O = MLopsHub
OU = MlopsHub Dev
CN = demo.mlopshub.com

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = demo.mlopshub.com
DNS.2 = www.demo.mlopshub.com
IP.1 = 192.168.1.5
IP.2 = 192.168.1.6
```

---

## **Generate Certificates**

`openssl x509 -signkey domain.key -in domain.csr -req -days 3650 -out domain.crt`

`openssl req -key domain.key -new -x509 -days 3650 -out domain.crt` - Generate without CSR

### Create configuration file

```
cat > cert.conf <<EOF

authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = demo.mlopshub.com

EOF
```

### Generate SSL certificate with a self signed CA

`openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt -days 365 -sha256 -extfile cert.conf`

### Create private key and generate certificate simultaneously

`openssl req -x509 -sha256 -days 3650 -newkey rsa:2048 -keyout rootCA.key -out rootCA.crt`

## **Review the Certificates**

`openssl x509 -in certificate.crt -text -noout`

---

## **Convert Certificates Formats**

### PEM to DER

`openssl x509 -in domain.crt -outform der -out domain.der`

### PEM to PKCS12

`openssl pkcs12 -inkey domain.key -in domain.crt -export -out domain.pfx`

---

## **Verification**

1. SSL Certificate: `openssl x509 –noout –modulus –in <file>.crt | openssl md5`
2. Private Key: `openssl rsa –noout –modulus –in <file>.key | openssl md5`
3. CSR: `openssl req -noout -modulus -in <file>.csr | openssl md5`

---

## Miscellaneous

- openssl rand -base64 12
