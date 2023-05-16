FROM alpine:3.17

WORKDIR /

RUN apk add freeradius freeradius-ldap python3

COPY converter.py .

CMD python3 converter.py && mv /clients.conf /etc/raddb/clients.conf \
    && export LDAP_PASS && sleep 10s && radiusd -X
