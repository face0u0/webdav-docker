FROM alpine

ENV USERNAME="" PASSWORD="" UID="" GID=""

COPY nginx.conf /opt/nginx/conf/nginx.conf

COPY entrypoint.sh /

RUN apk update && \
    apk add --no-cache pcre libxml2 libxslt && \
    apk add --no-cache apache2-utils && \
    apk add --no-cache gcc make libc-dev pcre-dev zlib-dev libxml2-dev libxslt-dev && \
    cd /tmp && \
    wget https://github.com/nginx/nginx/archive/master.zip -O nginx.zip && \
    unzip nginx.zip && \
    wget https://github.com/arut/nginx-dav-ext-module/archive/master.zip -O dav-ext-module.zip && \
    unzip dav-ext-module.zip && \
    cd nginx-master && \
    ./auto/configure --prefix=/opt/nginx --with-http_dav_module --add-module=/tmp/nginx-dav-ext-module-master && \
    make && make install && \
    cd /root && \
    chmod +x /entrypoint.sh && \
    apk del gcc make libc-dev pcre-dev zlib-dev libxml2-dev libxslt-dev && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

EXPOSE 80

ENTRYPOINT /entrypoint.sh && /opt/nginx/sbin/nginx -g "daemon off;"
