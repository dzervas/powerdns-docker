#!/bin/sh

if [ -f /data/config.py ]; then
	cp /data/config.py /src/
fi
if [ ! -f /data/padmin.sqlite ]; then
	touch /data/padmin.sqlite
	python create_db.py
fi

python run.py
