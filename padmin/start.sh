#!/bin/sh

if [ -f /data/config.py ]; then
	cp /data/config.py /src/
fi
if [ ! -f /data/padmin.sqlite ]; then
	touch /data/padmin.sqlite
	python create_db.py
	python create_admin.py root password
fi

python run.py
