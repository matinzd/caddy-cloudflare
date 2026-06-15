FROM caddy:builder AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250

FROM caddy:alpine

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
