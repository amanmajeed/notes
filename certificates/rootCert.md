# 1. How to Create Root Certificate
1. Cleanup 
`rm -f root.key root.crt root.srl`
2. Create a root key
`openssl genrsa -out root.key 2048`
3. Self Sign the root key
`openssl req -x509 -new -nodes -key root.key -sha256 -days 9999 -out root.crt -config root.cnf`
4. Check the certificate
`openssl x509 -in root.crt -text -noout`
5. Add the root certificate to IE.

# 2. How to create a root signed certificate
1. Create a cnf file - `abc.aman.com.cnf`
```
[ req ]
default_bits            = 2048
default_keyfile         = abc.aman.com.crt
distinguished_name      = req_distinguished_name
#attributes             = req_attributes
#string_mask            = utf8only
prompt                  = no
[ req_distinguished_name ]
countryName             = IN
stateOrProvinceName     = TL
localityName            = Hyd
organizationName        = Company
organizationalUnitName  = Me
commonName              = abc.aman.com
emailAddress            = aman_majeed@gmail.com
```
2. Create crt file
* Set parameter
`serverName=$1`
* Cleanup
`rm -f ${serverName}.srl ${serverName}.crt ${serverName}.key ${serverName}.scr`
* Create a new certificate for the server needed.
`openssl genrsa -out ${serverName}.key 2048`
* Create the servers cnf file ${serverName}.cnf
* Create a certifiate signing request (CSR) for it.
`openssl req -new -key ${serverName}.key -out ${serverName}.csr -config ${serverName}.cnf`
* Sign the CSR with the root certificate.
`openssl x509 -req -extfile <(printf "subjectAltName=DNS:${serverName}") -in ${serverName}.csr -CA root.crt -CAkey root.key -CAcreateserial -out ${serverName}.crt -days 9999 -sha256`
* Check the certificate
`openssl x509 -in ${serverName}.crt -text -noout`

# 3. Change to Java format
* [Reference](https://docs.oracle.com/cd/E35976_01/server.740/es_admin/src/tadm_ssl_convert_pem_to_jks.html)
* Prep `server=$1`
* Export crt to p12 format 
`openssl pkcs12 -export -in $server.crt -inkey $server.key -out $server.p12 -name <AliasName> -CAfile root.crt -caname root -chain`
* Export crt to pkcs12
`openssl pkcs12 -export -out ${server}.pkcs12 -in ${server}.crt -inkey $server.key`
* Create key store
    * Give dummy values when asked
```
keytool -genkey -keyalg RSA -alias <AliasName> -keystore ${server}_keyA.jks 
keytool -delete -alias <AliasName> -keystore ${server}_keyA.jks
keytool -v -importkeystore -srckeystore ${server}.pkcs12 -srcstoretype PKCS12 -alias 1 -destalias <AliasName> -destkeystore ${server}_keyA.jks -deststoretype JKS
```

4. Verify the certificate
* Run
`
keytool -list -v -keystore ${server}_keyA.jks -storepass changeit`