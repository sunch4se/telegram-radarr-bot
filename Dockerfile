FROM arm64v8/node:alpine

COPY --from=resin/aarch64-alpine:latest ["/usr/bin/qemu*", "/usr/bin/resin-xbuild*", "/usr/bin/cross-build*",  "/usr/bin/"]

RUN [ "cross-build-start" ]

RUN apk add --update git

RUN mkdir /app && \
    git clone https://github.com/itsmegb/telegram-radarr-bot.git /app

WORKDIR /app

RUN npm install

RUN ln -s /app/config /config

RUN apk del git

RUN [ "cross-build-end" ]

VOLUME /config

CMD ["node", "radarr.js"]
