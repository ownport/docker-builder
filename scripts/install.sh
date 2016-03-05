#!/bin/sh

set -eo pipefail
[[ "$TRACE" ]] && set -x || :

echo "[INFO] Installation of Docker Builder"

install_apps() {

    echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update runit privoxy darkhttpd && \
    rm -rf \
        /var/cache/apk/* \
        /etc/init.d/privoxy \
        /etc/privoxy/* \
        /etc/init.d/darkhttpd
}


#
#   runit
#
config_runit() {
    
    #
    #   svlogd (runit)
    #
    if  [ "${SVLOGD_ACTIVATE}" = "YES" ]
    then
        mkdir -p /etc/service/svlogd/ /var/log/svlogd/ && \
        printf "#!/bin/sh\nset -e\nexec svlogd -tt /var/log/svlogd/logs" > /etc/service/svlogd/run && \
        chmod +x /etc/service/svlogd/run && \
        echo "[INFO] svlogd support was activated"
    else:
        echo "[WARNING] svlogd service is not active"
        echo "[INFO] Set SVLOGD_ACTIVATE=YES to activate svlogd service"

    fi
}

#
#   privoxy
#
config_privoxy() {

    sed -i "s/:1000:/:65535:/" /etc/group /etc/passwd && \
    chown root:root /etc/privoxy /var/log/privoxy && \

    mkdir -p /etc/service/privoxy/ && \
    printf "#!/bin/sh\nset -e\nexec /usr/sbin/privoxy --no-daemon /etc/privoxy/config" > /etc/service/privoxy/run && \
    chmod +x /etc/service/privoxy/run && 
    echo "[INFO] runit support for privoxy was activated"
}

#
#   darkhttpd
#
config_darkhttpd() {

    mkdir -p /var/www/ && \
    echo "Static cache server" > /var/www/index.html && \


    mkdir -p /etc/service/darkhttpd/ && \
    printf "#!/bin/sh\nset -e\nexec /usr/bin/darkhttpd /var/www/" > /etc/service/darkhttpd/run && \
    chmod +x /etc/service/darkhttpd/run && \
    echo "[INFO] runit support for darkhttpd was activated"
}

#
#   clean 
#
config_apps() {
    
    config_runit && config_darkhttpd && config_privoxy
}

$@


