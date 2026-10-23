#!/bin/sh
set -Eeo pipefail

php-fpm84 -F -y /srv/php-fpm.conf &

caddy run --config /srv/Caddyfile &

wait -n
