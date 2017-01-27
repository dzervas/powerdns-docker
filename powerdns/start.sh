#!/bin/bash
mkdir -p /etc/powerdns/sqlite3/
if [ ! -f /etc/powerdns/sqlite3/powerdns.sqlite ]; then
	echo "Creating PowerDNS database..."
	touch /etc/powerdns/sqlite3/powerdns.sqlite
	sqlite3 /etc/powerdns/sqlite3/powerdns.sqlite < /create_db.sql
fi

chown pdns:pdns /etc/powerdns/sqlite3/ -R

exec pdns_server --daemon=no --allow-recursion=172.17.0.0/24 \
	--disable-axfr=yes --local-address=0.0.0.0 --launch=gsqlite3 \
	--gsqlite3-database=/etc/powerdns/sqlite3/powerdns.sqlite --api=yes \
	--api-key="Something very hard! :D" --webserver=yes --webserver-address=0.0.0.0 \
	--webserver-port=80 --webserver-password="Something very hard! :D" "$@"

