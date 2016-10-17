#!/bin/bash
WEBPASSWD=changeme

# Run pdns
exec /usr/sbin/pdns_server --daemon=no --allow-recursion=172.17.0.0/24 \
	--disable-axfr=yes --local-address=0.0.0.0 --launch=gsqlite3 \
	--webserver=yes --webserver-address=0.0.0.0 --webserver-port=80 \
	--webserver-password=${WEBPASSWD} --api=yes --api-key=${WEBPASSWD} "$@"

