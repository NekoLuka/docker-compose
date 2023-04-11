FROM alpine:3.17

WORKDIR /config

COPY converter.py .
COPY clients.json .

RUN apk add freeradius freeradius-ldap python3

CMD python3 converter.py && mv /config/clients.conf /etc/raddb/clients.conf \
    && chgrp radius /etc/raddb/mods-available/ldap && chmod 640 /etc/raddb/mods-available/ldap && sleep 10s && radiusd -X
