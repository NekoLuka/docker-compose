## Install
:warning: Warning: Everything here assumes you're using a Linux system with Bash

### Files to edit
- docker-compose.yml
- Caddyfile
- ntfy-server.yml
- frps.toml
- gatus/config/config.yaml
- authelia/config/configuration.yml
- authelia/secrets/JWT_SECRET
- authelia/secrets/SESSION_SECRET
- authelia/secrets/STORAGE_ENCRYPTION_KEY
- authelia/secrets/LDAP_PASSWORD

### Source .environment file
Edit the .environment file so that it reflects your wished for values.
Then source the file to set all appropriate env variables.
```bash
source .environment
```

### Edit docker-compose.yml
Steps to install the repo:
- By default does the LLDAP container run as root, to change that, edit uid and guid in the config.
- Clone your git repo with your MkDocs config and docs to the server and follow the guide mentioned [here](#auto-update-docs-from-git).  

After that, run the following command.
```bash
sed -i -e s/MKDOCS-FILE-PATH/$DOMAIN/ -e s/LDAP_DOMAIN/$LDAP_DOMAIN/ docker-compose.yml
```

### Edit Caddyfile
Run the following command.
This assumes you have the following subdomains: auth, ldap, gatus, docs, ntfy, frp, s3, nextcloud, immich and vaultwarden. If not, edit the Caddyfile to the wished for values.
```bash
sed -i -e s/local.local/$DOMAIN/ -e '/Edit domain/d' Caddyfile
```

### Edit ntfy-server.yml
```bash
sed -i -e s/NTFY_DOMAIN/$NTFY_DOMAIN/ ntfy-server.yml
```

### Edit frps.toml
```bash
sed -i -e s/FRPS_AUTH_TOKEN/$FRPS_AUTH_TOKEN/ frps.toml
```

### Edit Authelia config.yaml
There is some extra optional config in the file that is not automatically done.
These are the display name options for TOTP and webauthn. You can edit these manually.
```bash
sed -i -e s/local.local/$DOMAIN/ -e s/LDAP_DOMAIN/$LDAP_DOMAIN/ authelia/config/configuration.yml
```

## Manage

### Auto update docs from git

First clone your repository with a mkdocs.yml file and then
add the following cronjob to your crontab (edit <path> to your git directory)

```bash
# Run every 5 minutes
0-59/5 * * * * git -C <path>/wiki-files fetch && git -C <path>/wiki-files pull
```

### Get logs out of FRPS
```bash
docker compose cp frps:/frps.log frps.log
```

# TODO
- ~~config ntfy~~
- look at authelia config again
- Auto generate secrets for the secret files
