## Tips on keytool command

* To create a self-signed certificate for WEB server
```
openssl genrsa -des3 -passout pass:password -out apache_key.pem 1024
openssl req -new -key apache_key.pem -passin pass:password -out apache_crt.pem -subj "/C=<COUNTRY CODE>/ST=<HEAD OFFICE COUNTRY CODF>/L=<HEAD OFFICE COUNTRY CODF>/O=<ALIAS>/OU=<ALIAS>/CN=<WEB server/LB name>"
cp apache_key.pem apache_key.org
openssl rsa -in apache_key.org -passin pass:password -out apache_key.pem
openssl x509 -req -days 365  -in apache_crt.pem -signkey apache_key.pem -out apache_cert.pem
```

* To import the above created certificate in cacerts on JBOSS/WAS:
    * apache is the alias for the above certificate.
    * test@123 is the password for cacerts
```
keytool -import -alias apache_core -keystore cacerts -storepass test@123 -file apache_cert.pem –noprompt
```

* Self-signed certificate for JBOSS also needs to be imported in cacerts
```
keytool -genkey -alias <AliasName> -keystore key.jks -storepass test@123 -keypass changeit -keyalg RSA -validity 365 -sigalg SHA1withRSA -dname "cn=<JBOSS Server Name>,ou=Org,o=jA,st=KA,c=IN"
keytool -export -keystore key.jks -alias <AliasName> -file cert.der -storepass test@123
keytool -import -alias <AliasName> -keystore cacerts -storepass test@123 -file cert.der -noprompt
```
