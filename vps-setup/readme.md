## Install
:warning: Warning: Everything here assumes you're using a Linux system with Bash

### Files to edit
- docker-compose.yml
- Caddyfile
- ntfy-server.yml
- frps.toml
- gatus/config/config.yaml
- authelia/secrets/JWT_SECRET
- authelia/secrets/SESSION_SECRET
- authelia/secrets/STORAGE_ENCRYPTION_KEY
- authelia/secrets/STORAGE_PASSWORD

### Source .environment file
Edit the .environment file so that it reflects your wished for values.
Then source the file to set all appropriate env variables.
```bash
source .environment
```

### Edit docker-compose.yml
Clone your git repo with your MkDocs config and docs to the server and follow the guide mentioned [here](#auto-update-docs-from-git).  
After that, run the following command.
```bash
sed -i s/EDIT-ME/$DOMAIN/ docker-compose.yml
```

### Edit Caddyfile
Run the following command, but the export part can be ommited when running after the previous command.
This also assumes you have the following subdomains: auth, gatus, docs, ntfy, frp, s3, nextcloud, immich and vaultwarden.
```bash
sed -i -e s/local.local/$DOMAIN/ -e '/Edit domain/d' Caddyfile
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