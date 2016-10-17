FROM alpine:edge
MAINTAINER Dimitris Zervas <dzervas@dzervas.gr>

RUN apk add --update bash pdns pdns-backend-sqlite3 && rm -rf /var/cache/apk/*
RUN mkdir -p /var/empty/var/run && chown -R pdns:pdns /var/empty
RUN ln -s /usr/lib/pdns/pdns/* /usr/lib/pdns/
RUN touch /var/empty/powerdns.sqlite

# Hack: The default configuration includes parameters that are not supported
# by the latest pdns
RUN sed -i -e "s/^use-logfile/#use-logfile/g" \
		-e "s/^wildcards/#wildcards/g" \
		-e "s/^setuid/#setuid/g" \
		/etc/pdns/pdns.conf

COPY start.sh /start.sh

CMD ["/start.sh"]
