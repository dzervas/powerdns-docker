#!/bin/sh

if [ -f /data/config.py ]; then
	echo "Copying custom config.py..."
	cp /data/config.py /src/
fi
if [ ! -f /data/padmin.sqlite ]; then
	echo "Creating PowerDNS-Admin database..."
	touch /data/padmin.sqlite
	python create_db.py
fi
chown nobody /data/padmin.sqlite

exec sudo -Eu nobody python run.py
