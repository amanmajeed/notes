## OpenSSL Tips

* Check if host:port is enabled for TLS1.2
`
openssl s_client -connect host:port -tls1_2
`

* How to use openssl for Encryption/Decryption of text
    * Encrypt `openssl enc -aes-256-cbc -salt -a -in pass.txt -out pass.txt.enc -k <phasepass>`
    * Decrypt `openssl enc -aes-256-cbc -d -a -in pass.txt.enc -k <phasepass>`
    * <phasepass> is the  pass-phrase. It can be changed.
    * `pass.txt` can be deleted after getting the password `rm -f pass.txt`