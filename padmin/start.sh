#!/bin/sh

if [ -f /data/config.py ]; then
	echo "Copying custom config.py..."
	cp /data/config.py /src/
fi
if [ ! -f /data/padmin.sqlite ]; then
	echo "Creating PowerDNS-Admin database..."
	touch /data/padmin.sqlite
	python create_db.py

	echo "Adding admin user..."
	python create_admin.py root password
fi

python run.py
