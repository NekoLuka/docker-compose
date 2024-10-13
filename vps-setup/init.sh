set -u

frps_auth_token=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n)
echo FRPS_AUTH_TOKEN=$frps_auth_token 1 > frps.env

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1 > authelia/secrets/JWT_SECRET
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1 > authelia/secrets/SESSION_SECRET
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1 > authelia/secrets/STORAGE_ENCRYPTION_KEY

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1 > lldap_config/JWT_SECRET
ldap_admin_pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
echo $ldap_admin_pass > lldap_config/ADMIN_PASS

ldap_authelia_password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
echo $ldap_authelia_password > authelia/secrets/LDAP_PASSWORD

openssl genpkey -algorithm RSA -out lldap_config/private.key
openssl req -x509 -days 3650 -key lldap_config/private.key -out lldap_config/certificate.crt
echo Created key pair for LDAPS

echo Create user "authelia_bind_user" in LLDAP with password: $ldap_authelia_password
