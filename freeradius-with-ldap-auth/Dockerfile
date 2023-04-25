FROM alpine:3.17

WORKDIR /

RUN apk add freeradius freeradius-ldap python3

COPY converter.py .
COPY ldap.conf /etc/raddb/mods-available/ldap

CMD python3 converter.py && mv /clients.conf /etc/raddb/clients.conf \
    && LDAP_PASS="$(cat $LDAP_PASS_FILE)" && export LDAP_PASS && sleep 10s && radiusd -X
