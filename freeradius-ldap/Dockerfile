FROM alpine:3.17

WORKDIR /config

COPY converter.py .
COPY clients.json .

RUN apk add python3 && python3 converter.py && apk del python3 && \
    apk add freeradius freeradius-ldap && mv /config/clients.conf /etc/raddb/clients.conf

CMD chgrp radius /etc/raddb/mods-available/ldap && chmod 640 /etc/raddb/mods-available/ldap && sleep 10s && radiusd -X
