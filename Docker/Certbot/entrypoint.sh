#!/bin/sh

if [ ! -f /etc/letsencrypt/live/marketplace/fullchain.pem ]
then
	echo "no certs found, attempting acme challenge"
	certbot certonly --webroot --webroot-path=/var/www/html --email $CONTACT_EMAIL --agree-tos --no-eff-email --force-renewal --cert-name marketplace $CERT_DOMAINS
else
	echo "found certs, attempting renewal"
	certbot renew
	exit 0
fi
