FROM php:5.6.16

# Prepare NGINX Unit repo and install
RUN sed -i 's/.*updates.*//' /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -y apt-transport-https ca-certificates wget && \
    wget https://nginx.org/keys/nginx_signing.key && \
    apt-key add nginx_signing.key && \
    echo "deb https://packages.nginx.org/unit/debian/ jessie unit" > /etc/apt/sources.list.d/unit.list && \
    echo "deb-src https://packages.nginx.org/unit/debian/ jessie unit" >> /etc/apt/sources.list.d/unit.list && \
    apt-get update -qq && \
    apt-get install -y --force-yes --no-install-recommends unit unit-php libphp5-embed php5-common php5-mysql && \
    apt-get remove -y apt-transport-https ca-certificates wget && \
    rm -rf /var/lib/apt/lists/*

# Configure the app
COPY php/api/* /var/www/html/ergast/
RUN sed -i 's/$format = "xml";/$format = "json";/' /var/www/html/ergast/index.php
RUN ln -sf /dev/stdout /var/log/unit.log
COPY unit_conf.json /var/lib/unit/conf.json

STOPSIGNAL SIGTERM

EXPOSE 80 8080
CMD ["unitd", "--no-daemon", "--control", "0.0.0.0:8080"]
