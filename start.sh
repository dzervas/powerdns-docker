#!/bin/bash
touch /var/empty/data/powerdns.sqlite

exec pdns_server --daemon=no --allow-recursion=172.17.0.0/24 \
	--disable-axfr=yes --local-address=0.0.0.0 --launch=gsqlite3 \
	--gsqlite3-database=/data/powerdns.sqlite --webserver=yes \
	--webserver-address=0.0.0.0 --webserver-port=80 \
	--webserver-password=${WEBPASSWD} --api=yes --api-key=${WEBPASSWD} "$@"

