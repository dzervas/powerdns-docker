#!/bin/bash
if [ ! -f /var/empty/data/powerdns.sqlite ]; then
	echo "Creating PowerDNS database..."
	touch /var/empty/data/powerdns.sqlite
	sqlite3 /var/empty/data/powerdns.sqlite < /create_db.sql
fi

exec pdns_server --daemon=no --allow-recursion=172.17.0.0/24 \
	--disable-axfr=yes --local-address=0.0.0.0 --launch=gsqlite3 \
	--gsqlite3-database=/data/powerdns.sqlite --api=yes \
	--api-key=${API_KEY} --webserver=yes --webserver-address=0.0.0.0 \
	--webserver-port=80 --webserver-password=${API_KEY} "$@"

