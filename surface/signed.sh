#!/usr/bin/env bash

# Global
time=$(date "+%Y.%m.%d")
echo $time
YOURemail=lixiangwhuerhy@gmail.com
YOURcountrycode=CN
YOURstate=HN
YOURcity=LD
YOURorganization=private

# Generated
echo "# This definition stops the following lines failing if HOME isn't
# defined.
HOME                    = .
RANDFILE                =\$ENV::HOME/.rnd
[ req ]
distinguished_name      = req_distinguished_name
x509_extensions         = v3
string_mask             = utf8only
prompt                  = no

[ req_distinguished_name ]
countryName             = $YOURcountrycode
stateOrProvinceName     = $YOURstate
localityName            = $YOURcity
0.organizationName      = $YOURorganization
commonName              = Secure Boot Signing Key
emailAddress            = $YOURemail

[ v3 ]
subjectKeyIdentifier    = hash
authorityKeyIdentifier  = keyid:always,issuer
basicConstraints        = critical,CA:FALSE
extendedKeyUsage        = codeSigning,1.3.6.1.4.1.311.10.3.6
nsComment               = \"OpenSSL Generated Certificate\" " >   mokconfig.cnf

#step 2 Create the public and private key for signing the kernel:
openssl req -config ./mokconfig.cnf  -new -x509 -newkey rsa:2048 -nodes -days 36500 -outform DER   -keyout "MOK.priv" -out "MOK.der"

  #step3 Convert the key also to PEM format (mokutil needs DER, sbsign needs PEM):
  openssl x509 -in MOK.der -inform DER -outform PEM -out MOK.pem

  #step4 Enroll the key to your shim installation:
  sudo mokutil --import MOK.der

  echo "Restart your system. You will encounter a blue screen of a tool called MOKManager. Select \"Enroll MOK\" and then \"View key\".
  Make sure it is your key you created in step 2. Afterwards continue the process and you must enter the password which you provided in step 4.
  Continue with booting your system. "
  read -rp "Do you want reboot? (type y or n) " restart;echo
  if [ "$restart" = "y" ]; then
    reboot
else
	echo "Done"
fi
